import { useEffect, useMemo, useState } from 'react'
import { fetchMapAnimations, fetchCitiesByIds, fetchMapAnimationJunctionByIds, type MapAnimation, type MapCity } from '@/features/hero/api/mapAnimations'

export type LatLng = { lat: number; lng: number; name?: string | null }
export type Dot = { start: LatLng; end: LatLng }

function toLatLng(city?: MapCity | null): LatLng | null {
  if (!city || !city.location || !Array.isArray(city.location.coordinates)) return null
  const [lng, lat] = city.location.coordinates
  return { lat: Number(lat), lng: Number(lng), name: city.Name ?? null }
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
        startRefs[idx] = anim.start ?? null
        // collect start id if numeric
        const s = anim.start as any
        if (typeof s === 'number' || typeof s === 'string') needCityIds.push(s)

        const ends = anim.end_city ?? []
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
        joins.forEach((j) => needCityIds.push(j.Map_Cities_id))
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

        // Try O2M link rows first to preserve sort
        const o2mCandidates = ends
          .filter((e: any) => e && typeof e === 'object' && (e.city || e.city === 0))
          .map((e: any) => {
            let city: MapCity | null = null
            if (e.city && typeof e.city === 'object' && e.city.location) city = e.city
            else if (typeof e.city === 'number') city = byId.get(e.city) ?? null
            else if (typeof e.city === 'string') city = byId.get(Number(e.city)) ?? null
            return { city, sort: e.sort ?? 0 }
          })
          .filter((x: any) => x.city)
          .sort((a: any, b: any) => (a.sort ?? 0) - (b.sort ?? 0))

        let endLLs: LatLng[] = []
        if (o2mCandidates.length) {
          endLLs = o2mCandidates
            .map((x: any) => toLatLng(x.city as MapCity))
            .filter(Boolean) as LatLng[]
        } else {
          // Fallback to M2M array (objects or ids), keep listed order
          endLLs = (ends as any[])
            .map((e: any) => {
              if (e && typeof e === 'object' && e.location) return toLatLng(e as MapCity)
              // e may be a join id -> already converted to city rows in byId
              if (typeof e === 'number') return toLatLng(byId.get(e) ?? null)
              if (typeof e === 'string') return toLatLng(byId.get(Number(e)) ?? null)
              return null
            })
            .filter(Boolean) as LatLng[]
        }

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
