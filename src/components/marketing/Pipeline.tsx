import React, { useEffect, useMemo, useState } from 'react'
import { useTranslation } from 'react-i18next'
import { fetchLandingBlockCopy } from '@/features/pages/api/queries'

type Copy = { heading?: string; subheading?: string }

export default function Pipeline() {
  const { i18n, t } = useTranslation()
  const [copy, setCopy] = useState<Copy>({})

  useEffect(() => {
    let active = true
    fetchLandingBlockCopy('pipeline', i18n.language).then((res) => {
      if (active) setCopy(res ?? {})
    })
    return () => {
      active = false
    }
  }, [i18n.language])

  const heading = copy.heading ?? t('marketing.pipeline.heading', 'Pipeline Mockup')
  const subheading =
    copy.subheading ??
    t(
      'marketing.pipeline.subheading',
      'This is a visual placeholder. Final interactive animation coming soon.',
    )

  // Generate some faux series heights to bring the UI to life
  // Placeholder tile sizes to hint at charts/cards without copying source visuals
  const tiles = useMemo(
    () => [
      { w: 'minmax(260px,1fr)', h: 220 },
      { w: 'minmax(220px,1fr)', h: 180 },
      { w: 'minmax(220px,1fr)', h: 180 },
      { w: 'minmax(260px,1fr)', h: 220 },
    ],
    [],
  )

  return (
    <section className="relative border-t border-subtle-stroke bg-gradient-to-b from-[#FDFDFD] to-white">
      {/* dashed top separator */}
      <svg width="100%" height="1" className="text-subtle-stroke absolute inset-x-0 -top-px">
        <line x1="0" y1="0.5" x2="100%" y2="0.5" stroke="currentColor" strokeDasharray="4 6" strokeLinecap="round" />
      </svg>

      <div className="container mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mx-auto max-w-3xl py-10 text-center md:py-14">
          <h2 className="text-balance text-2xl font-semibold tracking-tight sm:text-3xl md:text-4xl">
            {heading}
          </h2>
          {subheading && (
            <p className="mt-2 text-pretty text-sm text-neutral-600 dark:text-neutral-400 sm:text-base">
              {subheading}
            </p>
          )}
        </div>

        {/* Frame with side dashed rails */}
        <div className="relative">
          <svg width="1" height="100%" className="text-subtle-stroke absolute -left-px top-0 hidden h-full lg:block">
            <line x1="0.5" y1="0" x2="0.5" y2="100%" stroke="currentColor" strokeDasharray="4 6" strokeLinecap="round" />
          </svg>
          <svg width="1" height="100%" className="text-subtle-stroke absolute -right-px top-0 hidden h-full lg:block">
            <line x1="0.5" y1="0" x2="0.5" y2="100%" stroke="currentColor" strokeDasharray="4 6" strokeLinecap="round" />
          </svg>

          {/* Tabs */}
          <div className="grid w-full grid-cols-2 gap-px bg-subtle-stroke lg:grid-cols-4">
            {['Data', 'Workflows', 'Reporting', 'Pipeline'].map((label, i) => (
              <div key={label} className="relative w-full overflow-hidden">
                <button
                  className={[
                    'flex h-12 w-full items-center justify-center border-b border-subtle-stroke px-4 text-[15px] font-medium leading-5 transition-colors',
                    i === 3
                      ? 'bg-secondary-background text-secondary-foreground'
                      : 'bg-primary-background text-accent-foreground hover:text-secondary-foreground',
                  ].join(' ')}
                  type="button"
                >
                  {t(`marketing.pipeline.tabs.${label.toLowerCase()}`, label)}
                </button>
                <div className="absolute inset-x-0 bottom-0 h-[3px] bg-subtle-stroke">
                  <div
                    className="h-full bg-black"
                    style={{ width: i === 3 ? '0%' : '100%' }}
                  />
                </div>
              </div>
            ))}
          </div>

          {/* Device mock + placeholder shimmer tiles */}
          <div className="relative mx-auto mt-6 max-w-[1100px] overflow-hidden rounded-lg border border-default-stroke bg-white shadow-[0_2px_6px_rgba(28,40,64,0.06),0_6px_20px_-2px_rgba(28,40,64,0.08)]">
            {/* Ribbon */}
            <div className="pointer-events-none absolute right-2 top-2 z-10 select-none rounded bg-amber-100/90 px-2 py-0.5 text-[11px] font-semibold text-amber-900 shadow-sm">
              {t('marketing.pipeline.placeholderRibbon', 'Mockup Placeholder')}
            </div>

            <div className="grid h-[380px] w-full grid-rows-[auto_1fr] md:h-[520px] lg:h-[640px]">
              <div className="border-b border-[#EEEFF1] bg-[#FBFBFB] px-3 py-2.5 md:px-4 md:py-3">
                <div className="flex items-center justify-between">
                  <div className="flex items-center gap-2 text-sm font-medium text-secondary-foreground">
                    <span className="inline-flex size-2 rounded-full bg-[#E6E7EA]" />
                    <span className="inline-flex size-2 rounded-full bg-[#E6E7EA]" />
                    <span className="inline-flex size-2 rounded-full bg-[#E6E7EA]" />
                  </div>
                  <div className="text-xs text-[#75777C]">
                    {t('marketing.pipeline.caption', 'Demo data')}
                  </div>
                </div>
              </div>

              <div className="relative p-4 md:p-6 lg:p-8">
                {/* Background animated gradient to suggest activity */}
                <div className="pointer-events-none absolute inset-0 -z-10 opacity-40 [mask-image:radial-gradient(60%_60%_at_50%_50%,black,transparent)]">
                  <div className="h-full w-full animate-gradient bg-[length:200%_200%] bg-gradient-to-tr from-[#EAEAF6] via-[#F4F5F6] to-[#EAEAF6]" />
                </div>

                {/* Shimmer tiles */}
                <div className="grid grid-cols-1 gap-3 md:grid-cols-2 md:gap-4 lg:grid-cols-2 lg:gap-6">
                  {tiles.map((tCfg, idx) => (
                    <div
                      key={idx}
                      className="relative overflow-hidden rounded-md border border-[#EEEFF1] bg-white"
                      style={{ gridTemplateColumns: tCfg.w, height: tCfg.h }}
                    >
                      {/* faux header */}
                      <div className="flex items-center justify-between border-b border-[#EEEFF1] px-3 py-2">
                        <div className="h-3 w-24 animate-shimmer rounded bg-[#F4F5F6]" />
                        <div className="h-3 w-10 animate-shimmer rounded bg-[#F4F5F6]" />
                      </div>
                      {/* body */}
                      <div className="relative h-full p-3">
                        <div className="absolute inset-3 rounded bg-[#FBFBFB]">
                          <div className="absolute inset-x-4 bottom-4 flex items-end gap-1">
                            {Array.from({ length: 10 }).map((_, bi) => (
                              <div
                                key={bi}
                                className="w-[8%] rounded bg-[#E6E7EA]"
                                style={{
                                  height: `${40 + ((bi * 37) % 120)}px`,
                                  animation: `placeholder-bounce 1800ms ${bi * 80}ms ease-in-out infinite alternate`,
                                }}
                              />
                            ))}
                          </div>
                        </div>
                      </div>
                      {/* shimmer veil */}
                      <div className="pointer-events-none absolute inset-0 animate-veil bg-[linear-gradient(100deg,transparent_20%,rgba(255,255,255,0.6)_40%,transparent_60%)]" />
                    </div>
                  ))}
                </div>

                {/* Watermark */}
                <div className="pointer-events-none mt-4 text-center text-[11px] text-neutral-500">
                  {t('marketing.pipeline.watermark', 'Placeholder animation for preview only')}
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Local keyframes for the bar animation */}
      <style>{`
        @keyframes placeholder-bounce {
          from { transform: translateY(4px) scaleY(0.9); }
          to   { transform: translateY(0px) scaleY(1.0); }
        }
        @keyframes gradient-shift {
          0% { background-position: 0% 50%; }
          50% { background-position: 100% 50%; }
          100% { background-position: 0% 50%; }
        }
        .animate-gradient { animation: gradient-shift 6s ease-in-out infinite; }
        .animate-shimmer {
          position: relative;
          overflow: hidden;
          background-clip: padding-box;
        }
        .animate-veil { animation: gradient-shift 2.2s linear infinite; }
      `}</style>
    </section>
  )
}
