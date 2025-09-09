import { readItems } from '@directus/sdk'
import { directus } from '@/lib/directus'

export type FaqLandingPage = {
  id: number
  label?: string | null
}

export type FaqLandingPageTranslation = {
  id: number
  faq_landing_page_id: number
  languages_code: string
  question?: string | null
  answer?: string | null
}

export type FaqItemUI = { q: string; a: string }

export async function fetchLandingFaq(locale: string): Promise<FaqItemUI[] | undefined> {
  let items: FaqLandingPage[] = []

  // Fetch published FAQ base rows
  try {
    items = (await directus.request(
      readItems<FaqLandingPage>('faq_landing_page', {
        fields: ['id', 'label'],
        filter: { status: { _eq: 'published' } },
        sort: ['sort', 'id'],
        limit: -1,
      }),
    )) as unknown as FaqLandingPage[]
  } catch (e) {
    if (import.meta.env.DEV) console.warn('[landing_faq] base fetch failed', e)
    return undefined
  }

  if (!items.length) return []

  // Fetch translations for requested locale (fallback to en)
  try {
    const ids = items.map((i) => i.id)
    const translations = (await directus.request(
      readItems<FaqLandingPageTranslation>('faq_landing_page_translations', {
        fields: ['id', 'faq_landing_page_id', 'languages_code', 'question', 'answer'],
        filter: { faq_landing_page_id: { _in: ids }, languages_code: { _in: [locale, 'en'] } },
        limit: -1,
      }),
    )) as unknown as FaqLandingPageTranslation[]

    // Build a map of id -> best translation
    const byId = new Map<number, FaqLandingPageTranslation | undefined>()
    for (const id of ids) {
      const local = translations.find((t) => t.faq_landing_page_id === id && t.languages_code === locale)
      const en = translations.find((t) => t.faq_landing_page_id === id && t.languages_code === 'en')
      byId.set(id, local ?? en)
    }

    const ui: FaqItemUI[] = []
    for (const item of items) {
      const t = byId.get(item.id)
      if (t?.question && t?.answer) ui.push({ q: t.question, a: t.answer })
    }
    return ui
  } catch (e) {
    if (import.meta.env.DEV) console.warn('[landing_faq] translations fetch failed', e)
    return undefined
  }
}

