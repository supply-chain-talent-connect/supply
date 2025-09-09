import React from 'react'
import { motion } from 'framer-motion'
import { Check, Star, TrendingUp, Zap } from 'lucide-react'
import { Card, CardHeader, CardTitle, CardContent, CardFooter } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Button as MovingBorderButton } from '@/components/ui/moving-border'
import { Badge } from '@/components/ui/badge'

export type PricingCardProps = {
  name: string
  tagline?: string
  highlight?: boolean
  displayPrice: string
  priceSuffix: string
  underPriceNote?: string
  valueProps: string[]
  ctaHref?: string
  ctaLabel?: string
  animationDelay?: number
  badgeLabel?: string
  topRight?: React.ReactNode
}

export function PricingCard({
  name,
  tagline,
  highlight,
  displayPrice,
  priceSuffix,
  underPriceNote,
  valueProps,
  ctaHref = '#',
  ctaLabel = 'Choose plan',
  animationDelay = 0,
  badgeLabel,
  topRight,
}: PricingCardProps) {
  return (
    <motion.div
      initial={{ opacity: 0, y: 16 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: 0.4, delay: animationDelay }}
      className="h-full"
    >
      <Card
        className={
          'relative h-full flex flex-col border-slate-200 shadow-sm rounded-2xl transition-all duration-200 ' +
          'hover:shadow-lg hover:-translate-y-0.5 ' +
          (highlight ? 'ring-2 ring-blue-500' : '')
        }
      >
        {highlight && (
          <Badge className="absolute -top-3 left-1/2 -translate-x-1/2 bg-blue-600 text-white rounded-full px-3 py-1">
            {badgeLabel ?? 'Most popular'}
          </Badge>
        )}

        <CardHeader className="p-4 md:p-6">
          <div className="flex items-start justify-between gap-3">
            <div className="flex items-center gap-2">
              <CardTitle className="text-2xl font-bold flex items-center gap-2">
                {name}
                {highlight ? <TrendingUp className="h-5 w-5" /> : null}
              </CardTitle>
            </div>
            <div className="shrink-0">
              {topRight ? (
                topRight
              ) : highlight ? (
                <Star className="h-5 w-5 text-amber-500" />
              ) : (
                <Zap className="h-5 w-5 text-slate-400" />
              )}
            </div>
          </div>
          {tagline ? <p className="text-sm text-slate-500">{tagline}</p> : null}

          <div className="mt-4 flex items-end gap-1">
            <span className="text-4xl font-extrabold tracking-tight">{displayPrice}</span>
            <span className="text-slate-500 mb-1">{priceSuffix}</span>
          </div>
          {underPriceNote ? <p className="text-xs text-slate-500 mt-1">{underPriceNote}</p> : null}
        </CardHeader>

        <CardContent className="pt-0 flex-1 p-4 md:p-6">
          <ul className="space-y-3">
            {valueProps.map((v) => (
              <li key={v} className="flex items-start gap-3">
                <Check className="h-5 w-5 mt-0.5" />
                <span>{v}</span>
              </li>
            ))}
          </ul>
        </CardContent>

        <CardFooter className="pt-4 md:pt-0 p-4 md:p-6 mt-auto">
          {highlight ? (
            <div className="w-full">
              <MovingBorderButton as="a" href={ctaHref} className="w-full py-4" containerClassName="w-full">
                {ctaLabel}
              </MovingBorderButton>
            </div>
          ) : (
            <Button className={'w-full rounded-xl text-base py-6'} variant="secondary" asChild>
              <a href={ctaHref}>{ctaLabel}</a>
            </Button>
          )}
        </CardFooter>
      </Card>
    </motion.div>
  )
}

export default PricingCard
