import React, { useMemo } from 'react'
import TestimonialCard from './TestimonialCard'
import type { TestimonialData } from '@/features/testimonials/api/queries'
import { cn } from '@/lib/utils'
import './TestimonialMarquee.css'

type Props = {
  testimonials: TestimonialData[]
  className?: string
}

export default function TestimonialMarquee({ testimonials, className }: Props) {
  const { topRow, bottomRow } = useMemo(() => {
    const top = testimonials.filter((_, i) => i % 2 === 0)
    const bottom = testimonials.filter((_, i) => i % 2 === 1)
    
    // Duplicate for seamless loop
    return {
      topRow: [...top, ...top],
      bottomRow: [...bottom, ...bottom]
    }
  }, [testimonials])

  if (!testimonials.length) return null

  return (
    <div className={cn('relative w-full', className)}>
      {/* Marquee Container - full width */}
      <div 
        className="testimonial-marquee-container full-bleed"
        role="region"
        aria-label="Customer testimonials"
        aria-live="off"
      >
        {/* Top Row - Scrolls Left */}
        <div className="testimonial-marquee-track" data-direction="left">
          {topRow.map((testimonial, idx) => (
            <div key={`top-${testimonial.id}-${idx}`} className="testimonial-marquee-item">
              <TestimonialCard testimonial={testimonial} />
            </div>
          ))}
        </div>

        {/* Bottom Row - Scrolls Right */}
        <div className="testimonial-marquee-track mt-4" data-direction="right">
          {bottomRow.map((testimonial, idx) => (
            <div key={`bottom-${testimonial.id}-${idx}`} className="testimonial-marquee-item">
              <TestimonialCard testimonial={testimonial} />
            </div>
          ))}
        </div>
      </div>

    </div>
  )
}