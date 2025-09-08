import { createDirectus, rest } from '@directus/sdk'

const url = import.meta.env.VITE_DIRECTUS_URL
if (!url && import.meta.env.DEV) {
  console.warn('VITE_DIRECTUS_URL is not set. Set it in .env.development')
}

export const directus = createDirectus(url ?? '').with(rest())

export const DIRECTUS_URL = url ?? ''
export function assetUrl(id?: string | null, params?: Record<string, string | number>) {
  if (!id) return ''
  const qs = params
    ? '?' + new URLSearchParams(Object.entries(params).map(([k, v]) => [k, String(v)])).toString()
    : ''
  return `${DIRECTUS_URL}/assets/${id}${qs}`
}
