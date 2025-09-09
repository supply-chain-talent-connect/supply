import { readItems } from '@directus/sdk'
import { directus } from '@/lib/directus'

export type GeoPoint = { type: 'Point'; coordinates: [number, number] }
export type MapCity = { id: number; name?: string | null; location?: GeoPoint | null }

// Two possible shapes are supported for end cities:
// - M2M directly to Map_Cities: end_city: MapCity[]
// - O2M link rows with M2O to Map_Cities: end_city: Array<{ id: number; city?: MapCity | null; sort?: number | null }>
export type MapAnimation = {
  id: number
  hero?: number | null
  sort?: number | null
  start_city?: MapCity | number | null
  end_cities?: any[] | number[] | null
}

export async function fetchMapAnimations(heroId = 1): Promise<MapAnimation[]> {
  // Prefer the actual collection name used in your instance
  const collections = ['hero_animaton_steps', 'hero_animation_steps', 'Hero_Animation_Steps']
  const fields = [
    'id',
    'hero',
    'sort',
    'start_city.id',
    'start_city.name',
    'start_city.location',
    'end_cities.cities_id.id',
    'end_cities.cities_id.name',
    'end_cities.cities_id.location',
  ]
  for (const col of collections) {
    try {
      const items = (await directus.request(
        readItems(col, {
          filter: { hero: { _eq: heroId } },
          fields,
          sort: ['sort', 'id'],
          limit: 50,
        }),
      )) as unknown as MapAnimation[]
      if (Array.isArray(items) && items.length) return items
      if (Array.isArray(items)) return []
    } catch (e) {
      // try next variant
      if (import.meta.env.DEV) {
        // eslint-disable-next-line no-console
        console.warn(`[map] failed fetching ${col}`)
      }
    }
  }
  return []
}

export async function fetchCitiesByIds(ids: Array<number | string>): Promise<MapCity[]> {
  const uniq = Array.from(new Set(ids.map((v) => Number(v)).filter((v) => Number.isFinite(v))))
  if (uniq.length === 0) return []
  const collections = ['Map_Cities', 'map_cities']
  for (const col of collections) {
    try {
      const rows = (await directus.request(
        readItems(col, {
          filter: { id: { _in: uniq } },
          fields: ['id', 'name', 'location'],
          limit: uniq.length,
        }),
      )) as unknown as MapCity[]
      if (Array.isArray(rows) && rows.length) return rows
      if (Array.isArray(rows)) return []
    } catch (e) {
      if (import.meta.env.DEV) {
        // eslint-disable-next-line no-console
        console.warn(`[map] failed fetching cities from ${col}`)
      }
    }
  }
  return []
}

export type MapAnimationCityJunction = {
  id: number
  hero_animaton_steps_id: number
  cities_id: number
}

export async function fetchMapAnimationJunctionByIds(ids: Array<number | string>): Promise<MapAnimationCityJunction[]> {
  const uniq = Array.from(new Set(ids.map((v) => Number(v)).filter((v) => Number.isFinite(v))))
  if (uniq.length === 0) return []
  const collections = ['hero_animaton_steps_cities', 'hero_animation_steps_cities', 'Hero_Animation_Steps_cities']
  for (const col of collections) {
    try {
      const rows = (await directus.request(
        readItems(col, {
          filter: { id: { _in: uniq } },
          fields: ['id', 'hero_animaton_steps_id', 'cities_id'],
          limit: uniq.length,
        }),
      )) as unknown as MapAnimationCityJunction[]
      if (Array.isArray(rows) && rows.length) return rows
      if (Array.isArray(rows)) return []
    } catch (e) {
      if (import.meta.env.DEV) {
        // eslint-disable-next-line no-console
        console.warn(`[map] failed fetching joins from ${col}`)
      }
    }
  }
  return []
}
