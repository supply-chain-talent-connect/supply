"use client";
import React, { useCallback, useRef, useState } from 'react'
import { cn } from '@/lib/utils'

type Direction = 'top' | 'right' | 'bottom' | 'left'

function getDirection(e: React.MouseEvent, el: HTMLElement): Direction {
  const { width, height, left, top } = el.getBoundingClientRect()
  const l = e.clientX - left - width / 2
  const t = e.clientY - top - height / 2
  const angle = Math.atan2(t, l) // -PI to PI
  const d = Math.round(((angle / (Math.PI / 2)) + 5) % 4)
  return (['right', 'bottom', 'left', 'top'] as Direction[])[d]
}

const offscreen: Record<Direction, string> = {
  top: 'translateY(-100%)',
  right: 'translateX(100%)',
  bottom: 'translateY(100%)',
  left: 'translateX(-100%)',
}

export function DirectionAwareHover({
  imageUrl,
  className,
  children,
  rounded = 'rounded-xl',
}: {
  imageUrl: string | undefined
  className?: string
  children?: React.ReactNode
  rounded?: string
}) {
  const ref = useRef<HTMLDivElement>(null)
  const [hovered, setHovered] = useState(false)
  const [dir, setDir] = useState<Direction>('bottom')

  const onEnter = useCallback(
    (e: React.MouseEvent) => {
      if (!ref.current) return
      setDir(getDirection(e, ref.current))
      setHovered(true)
    },
    [ref],
  )
  const onLeave = useCallback(
    (e: React.MouseEvent) => {
      if (!ref.current) return
      setDir(getDirection(e, ref.current))
      setHovered(false)
    },
    [ref],
  )

  return (
    <div
      ref={ref}
      onMouseEnter={onEnter}
      onMouseLeave={onLeave}
      className={cn('relative h-full w-full overflow-hidden bg-muted', rounded, className)}
    >
      {imageUrl ? (
        <img alt="" src={imageUrl} className={cn('h-full w-full object-cover', rounded)} />
      ) : (
        <div className={cn('h-full w-full', rounded)} />
      )}
      <div
        style={{ transform: hovered ? 'translate(0,0)' : offscreen[dir] }}
        className={cn(
          'pointer-events-none absolute inset-0 flex flex-col items-center justify-center gap-1 bg-black/60 p-4 text-center text-white transition-transform duration-300',
          rounded,
        )}
      >
        {children}
      </div>
    </div>
  )
}

export default DirectionAwareHover
