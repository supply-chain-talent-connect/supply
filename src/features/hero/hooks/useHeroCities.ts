import { useEffect, useState } from 'react'
import { fetchHeroCities, type HeroCity } from '@/features/hero/api/queries'

export type LatLng = { lat: number; lng: number; name?: string | null }

export function useHeroCities(heroId = 1) {
  const [cities, setCities] = useState<LatLng[]>([])

  useEffect(() => {
    let active = true
    fetchHeroCities(heroId).then((rows: HeroCity[]) => {
      if (!active) return
      const mapped: LatLng[] = rows
        .filter((r) => r.location && Array.isArray(r.location.coordinates))
        .map((r) => {
          const [lng, lat] = r.location!.coordinates
          return { lat: Number(lat), lng: Number(lng), name: r.name ?? null }
        })
      setCities(mapped)
    })
    return () => {
      active = false
    }
  }, [heroId])

  return cities
}

export default useHeroCities
