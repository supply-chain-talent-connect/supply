"use client";

import React, { useEffect, useMemo } from 'react'
import { motion } from 'motion/react'
import { AuroraText } from '@/components/magicui/aurora-text'

type Props = {
  heading: string
  highlighted?: string | null
  className?: string
  onFinishAt?: (seconds: number) => void
}

// Animation cadence constants (seconds)
const WORD_STEP = 0.1
const WORD_DURATION = 0.3

export default function HeroAnimatedHeading({ heading, highlighted, className, onFinishAt }: Props) {
  const { nodes, finishAt } = useMemo(() => buildHeadingNodes(heading ?? '', highlighted ?? ''), [heading, highlighted])

  useEffect(() => {
    if (typeof onFinishAt === 'function') onFinishAt(finishAt)
  }, [finishAt, onFinishAt])

  return (
    <h1
      className={[
        'relative z-10 max-w-4xl text-left text-2xl font-bold leading-tight tracking-tight text-slate-700 md:text-4xl lg:text-7xl dark:text-slate-300',
        className,
      ]
        .filter(Boolean)
        .join(' ')}
      style={{ textWrap: 'balance' } as React.CSSProperties}
    >
      {nodes}
    </h1>
  )
}

type HeadingBuild = { nodes: React.ReactNode[]; finishAt: number }

function buildHeadingNodes(heading: string, highlighted: string): HeadingBuild {
  const nodes: React.ReactNode[] = []
  let lastIndexDelay = 0

  const words = heading.trim().length ? heading.trim().split(' ') : []

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

  const idx = heading.indexOf(highlighted)

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

  const before = heading.slice(0, idx).trim()
  const after = heading.slice(idx + highlighted.length).trim()
  const beforeWords = before ? before.split(' ') : []
  const afterWords = after ? after.split(' ') : []

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

  if (afterWords.length === 0) lastIndexDelay = auroraDelay

  return { nodes, finishAt: lastIndexDelay + WORD_DURATION }
}

