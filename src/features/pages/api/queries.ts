import { readItems } from '@directus/sdk'
import { directus } from '@/lib/directus'

export type LandingPageBlock = {
  id: number
  page: string
  sort?: number | null
  display_page?: boolean | null
}

export async function fetchLandingPageOrder(): Promise<LandingPageBlock[]> {
  const fallback: LandingPageBlock[] = [
    { id: 1, page: 'hero', sort: 1, display_page: true },
    { id: 2, page: 'trust_logos', sort: 2, display_page: true },
    { id: 3, page: 'features', sort: 3, display_page: true },
    { id: 4, page: 'pricing', sort: 4, display_page: true },
    { id: 5, page: 'testimonials', sort: 5, display_page: true },
    { id: 6, page: 'faq', sort: 6, display_page: true },
  ]
  try {
    const rows = (await directus.request(
      readItems('landing_page_order', {
        fields: ['id', 'page', 'sort', 'display_page'],
        filter: { display_page: { _eq: true } },
        sort: ['sort', 'id'],
        limit: -1,
      }),
    )) as unknown as LandingPageBlock[]
    if (Array.isArray(rows) && rows.length) return rows
    if (import.meta.env.DEV) console.warn('[landing_page_order] empty; using fallback')
    return fallback
  } catch (e) {
    if (import.meta.env.DEV) console.warn('[landing_page_order] fetch failed; using fallback', e)
    return fallback
  }
}

export type LandingPageOrderTranslation = {
  id: number
  landing_page_order_id: number
  languages_code: string
  Heading?: string | null
  subheading?: string | null
}

export async function fetchLandingBlockCopy(page: string, locale: string): Promise<{ heading?: string; subheading?: string } | undefined> {
  try {
    // Find the block id by page key
    const rows = (await directus.request(
      readItems('landing_page_order', {
        fields: ['id', 'page', 'display_page'],
        filter: { page: { _eq: page }, display_page: { _eq: true } },
        sort: ['sort', 'id'],
        limit: 1,
      }),
    )) as unknown as LandingPageBlock[]
    const block = rows?.[0]
    if (!block) return undefined

    // Fetch translations for that block in [locale, 'en'] and pick best
    const tx = (await directus.request(
      readItems<LandingPageOrderTranslation>('landing_page_order_translations', {
        fields: ['id', 'landing_page_order_id', 'languages_code', 'Heading', 'subheading'],
        filter: { landing_page_order_id: { _eq: block.id }, languages_code: { _in: [locale, 'en'] } },
        limit: -1,
      }),
    )) as unknown as LandingPageOrderTranslation[]
    const pick = tx.find((t) => t.languages_code === locale) ?? tx.find((t) => t.languages_code === 'en')
    if (!pick) return undefined
    return { heading: pick.Heading ?? undefined, subheading: pick.subheading ?? undefined }
  } catch (e) {
    if (import.meta.env.DEV) console.warn('[landing_page_order_translations] fetch failed', e)
    return undefined
  }
}
