import { useEffect, useMemo, useState } from 'react'
import { fetchMapAnimations, fetchCitiesByIds, fetchMapAnimationJunctionByIds, type MapAnimation, type MapCity } from '@/features/hero/api/mapAnimations'

export type LatLng = { lat: number; lng: number; name?: string | null }
export type Dot = { start: LatLng; end: LatLng }

function toLatLng(city?: MapCity | null): LatLng | null {
  if (!city || !city.location || !Array.isArray(city.location.coordinates)) return null
  const [lng, lat] = city.location.coordinates
  return { lat: Number(lat), lng: Number(lng), name: city.name ?? null }
}

export default function useMapAnimationDots(heroId = 1) {
  const [dots, setDots] = useState<Dot[]>([])

  useEffect(() => {
    let active = true
    fetchMapAnimations(heroId).then(async (rows: MapAnimation[]) => {
      if (!active) return

      // Gather any unresolved city IDs (numeric) to hydrate
      const needCityIds: Array<number | string> = []
      const needJoinIds: Array<number | string> = []
      const startRefs: Array<MapCity | number | null> = []
      const endRefs: Array<{ animIndex: number; refs: any[] | number[] | null }> = []

      rows.forEach((anim, idx) => {
        startRefs[idx] = anim.start_city ?? null
        // collect start id if numeric
        const s = anim.start_city as any
        if (typeof s === 'number' || typeof s === 'string') needCityIds.push(s)

        const ends = anim.end_cities ?? []
        endRefs[idx] = { animIndex: idx, refs: ends }

        // M2M numeric ids
        if (Array.isArray(ends)) {
          ends.forEach((e: any) => {
            if (typeof e === 'number' || typeof e === 'string') {
              // For M2M Directus may return junction row ids instead of city ids
              needJoinIds.push(e)
            }
            // O2M link row with city id
            if (e && typeof e === 'object' && e.city && (typeof e.city === 'number' || typeof e.city === 'string')) {
              needCityIds.push(e.city)
            }
            // M2M join expanded: { cities_id: <id|object> }
            if (e && typeof e === 'object' && e.cities_id) {
              const c = e.cities_id
              if (typeof c === 'number' || typeof c === 'string') needCityIds.push(c)
            }
            // M2M expanded city object
            if (e && typeof e === 'object' && e.location) {
              // nothing to collect
            }
          })
        }
      })

      // If we have junction ids, resolve them to city ids
      if (needJoinIds.length) {
        const joins = await fetchMapAnimationJunctionByIds(needJoinIds)
        joins.forEach((j) => needCityIds.push(j.cities_id))
      }

      // Hydrate missing cities (now includes those from joins)
      const cityRows = await fetchCitiesByIds(needCityIds)
      const byId = new Map<number, MapCity>()
      cityRows.forEach((c) => byId.set(Number(c.id), c))

      // Build dots
      const out: Dot[] = []

      rows.forEach((anim, idx) => {
        // Resolve start city to object
        let startCity: MapCity | null = null
        const s = startRefs[idx]
        if (s && typeof s === 'object' && (s as any).location) startCity = s as MapCity
        else if (typeof s === 'number') startCity = byId.get(s) ?? null
        else if (typeof s === 'string') startCity = byId.get(Number(s)) ?? null

        const startLL = toLatLng(startCity)
        if (!startLL) return

        const ends = endRefs[idx].refs ?? []

        // Helper to resolve various shapes into a MapCity
        const resolveCity = (e: any): MapCity | null => {
          if (!e) return null
          // Direct city object
          if (e.location && Array.isArray(e.location.coordinates)) return e as MapCity
          // O2M link row: { city: <id|object> }
          if (e.city) {
            const c = e.city
            if (typeof c === 'object' && c.location) return c as MapCity
            const id = typeof c === 'string' ? Number(c) : (c as number)
            return byId.get(id) ?? null
          }
          // M2M join expanded: { cities_id: <id|object> }
          if (e.cities_id) {
            const c = e.cities_id
            if (typeof c === 'object' && c.location) return c as MapCity
            const id = typeof c === 'string' ? Number(c) : (c as number)
            return byId.get(id) ?? null
          }
          // Raw numeric/string id
          if (typeof e === 'number' || typeof e === 'string') {
            const id = typeof e === 'string' ? Number(e) : e
            return byId.get(id) ?? null
          }
          return null
        }

        // Build end city list preserving order; prefer link rows to preserve any sort
        const endLLs: LatLng[] = (ends as any[])
          .map((e: any) => toLatLng(resolveCity(e)))
          .filter(Boolean) as LatLng[]

        endLLs.forEach((end) => out.push({ start: startLL, end }))
      })

      if (!active) return
      setDots(out)
    })
    return () => {
      active = false
    }
  }, [heroId])

  return useMemo(() => dots, [dots])
}
