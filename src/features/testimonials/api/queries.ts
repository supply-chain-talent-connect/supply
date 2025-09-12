import { readItems } from '@directus/sdk'
import { directus } from '@/lib/directus'

export type Testimonial = {
  id: number
  status?: string | null
  name?: string | null
  company?: string | null
  rating?: number | null
  avatar?: string | { id: string } | null
}

export type TestimonialTranslation = {
  id: number
  testimonials_id: number
  languages_code: string
  testimonial?: string | null
  job_title?: string | null
  results_pill?: string | null
}

export type TestimonialData = {
  id: number
  name: string
  company: string
  rating: number
  avatarId?: string
  testimonial: string
  jobTitle: string
  resultsPill: string
}

function pickTranslation<T extends { languages_code: string }>(
  rows: T[] | undefined,
  locale: string,
): T | undefined {
  if (!rows || rows.length === 0) return undefined
  const localMatch = rows.find((r) => r.languages_code === locale)
  if (localMatch) return localMatch
  const enMatch = rows.find((r) => r.languages_code === 'en')
  return enMatch ?? rows[0]
}

export async function fetchTestimonials(locale: string): Promise<TestimonialData[]> {
  let testimonials: Testimonial[] = []
  let translations: TestimonialTranslation[] = []

  try {
    testimonials = (await directus.request(
      readItems<Testimonial>('testimonials', {
        filter: { status: { _eq: 'published' } },
        fields: ['id', 'status', 'name', 'company', 'rating', 'avatar'],
        sort: ['sort', 'id'],
        limit: -1,
      }),
    )) as unknown as Testimonial[]
  } catch (e) {
    if (import.meta.env.DEV) console.warn('[testimonials] fetch failed', e)
    return []
  }

  if (!testimonials.length) return []

  try {
    const testimonialIds = testimonials.map((t) => t.id)
    translations = (await directus.request(
      readItems<TestimonialTranslation>('testimonials_translations', {
        filter: { 
          testimonials_id: { _in: testimonialIds },
          languages_code: { _in: [locale, 'en'] }
        },
        fields: ['id', 'testimonials_id', 'languages_code', 'testimonial', 'job_title', 'results_pill'],
        limit: -1,
      }),
    )) as unknown as TestimonialTranslation[]
  } catch (e) {
    if (import.meta.env.DEV) console.warn('[testimonials] translations fetch failed', e)
  }

  return testimonials.map((testimonial) => {
    const testimonialTranslations = translations.filter(t => t.testimonials_id === testimonial.id)
    const translation = pickTranslation(testimonialTranslations, locale)
    
    const avatarVal = testimonial.avatar
    const avatarId = typeof avatarVal === 'string' ? avatarVal : avatarVal?.id

    return {
      id: testimonial.id,
      name: testimonial.name ?? '',
      company: testimonial.company ?? '',
      rating: testimonial.rating ?? 5,
      avatarId: avatarId ?? undefined,
      testimonial: translation?.testimonial ?? '',
      jobTitle: translation?.job_title ?? '',
      resultsPill: translation?.results_pill ?? '',
    }
  }).filter(t => t.testimonial && t.name)
}