import React from 'react'
import type { LucideIcon } from 'lucide-react'
import { Blend, ChartNoAxesColumn, CircleDot, Diamond, Sparkles, Users, Zap, Shapes, AreaChart, ListFilter, UserRound, Check } from 'lucide-react'

import { cn } from '@/lib/utils'
import { assetUrl } from '@/lib/directus'

import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs'
import SectionHeader from '@/components/marketing/SectionHeader'

import useLandingBlockCopy from '@/features/pages/hooks/useLandingBlockCopy'
import useFeaturesAccordion from '@/features/feature-accordion/hooks/useFeaturesAccordion'

type FeatureContent = {
  title: string
  description?: string
  image?: string
  className?: string
}

// Map Directus/Material-style icon identifiers to lucide-react icons
const iconMap: Record<string, LucideIcon> = {
  // Provided examples
  emoji_people: Users,
  users: Users,
  people: Users,
  user_group: Users,
  user_round: UserRound,
  bolt: Zap,
  zap: Zap,
  play_shapes: Shapes,
  shapes: Shapes,
  area_chart: AreaChart,
  areachart: AreaChart,
  filter_list_alt: ListFilter,
  list_filter: ListFilter,
  filter: ListFilter,
  // Previous mappings and variants
  circle_dot: CircleDot,
  'circle-dot': CircleDot,
  circleDot: CircleDot as unknown as LucideIcon,
  blend: Blend,
  diamond: Diamond,
  chart_no_axes_column: ChartNoAxesColumn,
  'chart-no-axes-column': ChartNoAxesColumn,
  chartNoAxesColumn: ChartNoAxesColumn as unknown as LucideIcon,
}

function pickIcon(name?: string | null): LucideIcon {
  if (!name) return Sparkles
  const key = name.trim()
  return iconMap[key] || iconMap[key.toLowerCase()] || Sparkles
}

type Props = {
  headerLayout?: 'default' | 'two-col'
  className?: string
}

export default function Features({ headerLayout = 'default', className }: Props) {
  const copy = useLandingBlockCopy('features')
  const { data: features, loading } = useFeaturesAccordion()

  if (loading) {
    return (
      <section className="py-24 md:py-28 lg:py-32">
        <div className="container">
          <SectionHeader heading={copy?.heading} subheading={copy?.subheading} size="xl" />
          <div className="mt-6 grid grid-cols-1 gap-4 rounded-xl border p-3 md:mt-10 md:p-4 lg:mt-16 lg:grid-cols-4">
            <div className="flex h-auto gap-2 overflow-x-auto no-scrollbar rounded-xl bg-muted p-2 lg:flex-col lg:gap-0 lg:overflow-visible">
              {[0, 1, 2, 3].map((i) => (
                <div key={i} className="shrink-0 w-56 rounded-lg p-4 md:w-64 lg:w-full">
                  <div className="h-7 w-7 rounded-md bg-muted-foreground/20 animate-pulse" />
                  <div className="mt-3 h-4 w-40 rounded bg-muted-foreground/20 animate-pulse" />
                  <div className="mt-2 h-3 w-56 rounded bg-muted-foreground/10 animate-pulse" />
                </div>
              ))}
            </div>
            <div className="col-span-1 h-56 rounded-xl bg-muted/40 animate-pulse sm:h-64 md:h-80 lg:col-span-3" />
          </div>
        </div>
      </section>
    )
  }

  if (!features?.length) return null

  const defaultValue = features[0]?.title || String(features[0]?.id)

  return (
    <section className={cn('py-24 md:py-28 lg:py-32 dark:bg-[#2F332E]', className)}>
      <div className="container">
        {headerLayout === 'two-col' ? (
          <div className="flex gap-3 max-md:flex-col">
            <h2 className="flex-1 text-3xl leading-tight font-semibold tracking-tight text-balance md:text-4xl lg:text-5xl">
              {copy?.heading}
            </h2>
            {copy?.subheading ? (
              <p className="flex-1 self-end text-lg font-medium text-muted-foreground">{copy.subheading}</p>
            ) : null}
          </div>
        ) : (
          <SectionHeader heading={copy?.heading} subheading={copy?.subheading} size="xl" />
        )}

        <Tabs
          defaultValue={defaultValue}
          orientation="vertical"
          className="border-muted2 mt-6 grid grid-cols-1 gap-4 rounded-xl border p-3 md:mt-10 md:p-4 lg:mt-16 lg:grid-cols-4"
        >
          <TabsList className="flex h-auto flex-row gap-2 overflow-x-auto no-scrollbar rounded-xl bg-muted p-1.5 -mx-1.5 px-1.5 snap-x snap-mandatory lg:mx-0 lg:flex-col lg:gap-0 lg:overflow-visible lg:p-1.5">
            {features.map((feature) => {
              const Icon = pickIcon(feature.icon)
              const value = feature.title || feature.key
              return (
                <TabsTrigger
                  key={value}
                  value={value}
                  className="shrink-0 snap-start w-auto lg:w-full justify-start rounded-lg px-3 py-2 md:px-4 md:py-3 text-start whitespace-normal text-gray-700 transition-all duration-300 data-[state=active]:bg-background data-[state=active]:text-black data-[state=active]:shadow-2xl lg:px-6 lg:py-4 dark:text-gray-300 dark:data-[state=active]:text-white"
                >
                  <div>
                    <Icon className="size-6 md:size-7 lg:size-9" />
                    <h3 className="mt-3 text-sm md:text-base font-semibold">{feature.title}</h3>
                    {feature.blurb ? (
                      <p className="mt-1 text-sm text-muted-foreground line-clamp-2">{feature.blurb}</p>
                    ) : null}
                  </div>
                </TabsTrigger>
              )
            })}
          </TabsList>

          {features.map((feature) => {
            const value = feature.title || feature.key
            const content: FeatureContent = {
              title: feature.title,
              description: feature.blurb,
              image:
                feature.assetId && feature.assetType?.startsWith('image/')
                  ? assetUrl(feature.assetId, { width: 1600, format: 'webp', quality: 80 })
                  : undefined,
            }
            return (
              <TabsContent
                className={cn('col-span-1 m-0 overflow-hidden rounded-xl bg-background lg:col-span-3', content.className)}
                key={value}
                value={value}
              >
                {feature.assetId && feature.assetType?.startsWith('video/') ? (
                  <video
                    src={assetUrl(feature.assetId)}
                    className="h-56 w-full rounded-lg object-cover sm:h-64 md:h-80 lg:h-[512px] lg:flex-1"
                    autoPlay
                    muted
                    loop
                    playsInline
                  />
                ) : content.image ? (
                  <img
                    src={content.image}
                    alt={feature.title}
                    className="h-56 w-full rounded-lg object-cover sm:h-64 md:h-80 lg:h-[512px] lg:flex-1"
                    loading="lazy"
                  />
                ) : null}

                <div className="mt-6">
                  <h4 className="text-2xl font-semibold md:text-3xl">{content.title}</h4>
                  {content.description ? (
                    <p className="mt-3 text-base text-muted-foreground md:text-lg">{content.description}</p>
                  ) : null}

                  {feature.bullets?.length ? (
                    <ul className="mt-6 grid grid-cols-1 gap-3 md:grid-cols-2">
                      {feature.bullets.map((b, idx) => (
                        <li key={idx} className="flex items-start gap-3">
                          <span className="mt-0.5 inline-flex size-5 items-center justify-center rounded-full bg-gray-200">
                            <Check className="size-3.5 text-slate-600" strokeWidth={3} />
                          </span>
                          <span className="text-sm md:text-base text-foreground/90">{b}</span>
                        </li>
                      ))}
                    </ul>
                  ) : null}
                </div>
              </TabsContent>
            )
          })}
        </Tabs>
      </div>
    </section>
  )
}
