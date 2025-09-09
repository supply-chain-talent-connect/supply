import React, { useMemo } from 'react'
import useTrustLogos from '@/features/trust-logos/hooks/useTrustLogos'
import useLandingBlockCopy from '@/features/pages/hooks/useLandingBlockCopy'
import SectionHeader from '@/components/marketing/SectionHeader'
import { assetUrl } from '@/lib/directus'
import './TrustLogos.css'

type Props = {
  sectionId?: number
  className?: string
}

export default function TrustLogos({ sectionId = 1, className }: Props) {
  const data = useTrustLogos(sectionId)
  const copy = useLandingBlockCopy('trust_logos')
  const subheading = copy?.subheading
  const isMono = data?.isMonochrome
  const monoColor = data?.monochromeColor
  const scroll = data?.scrollLogos ?? true
  const speedRaw = data?.scrollSpeedSec ?? 30
  const clamped = Math.min(Math.max(speedRaw, 10), 120)
  const durationSec = 10 + (120 - clamped)

  // duplicate for seamless marquee
  const marqueeLogos = useMemo(() => {
    const src = data?.logos || []
    return [...src, ...src]
  }, [data?.logos])

  if (!data) return null
  // If there are no logos and no copy, skip rendering
  if (!data.logos?.length && !subheading) return null

  function renderLogo(logo: (typeof data.logos)[number]) {
    const label = logo.alt ?? logo.label
    const url = logo.imageId ? assetUrl(logo.imageId, { width: 320, format: 'webp', quality: 80 }) : undefined

    let node: React.ReactNode = null
    if (url && isMono && monoColor) {
      const style: React.CSSProperties = {
        color: monoColor as string,
        WebkitMaskImage: `url(${url})`,
        maskImage: `url(${url})`,
      }
      node = (
        <span
          role="img"
          aria-label={label || undefined}
          className="logo-mask h-10 w-40 sm:h-12 sm:w-48"
          style={style}
        />
      )
    } else if (url) {
      node = (
        <img
          src={url}
          alt={label || ''}
          loading="lazy"
          className="h-10 w-auto object-contain sm:h-12"
        />
      )
    } else if (label) {
      node = <span className="text-sm text-neutral-500">{label}</span>
    }

    if (data.enableLinks && logo.href) {
      return (
        <a
          href={logo.href}
          target="_blank"
          rel="noreferrer noopener"
          className="inline-flex items-center justify-center"
          aria-label={label || undefined}
        >
          {node}
        </a>
      )
    }
    return node
  }

  return (
    <section className={['w-full', className].filter(Boolean).join(' ')}>
      <SectionHeader heading={copy?.heading} subheading={subheading} size="xl" />
      {scroll ? (
        <div className="trust-logos-marquee full-bleed">
        <div
          className="trust-logos-track"
          style={{ ['--marquee-duration']: `${durationSec}s` } as React.CSSProperties & { ['--marquee-duration']?: string }}
        >
            {marqueeLogos.map((logo, idx) => (
              <div key={`${logo.id}-${idx}`} className="flex h-14 items-center justify-center sm:h-16">
                {renderLogo(logo)}
              </div>
            ))}
          </div>
        </div>
      ) : (
        <div className="full-bleed">
          <div className="mx-auto grid max-w-[1600px] grid-cols-2 items-center justify-items-center gap-6 px-4 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5">
            {(data.logos || []).map((logo) => (
              <div key={logo.id} className="flex h-14 w-full items-center justify-center sm:h-16">
                {renderLogo(logo)}
              </div>
            ))}
          </div>
        </div>
      )}
    </section>
  )
}
