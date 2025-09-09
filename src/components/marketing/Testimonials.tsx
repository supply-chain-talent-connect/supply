import React from 'react'
import useLandingBlockCopy from '@/features/pages/hooks/useLandingBlockCopy'
import SectionHeader from '@/components/marketing/SectionHeader'

export default function Testimonials() {
  const copy = useLandingBlockCopy('testimonials')
  return (
    <section id="testimonials" className="w-full py-12 scroll-mt-24">
      <div className="mx-auto max-w-[1600px] px-4">
        <SectionHeader heading={copy?.heading} subheading={copy?.subheading} size="xl" />
        <div className="h-32 rounded-lg border border-dashed border-neutral-300 dark:border-neutral-800" />
      </div>
    </section>
  )
}
