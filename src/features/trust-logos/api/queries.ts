import { readItem, readItems } from '@directus/sdk'
import { directus } from '@/lib/directus'

export type TrustLogosSection = {
  id: number
  is_monochrome?: boolean | null
  monochrome_color?: string | null
  enable_links?: boolean | null
  scroll_logos?: boolean | null
  scroll_speed?: number | null
}

export type TrustLogosSectionTranslation = {
  id: number
  trust_logos_id: number
  languages_code: string
  intro_text?: string | null
}

export type TrustLogoImage = {
  id: number
  section: number | { id: number }
  logo_image?: string | { id: string } | null
  href?: string | null
  label?: string | null
}

export type TrustLogoImageTranslation = {
  id: number
  trust_logo_images_id: number
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
      readItem<TrustLogosSection>('trust_logos', sectionId, {
        fields: ['id', 'is_monochrome', 'monochrome_color', 'enable_links', 'scroll_logos', 'scroll_speed'],
      }),
    )) as TrustLogosSection
  } catch (e) {
    if (import.meta.env.DEV) console.warn('[trust-logos] section fetch failed', e)
  }

  // Fetch translations for intro (tolerate failure)
  try {
    const translations = (await directus.request(
      readItems<TrustLogosSectionTranslation>('trust_logos_translations', {
        filter: { trust_logos_id: { _eq: sectionId }, languages_code: { _in: [locale, 'en'] } },
        fields: ['id', 'trust_logos_id', 'languages_code', 'intro_text'],
        sort: ['languages_code'],
        limit: -1,
      }),
    )) as unknown as TrustLogosSectionTranslation[]
    introText =
      translations.find((t) => t.languages_code === locale)?.intro_text ??
      translations.find((t) => t.languages_code === 'en')?.intro_text ??
      undefined
  } catch (e) {
    if (import.meta.env.DEV) console.warn('[trust-logos] translations fetch failed', e)
  }

  // Fetch logos list (required to render)
  try {
    logos = (await directus.request(
      readItems<TrustLogoImage>('trust_logo_images', {
        filter: { section: { _eq: sectionId }, status: { _eq: 'published' } },
        fields: ['id', 'section', 'logo_image', 'href', 'label'],
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
        readItems<TrustLogoImageTranslation>('trust_logo_images_translations', {
          filter: { trust_logo_images_id: { _in: logoIds }, languages_code: { _in: [locale, 'en'] } },
          fields: ['id', 'trust_logo_images_id', 'languages_code', 'alt_text'],
          limit: -1,
        }),
      )) as unknown as TrustLogoImageTranslation[]
      for (const id of logoIds) {
        const local = alts.find((a) => a.trust_logo_images_id === id && a.languages_code === locale)?.alt_text
        const en = alts.find((a) => a.trust_logo_images_id === id && a.languages_code === 'en')?.alt_text
        altMap.set(id, local ?? en)
      }
    }
  } catch (e) {
    if (import.meta.env.DEV) console.warn('[trust-logos] alt translations fetch failed', e)
  }

  return {
    introText,
    isMonochrome: !!section?.is_monochrome,
    monochromeColor: section?.monochrome_color ?? undefined,
    enableLinks: section?.enable_links ?? true,
    scrollLogos: section?.scroll_logos ?? true,
    scrollSpeedSec: section?.scroll_speed ?? 30,
    logos: logos.map((l) => {
      const imgVal = l.logo_image
      const imageId = typeof imgVal === 'string' ? imgVal : imgVal?.id
      return {
        id: l.id,
        imageId: imageId ?? undefined,
        href: l.href ?? undefined,
        label: l.label ?? undefined,
        alt: altMap.get(l.id) ?? l.label ?? undefined,
      }
    }),
  }
}
