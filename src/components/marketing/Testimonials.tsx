import React from 'react'
import useLandingBlockCopy from '@/features/pages/hooks/useLandingBlockCopy'
import useTestimonials from '@/features/testimonials/hooks/useTestimonials'
import SectionHeader from '@/components/marketing/SectionHeader'
import TestimonialMarquee from '@/components/testimonials/TestimonialMarquee'

export default function Testimonials() {
  const copy = useLandingBlockCopy('testimonials')
  const { data: testimonials, loading } = useTestimonials()
  
  return (
    <section id="testimonials" className="w-full py-12 scroll-mt-24">
      <div className="mx-auto max-w-[1600px] px-4">
        <SectionHeader heading={copy?.heading} subheading={copy?.subheading} size="xl" />
        
        {loading ? (
          <div className="flex items-center justify-center h-32">
            <div className="text-slate-500">Loading testimonials...</div>
          </div>
        ) : testimonials.length > 0 ? (
          <TestimonialMarquee testimonials={testimonials} className="mt-8" />
        ) : (
          <div className="h-32 rounded-lg border border-dashed border-neutral-300 dark:border-neutral-800 flex items-center justify-center">
            <p className="text-slate-500">{/* No testimonials placeholder */}</p>
          </div>
        )}
      </div>
    </section>
  )
}
