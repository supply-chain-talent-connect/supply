import { readItems } from '@directus/sdk'
import { directus } from '@/lib/directus'

export type FeatureRecord = {
  id: number
  status?: string | null
  sort?: number | null
  label?: string | null
  show_on_landing_page?: boolean | null
  page_link?: string | null
  icon?: string | null
  feature_image_or_video?: string | { id: string } | null
  features_bullets?: number[] | null
}

export type FeatureTranslationRecord = {
  id: number
  features_id: number
  languages_code: string
  name?: string | null
  snippet?: string | null
  cta_button?: string | null
}

export type FeatureBulletRecord = {
  id: number
  features?: number | null
  label?: string | null
}

export type FeatureBulletTranslationRecord = {
  id: number
  features_bullets_id: number
  languages_code: string
  bullet?: string | null
}

export type FeatureUI = {
  id: number
  key: string
  title: string
  blurb?: string
  icon?: string
  assetId?: string
  pageLink?: string
  bullets: string[]
  ctaLabel?: string
}

function pickTranslation<T extends { languages_code: string }>(rows: T[] | undefined, locale: string) {
  if (!rows || rows.length === 0) return undefined
  const local = rows.find((r) => r.languages_code === locale)
  if (local) return local
  const en = rows.find((r) => r.languages_code === 'en')
  return en ?? rows[0]
}

export async function fetchLandingFeatures(locale: string): Promise<FeatureUI[]> {
  // 1) Fetch features shown on landing
  let features: FeatureRecord[] = []
  try {
    features = (await directus.request(
      readItems<FeatureRecord>('features', {
        filter: { status: { _eq: 'published' }, show_on_landing_page: { _eq: true } },
        fields: [
          'id',
          'status',
          'sort',
          'label',
          'page_link',
          'icon',
          'feature_image_or_video',
          'features_bullets',
        ],
        sort: ['sort', 'id'],
        limit: -1,
      }),
    )) as unknown as FeatureRecord[]
  } catch (e) {
    if (import.meta.env.DEV) console.warn('[features] fetch failed', e)
    return []
  }

  if (!features.length) return []

  const featureIds = features.map((f) => f.id)

  // 2) Fetch translations for titles/snippets (only locale + en for perf)
  let ftRows: FeatureTranslationRecord[] = []
  try {
    ftRows = (await directus.request(
      readItems<FeatureTranslationRecord>('features_translations', {
        filter: { features_id: { _in: featureIds }, languages_code: { _in: [locale, 'en'] } },
        fields: ['id', 'features_id', 'languages_code', 'name', 'snippet', 'cta_button'],
        limit: -1,
      }),
    )) as unknown as FeatureTranslationRecord[]
  } catch (e) {
    if (import.meta.env.DEV) console.warn('[features] translations fetch failed', e)
  }

  // 3) Collect all bullet ids and fetch bullets + translations
  const bulletIds = Array.from(
    new Set((features.flatMap((f) => f.features_bullets || []) as number[]) || []),
  )

  let bullets: FeatureBulletRecord[] = []
  if (bulletIds.length) {
    try {
      bullets = (await directus.request(
        readItems<FeatureBulletRecord>('features_bullets', {
          filter: { id: { _in: bulletIds } },
          fields: ['id', 'features', 'label'],
          limit: -1,
        }),
      )) as unknown as FeatureBulletRecord[]
    } catch (e) {
      if (import.meta.env.DEV) console.warn('[features] bullets fetch failed', e)
    }
  }

  let bulletTx: FeatureBulletTranslationRecord[] = []
  if (bulletIds.length) {
    try {
      bulletTx = (await directus.request(
        readItems<FeatureBulletTranslationRecord>('features_bullets_translations', {
          filter: { features_bullets_id: { _in: bulletIds }, languages_code: { _in: [locale, 'en'] } },
          fields: ['id', 'features_bullets_id', 'languages_code', 'bullet'],
          limit: -1,
        }),
      )) as unknown as FeatureBulletTranslationRecord[]
    } catch (e) {
      if (import.meta.env.DEV) console.warn('[features] bullet translations fetch failed', e)
    }
  }

  // 4) Build UI model
  const bulletMap = new Map<number, string>()
  for (const b of bullets) {
    const tx = pickTranslation(
      bulletTx.filter((t) => t.features_bullets_id === b.id),
      locale,
    )
    if (tx?.bullet) bulletMap.set(b.id, tx.bullet)
  }

  const featureMap = new Map<number, { name?: string; snippet?: string; cta?: string }>()
  for (const f of features) {
    const tx = pickTranslation(
      ftRows.filter((t) => t.features_id === f.id),
      locale,
    )
    featureMap.set(f.id, { name: tx?.name ?? f.label ?? undefined, snippet: tx?.snippet ?? undefined, cta: tx?.cta_button ?? undefined })
  }

  const out: FeatureUI[] = []
  for (const f of features) {
    const meta = featureMap.get(f.id)
    const title = meta?.name || f.label || `Feature ${f.id}`
    const blurb = meta?.snippet || undefined
    const assetVal = f.feature_image_or_video
    const assetId = typeof assetVal === 'string' ? assetVal : assetVal?.id
    const bulletsForFeature: string[] = []
    for (const bid of f.features_bullets || []) {
      const text = bulletMap.get(bid)
      if (text) bulletsForFeature.push(text)
    }
    out.push({
      id: f.id,
      key: String(f.id),
      title,
      blurb,
      icon: f.icon || undefined,
      assetId: assetId ?? undefined,
      pageLink: f.page_link || undefined,
      bullets: bulletsForFeature,
      ctaLabel: meta?.cta || undefined,
    })
  }

  if (import.meta.env.DEV) {
    // eslint-disable-next-line no-console
    console.debug('[features] loaded', {
      count: out.length,
      ids: out.map((f) => f.id),
      locale,
      directus: (typeof window !== 'undefined') ? (window as any).VITE_DIRECTUS_URL || undefined : undefined,
    })
  }
  return out
}
