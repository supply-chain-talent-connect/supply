/* eslint-disable i18next/no-literal-string */
"use client";

import React from 'react'
import { motion } from 'motion/react'
import { ArrowRight, Briefcase, User2 } from 'lucide-react'
import { cn } from '@/lib/utils'
import { Button } from '@/components/ui/button'

type FeatureTilesProps = {
  delay?: number
  className?: string
}

export default function FeatureTiles({ delay = 0, className }: FeatureTilesProps) {
  return (
    <motion.div
      initial={{ opacity: 0, y: 8 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: 0.35, delay }}
      className={cn('grid w-full max-w-5xl grid-cols-1 gap-4 md:grid-cols-3', className)}
    >
      {/* Dominant company card */}
      <div className="relative col-span-1 overflow-hidden rounded-3xl border border-neutral-200 dark:border-neutral-800 shadow-sm md:col-span-2">
        <div className="absolute inset-0 bg-[radial-gradient(1200px_400px_at_0%_-20%,rgba(99,102,241,0.25),transparent),linear-gradient(120deg,rgba(2,6,23,0.6),rgba(15,23,42,0.6))] dark:bg-[radial-gradient(1200px_400px_at_0%_-20%,rgba(56,189,248,0.22),transparent),linear-gradient(120deg,rgba(10,10,12,0.6),rgba(2,6,23,0.6))]" />
        <div className="relative grid gap-5 p-6 md:grid-cols-[auto,1fr] md:p-8">
          <div className="grid size-12 place-items-center rounded-2xl bg-[linear-gradient(120deg,rgba(56,189,248,0.2),rgba(99,102,241,0.2))]">
            <Briefcase className="size-6 text-foreground/90" />
          </div>
          <div>
            <h3 className="text-xl font-semibold tracking-tight text-foreground md:text-2xl">Hire elite operators. On‑demand.</h3>
            <p className="mt-2 max-w-[52ch] text-sm leading-relaxed text-foreground/80">
              Pre‑vetted supply chain leaders across Planning, S&OP, Fulfillment, and Logistics — delivered with speed and precision.
            </p>
            <div className="mt-5 flex flex-wrap items-center gap-3">
              <Button className="min-w-[12ch] whitespace-nowrap px-6 py-3 text-base" asChild>
                <a href="#companies" className="inline-flex items-center">
                  Request Talent
                  <ArrowRight className="ml-2 size-4" />
                </a>
              </Button>
              <a
                href="#contact"
                className="inline-flex items-center text-sm text-foreground/80 underline-offset-4 hover:underline"
              >
                Talk to us
                <ArrowRight className="ml-1 size-4" />
              </a>
            </div>
            <div className="mt-6 flex flex-wrap gap-2">
              <span className="rounded-full border border-neutral-200 bg-white/60 px-3 py-1 text-xs text-neutral-700 dark:border-neutral-800 dark:bg-white/5 dark:text-neutral-300">
                48h shortlist
              </span>
              <span className="rounded-full border border-neutral-200 bg-white/60 px-3 py-1 text-xs text-neutral-700 dark:border-neutral-800 dark:bg-white/5 dark:text-neutral-300">
                Vetted network
              </span>
              <span className="rounded-full border border-neutral-200 bg-white/60 px-3 py-1 text-xs text-neutral-700 dark:border-neutral-800 dark:bg-white/5 dark:text-neutral-300">
                Hands‑on operators
              </span>
            </div>
          </div>
        </div>
      </div>

      {/* Subtle candidate link card */}
      <a
        href="#candidates"
        className={cn(
          'group relative overflow-hidden rounded-3xl border border-neutral-200 bg-background p-6 shadow-sm transition-colors hover:bg-accent/30 dark:border-neutral-800',
        )}
      >
        <div className="flex items-start gap-3">
          <div className="grid size-10 place-items-center rounded-xl bg-[linear-gradient(120deg,rgba(56,189,248,0.15),rgba(99,102,241,0.15))]">
            <User2 className="size-5 text-foreground/90" />
          </div>
          <div className="flex-1">
            <div className="text-base font-semibold tracking-tight text-foreground">For Candidates</div>
            <div className="mt-1 text-sm leading-relaxed text-muted-foreground">Find your next high‑impact role.</div>
          </div>
          <ArrowRight className="mt-1 size-4 text-muted-foreground transition-transform group-hover:translate-x-0.5" />
        </div>
      </a>
    </motion.div>
  )
}
 
