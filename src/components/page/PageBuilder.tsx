import React, { useEffect, useState } from 'react'
import { fetchLandingPageOrder, type LandingPageBlock } from '@/features/pages/api/queries'
import Hero from '@/components/marketing/Hero'
import TrustLogos from '@/components/marketing/TrustLogos'
import Community from '@/components/marketing/Community'
import Features from '@/components/marketing/Features'
import Pricing from '@/components/marketing/Pricing'
import Testimonials from '@/components/marketing/Testimonials'
import FAQ from '@/components/marketing/FAQ'

const registry: Record<string, React.ComponentType<unknown>> = {
  hero: Hero,
  trust_logos: TrustLogos,
  community: Community,
  features: Features,
  pricing: Pricing,
  testimonials: Testimonials,
  faq: FAQ,
}

export default function PageBuilder() {
  const [blocks, setBlocks] = useState<LandingPageBlock[]>([])
  useEffect(() => {
    let active = true
    fetchLandingPageOrder().then((rows) => {
      if (active) setBlocks(rows)
    })
    return () => {
      active = false
    }
  }, [])

  return (
    <>
      {blocks.map((b) => {
        const C = registry[b.page]
        if (!C) {
          if (import.meta.env.DEV) console.warn('[PageBuilder] Unknown block', b.page)
          return null
        }
        return <C key={`${b.page}-${b.id}`} />
      })}
    </>
  )
}
