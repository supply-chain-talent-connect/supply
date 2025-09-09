import { useEffect, useMemo, useState } from 'react'
import { useTranslation } from 'react-i18next'
import { fetchPricingSection, type PricingSectionUI } from '../api/queries'

export type UsePricingOptions = {
  sectionId?: number
}

export function usePricing({ sectionId = 1 }: UsePricingOptions = {}) {
  const { i18n } = useTranslation()
  const locale = i18n.language?.split('-')[0] || 'en'
  const [data, setData] = useState<PricingSectionUI | undefined>()
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<unknown>()

  useEffect(() => {
    let cancelled = false
    setLoading(true)
    fetchPricingSection(locale, sectionId)
      .then((res) => {
        if (!cancelled) setData(res)
      })
      .catch((e) => {
        if (!cancelled) setError(e)
      })
      .finally(() => {
        if (!cancelled) setLoading(false)
      })
    return () => {
      cancelled = true
    }
  }, [locale, sectionId])

  const currencies = useMemo(() => data?.currencies ?? ['USD'], [data])

  // Derive a generic annual savings percent for display: average across tiers for first available currency
  const computedAnnualSavingsPercent = useMemo(() => {
    if (!data?.tiers?.length) return undefined
    const currency = currencies[0]
    if (!currency) return undefined
    const discounts: number[] = []
    for (const t of data.tiers) {
      const m = t.monthlyByCurrency[currency]
      const a = t.annualTotalByCurrency[currency]
      if (m && a) {
        const fullYear = m * 12
        if (fullYear > 0 && a < fullYear) {
          discounts.push(1 - a / fullYear)
        }
      }
    }
    if (!discounts.length) return undefined
    const avg = discounts.reduce((s, x) => s + x, 0) / discounts.length
    return Math.round(avg * 100)
  }, [data, currencies])

  return {
    data,
    loading,
    error,
    currencies,
    computedAnnualSavingsPercent,
  }
}
