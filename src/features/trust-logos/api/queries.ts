import { readItem, readItems } from '@directus/sdk'
import { directus } from '@/lib/directus'

export type TrustLogosSection = {
  id: number
  is_monochrome?: boolean | null
  Monochrome_Color?: string | null
  Enable_Links?: boolean | null
  scroll_logos?: boolean | null
  scroll_speed?: number | null
}

export type TrustLogosSectionTranslation = {
  id: number
  Trust_Logos_id: number
  languages_code: string
  Intro_Text?: string | null
}

export type TrustLogoImage = {
  id: number
  section: number | { id: number }
  Logo_Image?: string | { id: string } | null
  href?: string | null
  Label?: string | null
}

export type TrustLogoImageTranslation = {
  id: number
  Trust_Logo_Images_id: number
  languages_code: string
  alt_text?: string | null
}

export type TrustLogosData = {
  introText?: string
  isMonochrome?: boolean
  monochromeColor?: string
  enableLinks?: boolean
  scrollLogos?: boolean
  scrollSpeedSec?: number
  logos: Array<{
    id: number
    imageId?: string
    href?: string
    label?: string
    alt?: string
  }>
}

export async function fetchTrustLogos(locale: string, sectionId = 1): Promise<TrustLogosData | undefined> {
  let section: TrustLogosSection | undefined
  let introText: string | undefined
  let logos: TrustLogoImage[] = []
  const altMap = new Map<number, string | undefined>()

  // Fetch section settings (tolerate 403 and move on with defaults)
  try {
    section = (await directus.request(
      readItem<TrustLogosSection>('Trust_Logos', sectionId, {
        fields: ['id', 'is_monochrome', 'Monochrome_Color', 'Enable_Links', 'scroll_logos', 'scroll_speed'],
      }),
    )) as TrustLogosSection
  } catch (e) {
    if (import.meta.env.DEV) console.warn('[trust-logos] section fetch failed', e)
  }

  // Fetch translations for intro (tolerate failure)
  try {
    const translations = (await directus.request(
      readItems<TrustLogosSectionTranslation>('Trust_Logos_translations', {
        filter: { Trust_Logos_id: { _eq: sectionId }, languages_code: { _in: [locale, 'en'] } },
        fields: ['id', 'Trust_Logos_id', 'languages_code', 'Intro_Text'],
        sort: ['languages_code'],
        limit: -1,
      }),
    )) as unknown as TrustLogosSectionTranslation[]
    introText =
      translations.find((t) => t.languages_code === locale)?.Intro_Text ??
      translations.find((t) => t.languages_code === 'en')?.Intro_Text ??
      undefined
  } catch (e) {
    if (import.meta.env.DEV) console.warn('[trust-logos] translations fetch failed', e)
  }

  // Fetch logos list (required to render)
  try {
    logos = (await directus.request(
      readItems<TrustLogoImage>('Trust_Logo_Images', {
        filter: { section: { _eq: sectionId }, status: { _eq: 'published' } },
        fields: ['id', 'section', 'Logo_Image', 'href', 'Label'],
        sort: ['sort', 'id'],
        limit: -1,
      }),
    )) as unknown as TrustLogoImage[]
  } catch (e) {
    if (import.meta.env.DEV) console.warn('[trust-logos] logos fetch failed', e)
    return undefined
  }

  // Fetch alt text translations (tolerate failure)
  try {
    const logoIds = logos.map((l) => l.id)
    if (logoIds.length) {
      const alts = (await directus.request(
        readItems<TrustLogoImageTranslation>('Trust_Logo_Images_translations', {
          filter: { Trust_Logo_Images_id: { _in: logoIds }, languages_code: { _in: [locale, 'en'] } },
          fields: ['id', 'Trust_Logo_Images_id', 'languages_code', 'alt_text'],
          limit: -1,
        }),
      )) as unknown as TrustLogoImageTranslation[]
      for (const id of logoIds) {
        const local = alts.find((a) => a.Trust_Logo_Images_id === id && a.languages_code === locale)?.alt_text
        const en = alts.find((a) => a.Trust_Logo_Images_id === id && a.languages_code === 'en')?.alt_text
        altMap.set(id, local ?? en)
      }
    }
  } catch (e) {
    if (import.meta.env.DEV) console.warn('[trust-logos] alt translations fetch failed', e)
  }

  return {
    introText,
    isMonochrome: !!section?.is_monochrome,
    monochromeColor: section?.Monochrome_Color ?? undefined,
    enableLinks: section?.Enable_Links ?? true,
    scrollLogos: section?.scroll_logos ?? true,
    scrollSpeedSec: section?.scroll_speed ?? 30,
    logos: logos.map((l) => {
      const imgVal = l.Logo_Image
      const imageId = typeof imgVal === 'string' ? imgVal : imgVal?.id
      return {
        id: l.id,
        imageId: imageId ?? undefined,
        href: l.href ?? undefined,
        label: l.Label ?? undefined,
        alt: altMap.get(l.id) ?? l.Label ?? undefined,
      }
    }),
  }
}
