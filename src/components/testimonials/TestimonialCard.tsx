import React from 'react'
import { Star } from 'lucide-react'
import { Card, CardContent, CardFooter, CardHeader } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { assetUrl } from '@/lib/directus'
import { cn } from '@/lib/utils'
import type { TestimonialData } from '@/features/testimonials/api/queries'

type Props = {
  testimonial: TestimonialData
  className?: string
}

export default function TestimonialCard({ testimonial, className }: Props) {
  return (
    <Card 
      className={cn(
        'relative h-full flex flex-col transition-all duration-300 hover:shadow-lg hover:-translate-y-1 group',
        className
      )}
    >
      <CardHeader className="p-4 pb-3">
        <div className="flex items-start gap-3">
          {testimonial.avatarId && (
            <img 
              src={assetUrl(testimonial.avatarId, { width: 80, height: 80, format: 'webp', quality: 85 })}
              alt={testimonial.name}
              className="h-10 w-10 rounded-full object-cover border border-slate-200 grayscale group-hover:grayscale-0 transition-all duration-300 group-hover:border-emerald-300"
            />
          )}
          <div className="flex-1">
            <h3 className="font-extrabold tracking-tight text-sm text-slate-900 dark:text-slate-100">{testimonial.name}</h3>
            <p className="text-xs text-slate-600 dark:text-slate-400">
              {testimonial.jobTitle} {testimonial.jobTitle && testimonial.company && ' • '} <span className="font-semibold">{testimonial.company}</span>
            </p>
          </div>
        </div>
      </CardHeader>
      
      <CardContent className="flex-1 p-4 pt-0">
        <blockquote 
          className="text-sm text-slate-700 dark:text-slate-300 leading-snug [&_strong]:font-extrabold [&_strong]:tracking-tight"
          dangerouslySetInnerHTML={{ __html: testimonial.testimonial }}
        />
      </CardContent>
      
      <CardFooter className="flex items-center justify-between p-4 pt-3 border-t border-slate-100 dark:border-slate-800 mt-auto">
        <div className="flex gap-0.5">
          {Array.from({ length: 5 }).map((_, i) => (
            <Star
              key={i}
              className={cn(
                'h-3.5 w-3.5 transition-colors',
                i < testimonial.rating 
                  ? 'fill-amber-400 text-amber-400' 
                  : 'fill-slate-200 text-slate-200 dark:fill-slate-700 dark:text-slate-700'
              )}
            />
          ))}
        </div>
        {testimonial.resultsPill && (
          <Badge 
            variant="secondary" 
            className="text-[10px] font-extrabold tracking-tight bg-emerald-50 text-emerald-700 border-emerald-200 dark:bg-emerald-950 dark:text-emerald-300 dark:border-emerald-800 px-2 py-0.5"
          >
            {testimonial.resultsPill}
          </Badge>
        )}
      </CardFooter>
    </Card>
  )
}