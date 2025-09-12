"use client";

import React, { useEffect, useState } from 'react'
import { motion } from 'motion/react'
import useHero from '@/features/hero/hooks/useHero'
import HeroAnimatedHeading from '@/components/marketing/hero/HeroAnimatedHeading'
import HeroMap from '@/components/marketing/hero/HeroMap'
import { ArrowRight } from 'lucide-react'
import { Button as MovingBorderButton } from '@/components/ui/moving-border'

export default function Hero() {
  const hero = useHero(1)
  const heading = hero?.heading ?? ''
  const highlighted = hero?.heading_highlighted ?? ''
  const supporting = hero?.supporting_text ?? 'With AI, you can launch your website in hours, not days.'
  const supporting2 = hero?.supporting_text2 ?? ''
  const cta1 = hero?.cta ?? ''
  const cta2 = hero?.cta2 ?? ''
  const [finishAt, setFinishAt] = useState(0)
  const hasHeadingNodes = (heading?.trim()?.length ?? 0) > 0
  // Stagger subsequent elements to appear after heading is done
  const paragraphDelay = finishAt + 0.1
  const ctasDelay = finishAt + 0.25
  const dividerDelay = ctasDelay + 0.1
  const candidatesDelay = ctasDelay + 0.2
  const mapDelay = finishAt + 0.4

  // Broadcast a global signal once the hero heading is done animating
  useEffect(() => {
    if (!hasHeadingNodes) return
    const ms = Math.max(0, finishAt * 1000)
    const timer = window.setTimeout(() => {
      try {
        window.dispatchEvent(new CustomEvent('hero:ready', { detail: { finishAt } }))
        document.documentElement.setAttribute('data-hero-ready', 'true')
      } catch {
        // no-op
      }
    }, ms)
    return () => {
      window.clearTimeout(timer)
      document.documentElement.removeAttribute('data-hero-ready')
    }
  }, [hasHeadingNodes, finishAt])
  return (
    <div className="relative mx-auto w-full max-w-[1800px] px-6">This is a test
      <div className="py-10 md:py-20">
        <div className="relative grid md:grid-cols-2 md:items-center">
          {/* Left: Map (borderless, bleeds to edge, underlaps text) */}
          <HeroMap startDelay={mapDelay} />
          {/* Right: Copy */}
          <div className="flex flex-col items-center md:items-start text-center md:text-left">
            <HeroAnimatedHeading
              heading={heading}
              highlighted={highlighted}
              onFinishAt={setFinishAt}
              className="text-center md:text-left mx-auto md:mx-0"
            />
            {hasHeadingNodes && (
              <>
                <motion.p
                  initial={{ opacity: 0 }}
                  animate={{ opacity: 1 }}
                  transition={{ duration: 0.3, delay: paragraphDelay }}
                  className="relative z-10 max-w-xl py-4 text-center md:text-left text-lg font-normal text-neutral-600 dark:text-neutral-400"
                >
                  {supporting}
                </motion.p>
                <motion.div
                  initial={{ opacity: 0 }}
                  animate={{ opacity: 1 }}
                  transition={{ duration: 0.3, delay: ctasDelay }}
                  className="relative z-10 mt-6 flex flex-wrap items-center justify-center md:justify-start gap-4"
                >
                  <MovingBorderButton
                    as="a"
                    href="#get-started"
                    borderRadius="0.75rem"
                    duration={8000}
                    className="min-w-60"
                    containerClassName="[--mb-color:#FF0080]"
                  >
                    {cta1}
                  </MovingBorderButton>
                </motion.div>

                {supporting2 && (
                  <>
                    <motion.hr
                      initial={{ opacity: 0 }}
                      animate={{ opacity: 1 }}
                      transition={{ duration: 0.3, delay: dividerDelay }}
                      className="relative z-10 my-6 h-px w-full border-0 bg-transparent"
                      style={{
                        backgroundImage:
                          'repeating-linear-gradient(90deg, rgba(115,115,115,0.35) 0, rgba(115,115,115,0.35) 6px, transparent 6px, transparent 12px)',
                      } as React.CSSProperties}
                    />
                    <motion.p
                      initial={{ opacity: 0, y: 4 }}
                      animate={{ opacity: 1, y: 0 }}
                      transition={{ duration: 0.3, delay: candidatesDelay }}
                      className="relative z-10 max-w-xl text-center md:text-left text-sm text-neutral-600 dark:text-neutral-400"
                      style={{ textWrap: 'balance' } as React.CSSProperties}
                    >
                      {supporting2}
                    </motion.p>
                    <motion.div
                      initial={{ opacity: 0, y: 4 }}
                      animate={{ opacity: 1, y: 0 }}
                      transition={{ duration: 0.3, delay: candidatesDelay + 0.05 }}
                      className="relative z-10 mt-3"
                    >
                      <a
                        href="#contact"
                        className="group inline-flex items-center text-xs font-semibold uppercase tracking-widest underline-offset-4 hover:underline"
                        style={{ color: '#3588C0' }}
                      >
                        {cta2}
                        <ArrowRight className="ml-2 size-4 transition-transform group-hover:translate-x-0.5" />
                      </a>
                    </motion.div>
                  </>
                )}
              </>
            )}
          </div>
        </div>
      </div>
    </div>
  )
}
 

// Build hub-and-spoke arcs from cities
// Dots are now sourced from Directus map animations via useMapAnimationDots
