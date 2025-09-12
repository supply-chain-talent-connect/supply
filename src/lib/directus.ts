import { createDirectus, rest, staticToken } from '@directus/sdk'

const rawUrl = import.meta.env.VITE_DIRECTUS_URL as string | undefined
const token = import.meta.env.VITE_DIRECTUS_TOKEN as string | undefined

if (!rawUrl && import.meta.env.DEV) {
  console.warn('VITE_DIRECTUS_URL is not set. Set it in .env.development')
}

// Support relative base (e.g., "/directus") in dev to leverage Vite proxy
const resolveBaseUrl = (u?: string | null) => {
  if (!u) return ''
  if (u.startsWith('/')) {
    // Avoid SSR/build-time window access
    if (typeof window !== 'undefined') return `${window.location.origin}${u}`
    return u
  }
  return u
}

const baseUrl = resolveBaseUrl(rawUrl)

export const directus = (token
  ? createDirectus(baseUrl).with(staticToken(token)).with(rest())
  : createDirectus(baseUrl).with(rest())
)

export const DIRECTUS_URL = baseUrl
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
