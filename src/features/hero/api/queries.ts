import { readItems } from '@directus/sdk'
import { directus } from '@/lib/directus'

export type HeroTranslation = {
  id: number
  hero_id: number
  languages_code: string
  heading?: string
  heading_highlighted?: string | null
  supporting_text?: string
  CTA?: string
  CTA2?: string
}

export async function fetchHero(locale: string, heroId = 1): Promise<HeroTranslation | undefined> {
  try {
    const res = (await directus.request(
      readItems<HeroTranslation>('hero_translations', {
        filter: { hero_id: { _eq: heroId }, languages_code: { _eq: locale } },
        fields: ['id','hero_id','languages_code','heading','heading_highlighted','supporting_text','CTA','CTA2'],
        limit: 1,
      }),
    )) as unknown as HeroTranslation[]
    if (res?.length) return res[0]
    // Fallback to English
    const fallback = (await directus.request(
      readItems<HeroTranslation>('hero_translations', {
        filter: { hero_id: { _eq: heroId }, languages_code: { _eq: 'en' } },
        fields: ['id','hero_id','languages_code','heading','heading_highlighted','supporting_text','CTA','CTA2'],
        limit: 1,
      }),
    )) as unknown as HeroTranslation[]
    return fallback?.[0]
  } catch {
    return undefined
  }
}
