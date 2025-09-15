import React from 'react'
import { cn } from '@/lib/utils'
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs'
import type { FeatureUI } from '@/features/feature-accordion/api/queries'
import { assetUrl } from '@/lib/directus'
import type { LucideIcon } from 'lucide-react'
import { CircleDot, Blend, Diamond, ChartNoAxesColumn, Zap, Users, Share2, BarChart3 } from 'lucide-react'

type Props = {
  features: FeatureUI[]
  className?: string
}

const directusIconMap: Record<string, LucideIcon> = {
  bolt: Zap,
  emoji_people: Users,
  play_shapes: Share2,
  area_chart: BarChart3,
}

function iconFor(name?: string): LucideIcon {
  if (name && directusIconMap[name]) return directusIconMap[name]
  return CircleDot
}

export default function FeatureTabs({ features, className }: Props) {
  if (!features?.length) return null
  const first = String(features[0].id)

  return (
    <section className={cn('py-8 md:py-12', className)}>
      <Tabs
        defaultValue={first}
        orientation="vertical"
        className="border-muted mt-6 grid grid-cols-1 gap-4 rounded-xl border p-4 lg:mt-10 lg:grid-cols-4"
      >
        <TabsList className="flex h-auto flex-col justify-start rounded-xl bg-muted p-1.5">
          {features.map((f) => {
            const Icon = iconFor(f.icon)
            const value = String(f.id)
            return (
              <TabsTrigger
                key={value}
                value={value}
                className="w-full justify-start rounded-lg px-4 py-3 text-start whitespace-normal text-gray-700 transition-colors duration-300 data-[state=active]:text-black data-[state=active]:shadow-lg lg:px-6 lg:py-4 dark:text-gray-300 dark:data-[state=active]:text-white"
              >
                <div className="flex gap-3">
                  <Icon className="size-7 md:size-8 lg:size-9" />
                  <div>
                    <h3 className="font-semibold">{f.title}</h3>
                    {f.blurb ? (
                      <p className="mt-1 text-sm text-muted-foreground">{f.blurb}</p>
                    ) : null}
                  </div>
                </div>
              </TabsTrigger>
            )
          })}
        </TabsList>

        {features.map((f) => {
          const value = String(f.id)
          return (
            <TabsContent
              key={value}
              value={value}
              className={cn('col-span-1 m-0 overflow-hidden rounded-xl bg-background lg:col-span-3')}
            >
              {f.blurb ? (
                <div className="max-w-2xl pb-4 text-balance">
                  <h4 className="inline font-semibold">{f.title} </h4>
                  <span className="mt-2 font-medium text-pretty text-muted-foreground">{f.blurb}</span>
                </div>
              ) : null}
              {f.assetId ? (
                <img
                  src={assetUrl(f.assetId, { width: 1600, quality: 80 })}
                  alt={f.title}
                  className="h-[420px] w-full rounded-lg object-cover lg:h-[512px] lg:flex-1"
                  loading="lazy"
                />
              ) : null}
            </TabsContent>
          )
        })}
      </Tabs>
    </section>
  )
}

