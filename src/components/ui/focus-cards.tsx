import React, { useState } from 'react'
import { cn } from '@/lib/utils'

export type FocusCard = {
  title: string
  src: string
  subtitle?: string
}

export function FocusCards({
  cards,
  className,
  blurClass = 'blur-[1px]',
}: {
  cards: FocusCard[]
  className?: string
  blurClass?: string
}) {
  const [active, setActive] = useState<number | null>(null)

  return (
    <div className={cn('grid gap-6 sm:grid-cols-2 lg:grid-cols-3', className)}>
      {cards.map((card, i) => {
        const isActive = active === i
        const hasActive = active !== null
        return (
          <div
            key={`${card.title}-${i}`}
            className={cn(
              'relative h-[22rem] overflow-hidden rounded-2xl bg-muted transition-all duration-300',
              isActive && 'scale-[1.02] shadow-lg',
              hasActive && !isActive && 'opacity-80',
            )}
            onMouseEnter={() => setActive(i)}
            onMouseLeave={() => setActive(null)}
          >
            {/* Image */}
            <img
              src={card.src}
              alt={card.title}
              className={cn(
                'h-full w-full object-cover transition-all duration-300',
                hasActive && !isActive && blurClass,
              )}
              loading="lazy"
            />
            {/* Overlay */}
            <div className="pointer-events-none absolute inset-x-0 bottom-0 flex flex-col gap-1 bg-gradient-to-t from-black/60 to-transparent p-4 text-white">
              <p className="text-2xl font-bold leading-tight">{card.title}</p>
              {card.subtitle ? (
                <p className="text-sm/5 opacity-90">{card.subtitle}</p>
              ) : null}
            </div>
          </div>
        )
      })}
    </div>
  )
}

export default FocusCards
