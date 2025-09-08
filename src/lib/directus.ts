import { createDirectus, rest, staticToken } from '@directus/sdk'

const url = import.meta.env.VITE_DIRECTUS_URL
const token = import.meta.env.VITE_DIRECTUS_TOKEN
if (!url && import.meta.env.DEV) {
  console.warn('VITE_DIRECTUS_URL is not set. Set it in .env.development')
}

export const directus = (token
  ? createDirectus(url ?? '').with(staticToken(token)).with(rest())
  : createDirectus(url ?? '').with(rest())
)

export const DIRECTUS_URL = url ?? ''
export const DIRECTUS_TOKEN = token ?? ''
export function assetUrl(id?: string | null, params?: Record<string, string | number>) {
  if (!id) return ''
  const allParams: Record<string, string | number> = { ...(params || {}) }
  if (token) {
    allParams['access_token'] = token
  }
  const qs = Object.keys(allParams).length
    ? '?' + new URLSearchParams(Object.entries(allParams).map(([k, v]) => [k, String(v)])).toString()
    : ''
  return `${DIRECTUS_URL}/assets/${id}${qs}`
}
