import { readItem, readItems } from '@directus/sdk'
import { directus } from '../../../lib/directus'

export type NavItem = {
  id: string | number
  label?: string
  href?: string
  sort?: number
  location?: 'header' | 'footer'
  isButton?: boolean
  parent?: { id: string | number } | null
  translations?: Array<{ languages_code: string; label?: string }>
}

export type Company = { id: number; logo?: string | { id: string } }

export async function fetchCompanyLogo(): Promise<string | undefined> {
  try {
    const company = (await directus.request(readItem<Company>('company', 1, { fields: ['id', 'logo'] }))) as Company
    const logoVal = company?.logo
    return typeof logoVal === 'string' ? logoVal : logoVal?.id
  } catch {
    return undefined
  }
}

export async function fetchHeaderNavigation(): Promise<NavItem[]> {
  try {
    const items = (await directus.request(
      readItems<NavItem>('navigation', {
        filter: { location: { _eq: 'header' }, status: { _eq: 'published' } },
        fields: [
          'id',
          'href',
          'isButton',
          'location',
          'sort',
          'parent.id',
          'translations.languages_code',
          'translations.label',
        ],
        sort: ['sort'],
        limit: -1,
      }),
    )) as unknown as NavItem[]
    if (import.meta.env.DEV) {
      // eslint-disable-next-line no-console
      console.debug('[navigation]', items)
    }
    return items || []
  } catch {
    return []
  }
}
