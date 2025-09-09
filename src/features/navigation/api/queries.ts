import { readItem, readItems, readFile } from '@directus/sdk'
import { directus } from '../../../lib/directus'

export type NavItem = {
  id: string | number
  label?: string
  href?: string
  sort?: number
  location?: 'header' | 'footer'
  isButton?: boolean
  icon?: string | null
  parent?: number | { id: string | number } | null
  translations?: Array<{ languages_code: string; label?: string; description?: string | null }>
}

export type Company = {
  id: number
  logo?: string | { id: string }
  favicon?: string | { id: string }
  name?: string | null
  useFaviconInHeader?: boolean | null
}

export async function fetchCompanyLogo(): Promise<string | undefined> {
  try {
    const company = (await directus.request(readItem('company', 1, { fields: ['id', 'logo'] }))) as Company
    const logoVal = company?.logo
    return typeof logoVal === 'string' ? logoVal : logoVal?.id
  } catch {
    return undefined
  }
}

export async function fetchCompanyInfo(): Promise<{
  logoId?: string
  faviconId?: string
  name?: string
  useFaviconInHeader?: boolean
} | undefined> {
  try {
    const company = (await directus.request(
      readItem('company', 1, { fields: ['id', 'logo', 'favicon', 'name', 'useFaviconInHeader'] }),
    )) as Company
    const logoVal = company?.logo
    const favVal = company?.favicon
    const logoId = typeof logoVal === 'string' ? logoVal : logoVal?.id
    const faviconId = typeof favVal === 'string' ? favVal : favVal?.id
    return {
      logoId,
      faviconId,
      name: company?.name ?? undefined,
      useFaviconInHeader: company?.useFaviconInHeader ?? undefined,
    }
  } catch {
    return undefined
  }
}

export async function fetchFileMeta(
  id: string,
  fields: string[] = ['id', 'type', 'width', 'height'],
): Promise<Record<string, unknown> | undefined> {
  try {
    return await directus.request(readFile(id, { fields }))
  } catch {
    return undefined
  }
}

export async function fetchHeaderNavigation(): Promise<NavItem[]> {
  try {
    const items = (await directus.request(
      readItems('navigation', {
        filter: { location: { _eq: 'header' }, status: { _eq: 'published' } },
        fields: [
          'id',
          'href',
          'isButton',
          'location',
          'sort',
          'icon',
          'parent',
          'translations.languages_code',
          'translations.label',
          'translations.description',
        ],
        sort: ['sort'],
        limit: -1,
      }),
    )) as unknown as NavItem[]
    // muted navigation debug
    return items || []
  } catch {
    return []
  }
}
