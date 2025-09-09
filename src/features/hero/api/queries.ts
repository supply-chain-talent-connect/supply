import { readItems } from '@directus/sdk'
import { directus } from '@/lib/directus'

export type HeroTranslation = {
  id: number
  hero_id: number
  languages_code: string
  heading?: string
  heading_highlighted?: string | null
  supporting_text?: string
  supporting_text2?: string | null
  cta?: string
  cta2?: string
}

export async function fetchHero(locale: string, heroId = 1): Promise<HeroTranslation | undefined> {
  try {
    const res = (await directus.request(
      readItems('hero_translations', {
        filter: { hero_id: { _eq: heroId }, languages_code: { _eq: locale } },
        fields: ['id','hero_id','languages_code','heading','heading_highlighted','supporting_text','supporting_text2','CTA','CTA2'],
        limit: 1,
      }),
    )) as unknown as HeroTranslation[]
    if (res?.length) {
      const row = res[0] as any
      return {
        ...row,
        cta: row.cta ?? row.CTA,
        cta2: row.cta2 ?? row.CTA2,
      } as HeroTranslation
    }
    // Fallback to English
    const fallback = (await directus.request(
      readItems('hero_translations', {
        filter: { hero_id: { _eq: heroId }, languages_code: { _eq: 'en' } },
        fields: ['id','hero_id','languages_code','heading','heading_highlighted','supporting_text','supporting_text2','CTA','CTA2'],
        limit: 1,
      }),
    )) as unknown as HeroTranslation[]
    if (fallback?.length) {
      const row = fallback[0] as any
      return {
        ...row,
        cta: row.cta ?? row.CTA,
        cta2: row.cta2 ?? row.CTA2,
      } as HeroTranslation
    }
    return undefined
  } catch {
    // Retry with lowercase cta fields if casing is different in this instance
    try {
      const res = (await directus.request(
        readItems('hero_translations', {
          filter: { hero_id: { _eq: heroId }, languages_code: { _eq: locale } },
          fields: ['id','hero_id','languages_code','heading','heading_highlighted','supporting_text','supporting_text2','cta','cta2'],
          limit: 1,
        }),
      )) as unknown as HeroTranslation[]
      if (res?.length) return res[0]
      const fallback = (await directus.request(
        readItems('hero_translations', {
          filter: { hero_id: { _eq: heroId }, languages_code: { _eq: 'en' } },
          fields: ['id','hero_id','languages_code','heading','heading_highlighted','supporting_text','supporting_text2','cta','cta2'],
          limit: 1,
        }),
      )) as unknown as HeroTranslation[]
      return fallback?.[0]
    } catch {
      return undefined
    }
  }
}

export type HeroCity = {
  id: number
  status: 'published' | 'draft' | string
  parent?: number | null
  name?: string | null
  location?: { type: 'Point'; coordinates: [number, number] } | null
}

export async function fetchHeroCities(heroId = 1): Promise<HeroCity[]> {
  try {
    const cities = (await directus.request(
      readItems('map_cities', {
        filter: { parent: { _eq: heroId }, status: { _eq: 'published' } },
        fields: ['id', 'status', 'parent', 'name', 'location'],
        limit: 100,
        sort: ['id'],
      }),
    )) as unknown as HeroCity[]
    return Array.isArray(cities) ? cities : []
  } catch {
    return []
  }
}
