import { readItem } from '@directus/sdk'
import { directus } from '@/lib/directus'

export type PriceRow = {
  id: number
  currency: string
  amount: string
}

export type PackageTranslation = {
  id: number
  pricing_packages_id: number
  languages_code: string
  name?: string | null
  description?: string | null
}

export type FeatureTranslation = {
  id: number
  plan_features_id: number
  languages_code: string
  feature?: string | null
}

export type PlanFeatureGroup = {
  id: number
  label?: string | null
  features: FeatureTranslation[]
}

export type PricingPackage = {
  id: number
  recommended?: boolean | null
  label?: string | null
  name_and_description: PackageTranslation[]
  plan_features: PlanFeatureGroup[]
  monthly_price: PriceRow[]
  annual_price: PriceRow[]
}

export type FaqTranslation = {
  id: number
  languages_code: string
  question?: string | null
  answer?: string | null
}

export type PricingFaq = {
  id: number
  label?: string | null
  translations: FaqTranslation[]
}

export type SectionTranslation = {
  id: number
  languages_code: string
  heading?: string | null
  subheading?: string | null
  contact_text?: string | null
  guarantee_heading?: string | null
  guarantee_text?: string | null
}

export type PricingSectionRecord = {
  id: number
  pricing_section_translations?: SectionTranslation[]
  pricing_packages: PricingPackage[]
  all_plans_include: PlanFeatureGroup[]
  pricing_faq: PricingFaq[]
}

export type PricingFaqUI = { q: string; a: string }
export type PricingTierUI = {
  id: number
  name: string
  tagline?: string
  highlight?: boolean
  monthlyByCurrency: Record<string, number>
  annualTotalByCurrency: Record<string, number>
  valueProps: string[]
}

export type PricingSectionUI = {
  heading?: string
  subheading?: string
  contactHtml?: string
  guaranteeHeading?: string
  guaranteeText?: string
  tiers: PricingTierUI[]
  globalIncludes: string[]
  faqs: PricingFaqUI[]
  currencies: string[]
}

function pickTranslation<T extends { languages_code: string }>(
  rows: T[] | undefined,
  locale: string,
) {
  if (!rows || rows.length === 0) return undefined
  const base = rows.find((r) => r.languages_code === locale)
  if (base) return base
  const en = rows.find((r) => r.languages_code === 'en')
  return en ?? rows[0]
}

function toAmount(a?: string | null) {
  const n = a ? Number(a) : NaN
  return Number.isFinite(n) ? n : undefined
}

export async function fetchPricingSection(
  locale: string,
  sectionId = 1,
): Promise<PricingSectionUI | undefined> {
  const fields = [
    'id',
    'pricing_section_translations.*',
    'pricing_packages.id',
    'pricing_packages.recommended',
    'pricing_packages.label',
    'pricing_packages.name_and_description.*',
    'pricing_packages.plan_features.id',
    'pricing_packages.plan_features.label',
    'pricing_packages.plan_features.features.*',
    'pricing_packages.monthly_price.id',
    'pricing_packages.monthly_price.currency',
    'pricing_packages.monthly_price.amount',
    'pricing_packages.annual_price.id',
    'pricing_packages.annual_price.currency',
    'pricing_packages.annual_price.amount',
    'all_plans_include.id',
    'all_plans_include.label',
    'all_plans_include.features.*',
    'pricing_faq.id',
    'pricing_faq.label',
    'pricing_faq.translations.languages_code',
    'pricing_faq.translations.question',
    'pricing_faq.translations.answer',
  ]

  let rec: PricingSectionRecord
  try {
    rec = (await directus.request(
      readItem<PricingSectionRecord>('pricing_section', sectionId, {
        fields,
      }),
    )) as unknown as PricingSectionRecord
  } catch (e) {
    if (import.meta.env.DEV) console.warn('[pricing] section fetch failed', e)
    return undefined
  }

  const t = pickTranslation(rec.pricing_section_translations, locale)
  const tiers: PricingTierUI[] = []
  const currencySet = new Set<string>()

  for (const p of rec.pricing_packages || []) {
    const td = pickTranslation(p.name_and_description, locale)
    const valueProps: string[] = []
    // Collect feature bullets in locale (fallback en)
    for (const group of p.plan_features || []) {
      const ft = pickTranslation(group.features, locale)
      if (ft?.feature) valueProps.push(ft.feature)
    }

    const monthlyByCurrency: Record<string, number> = {}
    for (const row of p.monthly_price || []) {
      const val = toAmount(row.amount)
      if (val !== undefined && row.currency) {
        monthlyByCurrency[row.currency] = val
        currencySet.add(row.currency)
      }
    }
    const annualTotalByCurrency: Record<string, number> = {}
    for (const row of p.annual_price || []) {
      const val = toAmount(row.amount)
      if (val !== undefined && row.currency) {
        annualTotalByCurrency[row.currency] = val
        currencySet.add(row.currency)
      }
    }

    tiers.push({
      id: p.id,
      name: td?.name ?? p.label ?? `Plan ${p.id}`,
      tagline: td?.description ?? undefined,
      highlight: !!p.recommended,
      monthlyByCurrency,
      annualTotalByCurrency,
      valueProps,
    })
  }

  // Global includes
  const globalIncludes: string[] = []
  for (const g of rec.all_plans_include || []) {
    const ft = pickTranslation(g.features, locale)
    if (ft?.feature) globalIncludes.push(ft.feature)
  }

  // FAQs
  const faqs: PricingFaqUI[] = []
  for (const f of rec.pricing_faq || []) {
    const tx = pickTranslation(f.translations, locale)
    if (tx?.question && tx?.answer) {
      faqs.push({ q: tx.question, a: tx.answer })
    }
  }

  return {
    heading: t?.heading ?? undefined,
    subheading: t?.subheading ?? undefined,
    contactHtml: t?.contact_text ?? undefined,
    guaranteeHeading: t?.guarantee_heading ?? undefined,
    guaranteeText: t?.guarantee_text ?? undefined,
    tiers,
    globalIncludes,
    faqs,
    currencies: Array.from(currencySet),
  }
}

