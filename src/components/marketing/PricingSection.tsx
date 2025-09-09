/* eslint-disable i18next/no-literal-string */
import React, { useMemo, useState } from 'react'
import { motion } from 'framer-motion'
import { Shield } from 'lucide-react'
import { Switch } from '@/components/ui/switch'
import { Select, SelectTrigger, SelectContent, SelectItem } from '@/components/ui/select'
import PricingCard from './PricingCard'
import { usePricing } from '@/features/pricing/hooks/usePricing'
import { useTranslation } from 'react-i18next'
import useLandingBlockCopy from '@/features/pages/hooks/useLandingBlockCopy'
import SectionHeader from '@/components/marketing/SectionHeader'

type Props = {
  sectionId?: number
}

export default function PricingSection({ sectionId = 1 }: Props) {
  const { data, loading, currencies, computedAnnualSavingsPercent } = usePricing({ sectionId })
  const { i18n, t } = useTranslation()
  const [annual, setAnnual] = useState(true)
  const [currency, setCurrency] = useState<string>(() => currencies[0] || 'USD')
  const copy = useLandingBlockCopy('pricing')

  const _currencySymbol = useMemo(() => {
    const map: Record<string, string> = { USD: '$', EUR: '€', GBP: '£', CAD: 'C$', AUD: 'A$', JPY: '¥' }
    return map[currency] ?? `${currency} `
  }, [currency])

  // Keep currency in sync once data loads
  React.useEffect(() => {
    if (!currency && currencies.length) setCurrency(currencies[0])
  }, [currencies, currency])

  const tiers = data?.tiers ?? []
  const includes = data?.globalIncludes ?? []
  const faqs = data?.faqs ?? []

  const priceFor = (tier: (typeof tiers)[number]) => {
    const monthly = tier.monthlyByCurrency[currency]
    const annualTotal = tier.annualTotalByCurrency[currency]
    return { monthly, annualTotal }
  }

  const formatter = useMemo(() => {
    const locale = i18n.language || 'en'
    try {
      return new Intl.NumberFormat(locale, { style: 'currency', currency, minimumFractionDigits: 0, maximumFractionDigits: 2 })
    } catch {
      return new Intl.NumberFormat('en', { style: 'currency', currency: 'USD', minimumFractionDigits: 0, maximumFractionDigits: 2 })
    }
  }, [i18n.language, currency])

  return (
    <div className="w-full text-slate-900">
      <section id="pricing" className="scroll-mt-24 max-w-6xl mx-auto px-2 md:px-4 pt-14 pb-6 relative">
        <motion.div initial={{ opacity: 0, y: 12 }} animate={{ opacity: 1, y: 0 }} transition={{ duration: 0.4 }} className="text-center">
          <SectionHeader heading={copy?.heading} subheading={copy?.subheading} size="xl" className="mb-0 px-0" />

          {/* Billing toggle */}
          <div className="mt-4 flex items-center justify-center gap-2 md:gap-3 text-xs md:text-sm">
            <span className={!annual ? 'font-semibold' : 'text-slate-500'}>{t('pricing.billing.monthly')}</span>
            <Switch className="h-5 w-9 md:h-6 md:w-11" checked={annual} onCheckedChange={setAnnual} />
            <span className={annual ? 'font-semibold' : 'text-slate-500'}>
              {t('pricing.billing.annual')}
              {computedAnnualSavingsPercent !== undefined ? (
                <span className="ml-1 text-blue-600">({t('pricing.billing.save', { percent: computedAnnualSavingsPercent })})</span>
              ) : null}
            </span>
          </div>
        </motion.div>
      </section>

      {/* Currency selector above grid (start on mobile, end on desktop) */}
      <section className="max-w-6xl mx-auto px-0 md:px-4 pb-2">
        <div className="flex items-center justify-start md:justify-end">
          <Select value={currency} onValueChange={setCurrency}>
            <SelectTrigger
              aria-label="Change currency"
              className="h-auto w-auto p-0 bg-transparent border-0 shadow-none text-xs md:text-sm text-slate-500 hover:text-slate-700 focus:ring-0 focus:outline-none"
            >
              <span>{t('pricing.currency.pricesIn', { symbol: _currencySymbol, code: currency })}</span>
            </SelectTrigger>
            <SelectContent className="min-w-[160px]">
              {currencies.map((code) => (
                <SelectItem key={code} value={code}>
                  {code}
                </SelectItem>
              ))}
            </SelectContent>
          </Select>
        </div>
      </section>

      {/* Pricing grid */}
      <section className="max-w-6xl mx-auto px-0 md:px-4 pb-12">
        <div className="grid md:grid-cols-3 gap-4 sm:gap-6 sm:grid-cols-2 grid-cols-1 items-stretch auto-rows-fr">
          {loading && !tiers.length ? (
            <>
              {[...Array(3)].map((_, idx) => (
                <div key={`skel-${idx}`} className="h-full">
                  <div className="h-full rounded-2xl border border-slate-200 bg-white p-4 md:p-6 animate-pulse flex flex-col">
                    <div className="flex items-center justify-between">
                      <div className="h-6 w-32 bg-slate-200 rounded" />
                      <div className="h-5 w-5 bg-slate-200 rounded" />
                    </div>
                    <div className="mt-4 h-8 w-40 bg-slate-200 rounded" />
                    <div className="mt-1 h-3 w-10 bg-slate-100 rounded" />
                    <ul className="mt-4 space-y-3">
                      <li className="h-4 w-3/4 bg-slate-100 rounded" />
                      <li className="h-4 w-2/3 bg-slate-100 rounded" />
                      <li className="h-4 w-1/2 bg-slate-100 rounded" />
                    </ul>
                    <div className="mt-auto pt-6 h-10 w-full bg-slate-200 rounded-xl" />
                  </div>
                </div>
              ))}
            </>
          ) : null}
          {tiers.map((tier, i) => {
            const { monthly, annualTotal } = priceFor(tier)
            const amount = annual ? annualTotal : monthly
            const displayPrice = amount !== undefined ? formatter.format(amount) : '—'
            const priceSuffix = annual ? t('pricing.billing.perYearSuffix') : t('pricing.billing.perMonthSuffix')
            const underPriceNote = annual && annualTotal ? `${formatter.format(annualTotal / 12)}${t('pricing.billing.perMonthShortSuffix')}` : undefined
            const orderCls = tier.highlight ? 'order-1 md:order-none h-full' : 'order-2 md:order-none h-full'
            return (
              <div key={tier.id} className={orderCls}>
                <PricingCard
                  name={tier.name}
                  tagline={tier.tagline}
                  highlight={tier.highlight}
                  displayPrice={displayPrice}
                  priceSuffix={priceSuffix}
                  underPriceNote={underPriceNote}
                  valueProps={tier.valueProps}
                  ctaHref="#"
                  ctaLabel={tier.highlight ? t('pricing.cta.startPro') : t('pricing.cta.choosePlan')}
                  badgeLabel={t('pricing.badge.mostPopular')}
                  animationDelay={i * 0.05}
                />
              </div>
            )
          })}
        </div>
      </section>

      {/* Footer note */}
      <footer className="pb-16 text-center text-sm text-slate-500">
        {t('pricing.contactPrefix')} <a href="/contact" className="underline">{t('pricing.contactCta')}</a>.
      </footer>

      {/* Trust / Guarantee (Directus with i18n fallback) */}
      {(() => {
        const gh = data?.guaranteeHeading ?? t('pricing.guarantee.heading')
        const gt = data?.guaranteeText ?? t('pricing.guarantee.text')
        if (!gh && !gt) return null
        return (
          <section className="max-w-6xl mx-auto px-4 pb-12">
            <div className="rounded-2xl border border-slate-200 bg-white p-5 md:p-7 flex flex-col md:flex-row items-start md:items-center gap-4">
              <div className="flex items-center gap-3">
                <Shield className="h-6 w-6" />
                <p className="font-semibold">{gh}</p>
              </div>
              {gt ? <p className="text-slate-600 md:ml-auto">{gt}</p> : null}
            </div>
          </section>
        )
      })()}

      {/* Included in every plan */}
      {includes.length > 0 && (
        <section className="max-w-6xl mx-auto px-4 pb-14">
          <div className="rounded-2xl border border-slate-200 bg-white p-6">
            <h3 className="text-xl font-semibold mb-4">Every plan includes</h3>
            <ul className="grid sm:grid-cols-2 md:grid-cols-4 gap-3">
              {includes.map((item) => (
                <li key={item} className="flex items-center gap-2">
                  {/* Simple checkmark via CSS triangle could be used; reuse already loaded icon elsewhere if needed */}
                  <span className="inline-block w-1.5 h-1.5 rounded-full bg-blue-600" />
                  <span>{item}</span>
                </li>
              ))}
            </ul>
          </div>
        </section>
      )}

      {/* FAQs */}
      {faqs.length > 0 && (
        <section className="max-w-6xl mx-auto px-4 pb-20">
          <div className="grid md:grid-cols-3 gap-6">
            {faqs.map((f) => (
              <div key={f.q} className="rounded-2xl border border-slate-200 bg-white p-6">
                <p className="font-semibold">{f.q}</p>
                <p className="text-slate-600 mt-2">{f.a}</p>
              </div>
            ))}
          </div>
        </section>
      )}
    </div>
  )
}
