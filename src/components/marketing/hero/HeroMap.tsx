"use client";

import React from 'react'
import { motion } from 'motion/react'
import WorldMap from '@/components/ui/world-map'
import useMapAnimationDots from '@/features/hero/hooks/useMapAnimationDots'

type Props = {
  startDelay: number
  className?: string
}

export default function HeroMap({ startDelay, className }: Props) {
  const dots = useMapAnimationDots(1)
  return (
    <motion.div
      initial={{ opacity: 0, y: 10 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: 0.8, delay: 0.2, ease: 'easeOut' }}
      className={[
        'relative z-0 hidden md:block md:col-span-1 md:self-center md:ml-[-1rem] lg:ml-[-2rem] xl:ml-[-4rem]',
        className,
      ]
        .filter(Boolean)
        .join(' ')}
    >
      <div className="relative h-[500px] w-full overflow-hidden">
        <div className="pointer-events-none absolute inset-0 bg-[radial-gradient(900px_340px_at_0%_0%,rgba(2,6,23,0.65),transparent_60%)] dark:bg-[radial-gradient(900px_340px_at_0%_0%,rgba(2,6,23,0.75),transparent_60%)]" />
        {dots.length > 0 ? (
          <WorldMap dots={dots} startDelay={startDelay} arcDuration={2.8} arcGap={0.5} sequential />
        ) : (
          <WorldMap dots={[]} startDelay={startDelay} arcDuration={2.8} arcGap={0.5} sequential />
        )}
      </div>
    </motion.div>
  )
}

