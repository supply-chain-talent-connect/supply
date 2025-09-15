import React from 'react'
import { motion, AnimatePresence } from 'framer-motion'
import { Card, CardContent } from '@/components/ui/card'
import { Accordion, AccordionContent, AccordionItem, AccordionTrigger } from '@/components/ui/accordion'
import { Button } from '@/components/ui/button'
import {
  ChevronDown,
  Zap,
  Share2,
  Users,
  BarChart3,
  Network,
  Filter,
  LayoutGrid,
  Blocks,
  Check,
} from 'lucide-react'
import type { LucideIcon } from 'lucide-react'
import type { FeatureUI } from '@/features/feature-accordion/api/queries'
import { assetUrl } from '@/lib/directus'

type Props = {
  features: FeatureUI[]
  defaultKey?: string
  showCTA?: boolean
  primaryCtaLabel?: string
  secondaryCtaLabel?: string
  onPrimary?: () => void
  onSecondary?: () => void
  Graphic?: React.ComponentType<{ featureKey: string }>
  className?: string
}

const fade = {
  hidden: { opacity: 0, y: 8 },
  show: { opacity: 1, y: 0, transition: { duration: 0.25 } },
}

const iconMap: Record<string, LucideIcon> = {
  bolt: Zap,
  'emoji_people': Users,
  play_shapes: Share2,
  area_chart: BarChart3,
  filter_list_alt: Filter,
  network: Network,
  blocks: Blocks,
  grid_view: LayoutGrid,
}

function getIcon(name?: string | null): LucideIcon {
  if (!name) return LayoutGrid
  return iconMap[name] || LayoutGrid
}

export default function FeatureAccordion({
  features,
  defaultKey,
  showCTA = false,
  primaryCtaLabel,
  secondaryCtaLabel,
  onPrimary,
  onSecondary,
  Graphic,
  className,
}: Props) {
  const initialKey = defaultKey || (features[0]?.key ?? '')
  const [active, setActive] = React.useState(initialKey)
  const current = React.useMemo(() => features.find((f) => f.key === active) ?? features[0], [active, features])

  if (!features.length) return null

  return (
    <section className={["relative isolate mx-auto max-w-7xl px-2 sm:px-4", className].filter(Boolean).join(' ')}>
      {/* Desktop / Tablet split view */}
      <div className="hidden gap-6 md:grid md:grid-cols-12">
        {/* Left list */}
        <div className="md:col-span-5 lg:col-span-4">
          <ul className="space-y-2">
            {features.map((f) => {
              const Icon = getIcon(f.icon)
              const isActive = f.key === active
              return (
                <li key={f.key} className="rounded-xl border border-slate-300 bg-white/80 dark:border-slate-700 dark:bg-slate-900/70">
                  <button
                    onClick={() => setActive(f.key)}
                    aria-expanded={isActive}
                    className={[
                      'flex w-full items-center justify-between gap-3 px-4 py-3 text-left transition focus:outline-none focus:ring-2 focus:ring-slate-400 dark:focus:ring-slate-500',
                    ].join(' ')}
                  >
                    <div className="flex items-center gap-3">
                      <span className="inline-flex h-10 w-10 items-center justify-center rounded-md bg-slate-100 text-slate-600 dark:bg-slate-800/60 dark:text-slate-300">
                        <Icon className="h-5 w-5" />
                      </span>
                      <div>
                        <p className="text-sm font-medium text-slate-900 dark:text-white">{f.title}</p>
                        {f.blurb ? (
                          <p className="text-xs text-slate-500 dark:text-slate-400 line-clamp-1">{f.blurb}</p>
                        ) : null}
                      </div>
                    </div>
                    <ChevronDown strokeWidth={2.5} className={["h-5 w-5 text-slate-700 dark:text-slate-200 transition-transform", isActive ? 'rotate-180' : 'rotate-0'].join(' ')} />
                  </button>

                  {/* Collapsible preview */}
                  <AnimatePresence initial={false}>
                    {isActive && (
                      <motion.div
                        key={`${f.key}-preview`}
                        initial={{ height: 0, opacity: 0 }}
                        animate={{ height: 'auto', opacity: 1 }}
                        exit={{ height: 0, opacity: 0 }}
                        className="overflow-hidden px-4 pb-3"
                      >
                        {f.bullets?.length ? (
                          <ul className="mt-2 space-y-1.5 text-xs text-slate-700 dark:text-slate-300">
                            {f.bullets.map((b) => (
                              <li key={b} className="flex items-center gap-2">
                                <span className="inline-flex h-5 w-5 shrink-0 items-center justify-center rounded-full bg-slate-100 dark:bg-slate-800/60 border border-slate-300 dark:border-slate-600">
                                  <Check className="h-3.5 w-3.5 text-slate-600 dark:text-slate-300" strokeWidth={2} />
                                </span>
                                <span>{b}</span>
                              </li>
                            ))}
                          </ul>
                        ) : null}
                      </motion.div>
                    )}
                  </AnimatePresence>
                </li>
              )
            })}
          </ul>
        </div>

        {/* Right detail panel */}
        <div className="md:col-span-7 lg:col-span-8">
          <Card className="relative overflow-hidden rounded-2xl border-slate-300 bg-slate-100 shadow-sm backdrop-blur dark:border-slate-700 dark:bg-slate-900/70">
            <CardContent className="p-6">
              <AnimatePresence mode="wait">
                <motion.div key={current.key} variants={fade} initial="hidden" animate="show" exit={{ opacity: 0, y: -6, transition: { duration: 0.15 } }}>
                  <div className="mb-4 flex items-center gap-3">
                    <span className="inline-flex h-10 w-10 items-center justify-center rounded-md bg-slate-100 text-slate-600 dark:bg-slate-800/60 dark:text-slate-300">
                      {React.createElement(getIcon(current.icon), { className: 'h-5 w-5' })}
                    </span>
                    <h3 className="text-lg font-semibold text-slate-900 dark:text-white">{current.title}</h3>
                  </div>

                  {/* Image on top */}
                  {current.assetId ? (
                    <div className="mb-5 overflow-hidden rounded-xl border border-slate-300 dark:border-slate-700">
                      <img
                        src={assetUrl(current.assetId, { width: 1280, quality: 80 })}
                        alt={current.title}
                        className="block h-auto w-full"
                        loading="lazy"
                      />
                    </div>
                  ) : Graphic ? (
                    <div className="mb-5 relative rounded-xl border border-dashed border-slate-300 p-6 dark:border-slate-700 min-h-[180px]">
                      <Graphic featureKey={current.key} />
                    </div>
                  ) : null}

                  {/* Snippet */}
                  {current.blurb ? (
                    <p className="text-sm leading-relaxed text-slate-700 dark:text-slate-300">{current.blurb}</p>
                  ) : null}

                  {/* Two columns of bullets */}
                  {current.bullets?.length ? (
                    <ul className="mt-5 grid grid-cols-1 gap-2 text-sm text-slate-700 dark:text-slate-300 sm:grid-cols-2">
                      {current.bullets.map((b) => (
                        <li key={b} className="flex items-center gap-2">
                          <span className="inline-flex h-5 w-5 shrink-0 items-center justify-center rounded-full bg-slate-100 dark:bg-slate-800/60 border border-slate-300 dark:border-slate-600">
                            <Check className="h-3.5 w-3.5 text-slate-600 dark:text-slate-300" strokeWidth={2} />
                          </span>
                          <span>{b}</span>
                        </li>
                      ))}
                    </ul>
                  ) : null}

                  {/* CTA under bullets; prefer Directus values when present */}
                  <div className="mt-6">
                    {current.pageLink && (current.ctaLabel || primaryCtaLabel) ? (
                      <a href={current.pageLink}>
                        <Button className="rounded-xl px-5 py-5 text-sm bg-white text-black border border-slate-400 hover:bg-slate-50">
                          {current.ctaLabel || primaryCtaLabel}
                        </Button>
                      </a>
                    ) : null}
                    {/* Secondary CTA via props remains optional */}
                    {!current.pageLink && secondaryCtaLabel ? (
                      <Button onClick={onSecondary} variant="secondary" className="ml-3 rounded-xl px-5 py-5 text-sm bg-white text-black border border-slate-400 hover:bg-slate-50">
                        {secondaryCtaLabel}
                      </Button>
                    ) : null}
                  </div>
                </motion.div>
              </AnimatePresence>
            </CardContent>
          </Card>
        </div>
      </div>

      {/* Mobile: Accordion */}
      <div className="md:hidden">
        <Accordion type="single" collapsible className="w-full">
          {features.map((f) => {
            const Icon = getIcon(f.icon)
            return (
              <AccordionItem key={f.key} value={f.key}>
                <AccordionTrigger className="text-left">
                  <div className="flex items-center gap-3">
                    <span className="inline-flex h-10 w-10 items-center justify-center rounded-md bg-slate-100 text-slate-600 dark:bg-slate-800/60 dark:text-slate-300">
                      <Icon className="h-5 w-5" />
                    </span>
                    <span className="text-sm font-medium">{f.title}</span>
                  </div>
                </AccordionTrigger>
                <AccordionContent>
                  <Card className="rounded-xl border-slate-300 bg-slate-100 shadow-sm backdrop-blur dark:border-slate-700 dark:bg-slate-900/70">
                    <CardContent className="p-4">
                      {/* Image on top (mobile) */}
                      {f.assetId ? (
                        <div className="mb-4 overflow-hidden rounded-xl border border-slate-300 dark:border-slate-700">
                          <img src={assetUrl(f.assetId, { width: 1200, quality: 80 })} alt={f.title} className="block h-auto w-full" loading="lazy" />
                        </div>
                      ) : null}
                      {f.blurb ? <p className="text-sm leading-relaxed text-slate-700 dark:text-slate-300">{f.blurb}</p> : null}
                      {f.bullets?.length ? (
                        <ul className="mt-4 grid grid-cols-1 gap-2 text-sm text-slate-700 dark:text-slate-300 sm:grid-cols-2">
                          {f.bullets.map((b) => (
                            <li key={b} className="flex items-center gap-2">
                              <span className="inline-flex h-5 w-5 shrink-0 items-center justify-center rounded-full bg-slate-100 dark:bg-slate-800/60 border border-slate-300 dark:border-slate-600">
                                <Check className="h-3.5 w-3.5 text-slate-600 dark:text-slate-300" strokeWidth={2} />
                              </span>
                              <span>{b}</span>
                            </li>
                          ))}
                        </ul>
                      ) : null}

                      <div className="mt-5">
                        {f.pageLink && (f.ctaLabel || primaryCtaLabel) ? (
                          <a href={f.pageLink}>
                            <Button className="rounded-xl px-5 py-5 text-sm bg-white text-black border border-slate-400 hover:bg-slate-50">{f.ctaLabel || primaryCtaLabel}</Button>
                          </a>
                        ) : null}
                        {!f.pageLink && secondaryCtaLabel ? (
                          <Button onClick={onSecondary} variant="secondary" className="ml-3 rounded-xl px-5 py-5 text-sm bg-white text-black border border-slate-400 hover:bg-slate-50">
                            {secondaryCtaLabel}
                          </Button>
                        ) : null}
                      </div>
                    </CardContent>
                  </Card>
                </AccordionContent>
              </AccordionItem>
            )
          })}
        </Accordion>
      </div>
    </section>
  )
}
