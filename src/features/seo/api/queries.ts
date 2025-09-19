import { readItem } from '@directus/sdk'
import { directus } from '@/lib/directus'

export type LandingPageSettings = {
  id: number
  seo_title?: string | null
  seo_description?: string | null
  css_injection?: string | null
  html_injection?: string | null
  javascript_injection?: string | null
}

export async function fetchLandingPageSettings(): Promise<
  | {
      title?: string
      description?: string
      css?: string
      html?: string
      js?: string
    }
  | undefined
> {
  try {
    const item = (await directus.request(
      readItem('landing_page_settings', 1, {
        fields: [
          'id',
          'seo_title',
          'seo_description',
          'css_injection',
          'html_injection',
          'javascript_injection',
        ],
      }),
    )) as LandingPageSettings

    return {
      title: item.seo_title ?? undefined,
      description: item.seo_description ?? undefined,
      css: item.css_injection ?? undefined,
      html: item.html_injection ?? undefined,
      js: item.javascript_injection ?? undefined,
    }
  } catch (e) {
    if (import.meta.env.DEV) console.warn('[seo] settings fetch failed', e)
    return undefined
  }
}

export type AdvancedSiteWideSettings = {
  id: number
  html_header_injection?: string | null
  css_injection?: string | null
  js_injection?: string | null
  seo_title_prefix?: string | null
  seo_description_prefix?: string | null
}

export async function fetchAdvancedSiteWideSettings(): Promise<
  | {
      titlePrefix?: string
      descriptionPrefix?: string
      css?: string
      html?: string
      js?: string
    }
  | undefined
> {
  try {
    const item = (await directus.request(
      readItem('advanced_site_wide_settings', 1, {
        fields: [
          'id',
          'html_header_injection',
          'css_injection',
          'js_injection',
          'seo_title_prefix',
          'seo_description_prefix',
        ],
      }),
    )) as AdvancedSiteWideSettings

    return {
      titlePrefix: item.seo_title_prefix ?? undefined,
      descriptionPrefix: item.seo_description_prefix ?? undefined,
      css: item.css_injection ?? undefined,
      html: item.html_header_injection ?? undefined,
      js: item.js_injection ?? undefined,
    }
  } catch (e) {
    if (import.meta.env.DEV) console.warn('[seo] advanced site-wide settings fetch failed', e)
    return undefined
  }
}
