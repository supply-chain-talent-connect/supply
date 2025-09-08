import { readItems } from '@directus/sdk'
import { directus } from '@/lib/directus'

export type GeoPoint = { type: 'Point'; coordinates: [number, number] }
export type MapCity = { id: number; Name?: string | null; location?: GeoPoint | null }

// Two possible shapes are supported for end cities:
// - M2M directly to Map_Cities: end_city: MapCity[]
// - O2M link rows with M2O to Map_Cities: end_city: Array<{ id: number; city?: MapCity | null; sort?: number | null }>
export type MapAnimation = {
  id: number
  status: string
  hero?: number | null
  Name?: string | null
  sort?: number | null
  start?: MapCity | number | null
  end_city?: any[] | number[] | null
}

export async function fetchMapAnimations(heroId = 1): Promise<MapAnimation[]> {
  try {
    const items = (await directus.request(
      readItems<MapAnimation>('map_animation', {
        filter: { hero: { _eq: heroId }, status: { _eq: 'published' } },
        // Request fields for both modeling options
        fields: [
          'id',
          'status',
          'hero',
          'Name',
          'sort',
          // start as relation to Map_Cities
          'start.id',
          'start.Name',
          'start.location',
          // end_city as M2M directly to Map_Cities
          'end_city.id',
          'end_city.Name',
          'end_city.location',
          // end_city as O2M link rows with M2O to Map_Cities
          'end_city.city.id',
          'end_city.city.Name',
          'end_city.city.location',
          'end_city.sort',
        ],
        sort: ['sort', 'id'],
        limit: 50,
      }),
    )) as unknown as MapAnimation[]
    return Array.isArray(items) ? items : []
  } catch {
    return []
  }
}

export async function fetchCitiesByIds(ids: Array<number | string>): Promise<MapCity[]> {
  const uniq = Array.from(new Set(ids.map((v) => Number(v)).filter((v) => Number.isFinite(v))))
  if (uniq.length === 0) return []
  try {
    const rows = (await directus.request(
      readItems<MapCity>('Map_Cities', {
        filter: { id: { _in: uniq } },
        fields: ['id', 'Name', 'location'],
        limit: uniq.length,
      }),
    )) as unknown as MapCity[]
    return Array.isArray(rows) ? rows : []
  } catch {
    return []
  }
}

export type MapAnimationCityJunction = {
  id: number
  map_animation_id: number
  Map_Cities_id: number
}

export async function fetchMapAnimationJunctionByIds(ids: Array<number | string>): Promise<MapAnimationCityJunction[]> {
  const uniq = Array.from(new Set(ids.map((v) => Number(v)).filter((v) => Number.isFinite(v))))
  if (uniq.length === 0) return []
  try {
    const rows = (await directus.request(
      readItems<MapAnimationCityJunction>('map_animation_Map_Cities', {
        filter: { id: { _in: uniq } },
        fields: ['id', 'map_animation_id', 'Map_Cities_id'],
        limit: uniq.length,
      }),
    )) as unknown as MapAnimationCityJunction[]
    return Array.isArray(rows) ? rows : []
  } catch {
    return []
  }
}
