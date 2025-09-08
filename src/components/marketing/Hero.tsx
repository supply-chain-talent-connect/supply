"use client";

import React, { useEffect, useMemo } from 'react'
import { motion } from 'motion/react'
import WorldMap from '@/components/ui/world-map'
import useHero from '@/features/hero/hooks/useHero'
import { AuroraText } from '@/components/magicui/aurora-text'

export default function Hero() {
  const hero = useHero(1)
  const heading = hero?.heading ?? ''
  const highlighted = hero?.heading_highlighted ?? ''
  const supporting = hero?.supporting_text ?? 'With AI, you can launch your website in hours, not days.'
  const cta1 = hero?.CTA ?? 'Explore Now'
  const cta2 = hero?.CTA2 ?? 'Contact Support'
  // Build animated heading and compute when it finishes to sync other elements
  const { nodes: headingNodes, finishAt } = useMemo(() => buildHeadingNodes(heading, highlighted), [heading, highlighted])
  const hasHeadingNodes = headingNodes.length > 0
  // Stagger subsequent elements to appear after heading is done
  const paragraphDelay = finishAt + 0.1
  const ctasDelay = finishAt + 0.25
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
    <div className="relative mx-auto flex w-full max-w-[1600px] flex-col items-center justify-center px-4">
      <div className="py-10 md:py-20">
        <h1 className="relative z-10 mx-auto max-w-4xl text-center text-2xl font-bold text-slate-700 md:text-4xl lg:text-7xl dark:text-slate-300">
          {headingNodes}
        </h1>
        {hasHeadingNodes && (
          <>
            <motion.p
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              transition={{ duration: 0.3, delay: paragraphDelay }}
              className="relative z-10 mx-auto max-w-xl py-4 text-center text-lg font-normal text-neutral-600 dark:text-neutral-400"
            >
              {supporting}
            </motion.p>
            <motion.div
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              transition={{ duration: 0.3, delay: ctasDelay }}
              className="relative z-10 mt-8 flex flex-wrap items-center justify-center gap-4"
            >
              <a
                href="#get-started"
                className="w-60 transform rounded-lg bg-black px-6 py-2 text-center font-medium text-white transition-all duration-300 hover:-translate-y-0.5 hover:bg-gray-800 dark:bg-white dark:text-black dark:hover:bg-gray-200"
              >
                {cta1}
              </a>
              <a
                href="#contact"
                className="w-60 transform rounded-lg border border-gray-300 bg-white px-6 py-2 text-center font-medium text-black transition-all duration-300 hover:-translate-y-0.5 hover:bg-gray-100 dark:border-gray-700 dark:bg-black dark:text-white dark:hover:bg-gray-900"
              >
                {cta2}
              </a>
            </motion.div>
            <motion.div
              initial={{ opacity: 0, y: 10 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ duration: 0.3, delay: mapDelay }}
              className="relative z-10 mt-20 rounded-3xl border border-neutral-200 bg-neutral-100 p-4 shadow-md dark:border-neutral-800 dark:bg-neutral-900 hidden md:block"
            >
              <div className="relative h-[500px] w-full overflow-hidden rounded-xl border border-gray-300 dark:border-gray-700">
                <WorldMap
                  dots={[
                    { start: { lat: 64.2008, lng: -149.4937 }, end: { lat: 34.0522, lng: -118.2437 } },
                    { start: { lat: 64.2008, lng: -149.4937 }, end: { lat: -15.7975, lng: -47.8919 } },
                    { start: { lat: -15.7975, lng: -47.8919 }, end: { lat: 38.7223, lng: -9.1393 } },
                    { start: { lat: 51.5074, lng: -0.1278 }, end: { lat: 28.6139, lng: 77.209 } },
                    { start: { lat: 28.6139, lng: 77.209 }, end: { lat: 43.1332, lng: 131.9113 } },
                    { start: { lat: 28.6139, lng: 77.209 }, end: { lat: -1.2921, lng: 36.8219 } },
                  ]}
                />
              </div>
            </motion.div>
          </>
        )}
      </div>
    </div>
  )
}

// Animation cadence constants
const WORD_STEP = 0.1
const WORD_DURATION = 0.3

type HeadingBuild = { nodes: React.ReactNode[]; finishAt: number }

function buildHeadingNodes(heading: string, highlighted: string): HeadingBuild {
  const nodes: React.ReactNode[] = []
  let lastIndexDelay = 0

  const words = heading.trim().length ? heading.trim().split(' ') : []

  // Edge: no highlight provided
  if (!highlighted) {
    words.forEach((word, i) => {
      nodes.push(
        <motion.span
          key={`w-${i}`}
          initial={{ opacity: 0, filter: 'blur(4px)', y: 10 }}
          animate={{ opacity: 1, filter: 'blur(0px)', y: 0 }}
          transition={{ duration: WORD_DURATION, delay: i * WORD_STEP, ease: 'easeInOut' }}
          className="mr-2 inline-block"
        >
          {word}
        </motion.span>,
      )
    })
    if (words.length > 0) lastIndexDelay = (words.length - 1) * WORD_STEP
    return { nodes, finishAt: lastIndexDelay + WORD_DURATION }
  }

  // Try to find the highlighted substring within heading
  const idx = heading.indexOf(highlighted)

  // Not contained: animate all words then append aurora-highlight as its own animated unit
  if (idx === -1) {
    words.forEach((word, i) => {
      nodes.push(
        <motion.span
          key={`h-${i}`}
          initial={{ opacity: 0, filter: 'blur(4px)', y: 10 }}
          animate={{ opacity: 1, filter: 'blur(0px)', y: 0 }}
          transition={{ duration: WORD_DURATION, delay: i * WORD_STEP, ease: 'easeInOut' }}
          className="mr-2 inline-block"
        >
          {word}
        </motion.span>,
      )
    })
    // Animate the Aurora segment in sequence as if it were a word
    const auroraDelay = words.length * WORD_STEP
    nodes.push(
      <motion.span
        key={`aurora-only`}
        initial={{ opacity: 0, filter: 'blur(4px)', y: 10 }}
        animate={{ opacity: 1, filter: 'blur(0px)', y: 0 }}
        transition={{ duration: WORD_DURATION, delay: auroraDelay, ease: 'easeInOut' }}
        className="ml-2 inline-block"
      >
        <AuroraText className="inline-block">{highlighted}</AuroraText>
      </motion.span>,
    )
    lastIndexDelay = auroraDelay
    return { nodes, finishAt: lastIndexDelay + WORD_DURATION }
  }

  // Contained: split before/after and sequence (before words) -> (aurora) -> (after words)
  const before = heading.slice(0, idx).trim()
  const after = heading.slice(idx + highlighted.length).trim()
  const beforeWords = before ? before.split(' ') : []
  const afterWords = after ? after.split(' ') : []

  // Before words
  beforeWords.forEach((word, i) => {
    nodes.push(
      <motion.span
        key={`b-${i}`}
        initial={{ opacity: 0, filter: 'blur(4px)', y: 10 }}
        animate={{ opacity: 1, filter: 'blur(0px)', y: 0 }}
        transition={{ duration: WORD_DURATION, delay: i * WORD_STEP, ease: 'easeInOut' }}
        className="mr-2 inline-block"
      >
        {word}
      </motion.span>,
    )
  })

  // Aurora highlighted segment, delayed right after beforeWords
  const auroraDelay = beforeWords.length * WORD_STEP
  nodes.push(
    <motion.span
      key={`aurora-contained`}
      initial={{ opacity: 0, filter: 'blur(4px)', y: 10 }}
      animate={{ opacity: 1, filter: 'blur(0px)', y: 0 }}
      transition={{ duration: WORD_DURATION, delay: auroraDelay, ease: 'easeInOut' }}
      className="inline-block"
    >
      <AuroraText className="inline-block">{highlighted}</AuroraText>
    </motion.span>,
  )

  // After words start after the aurora (treat aurora as one word in sequence)
  afterWords.forEach((word, i) => {
    const delay = (beforeWords.length + 1 + i) * WORD_STEP
    nodes.push(
      <motion.span
        key={`a-${i}`}
        initial={{ opacity: 0, filter: 'blur(4px)', y: 10 }}
        animate={{ opacity: 1, filter: 'blur(0px)', y: 0 }}
        transition={{ duration: WORD_DURATION, delay, ease: 'easeInOut' }}
        className="ml-2 inline-block"
      >
        {word}
      </motion.span>,
    )
    lastIndexDelay = delay
  })

  // If there were no after words, the aurora is last
  if (afterWords.length === 0) lastIndexDelay = auroraDelay

  return { nodes, finishAt: lastIndexDelay + WORD_DURATION }
}
