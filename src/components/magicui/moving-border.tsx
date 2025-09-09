"use client";

import React from 'react'
import { motion, type MotionProps } from 'motion/react'
import { cn } from '@/lib/utils'

type AnyEl = keyof JSX.IntrinsicElements | React.JSXElementConstructor<unknown>

export interface MovingBorderProps<E extends AnyEl = 'button'>
  extends Omit<React.ComponentPropsWithoutRef<E>, 'as' | 'children' | 'className'>,
    Omit<MotionProps, 'transition' | 'animate' | 'initial'> {
  as?: E
  children: React.ReactNode
  className?: string
  containerClassName?: string
  borderClassName?: string
  borderRadius?: string
  duration?: number // ms
}

export function MovingBorder<E extends AnyEl = 'button'>(props: MovingBorderProps<E>) {
  const {
    as,
    children,
    className,
    containerClassName,
    borderClassName,
    borderRadius = '1.75rem',
    duration = 5000,
    ...rest
  } = props as MovingBorderProps

  const Comp: AnyEl = as || 'button'

  // Single fuchsia arc that will orbit around the perimeter
  const arc = 8 // degrees of visible arc

  return (
    <div className={cn('relative inline-flex rounded-[inherit]', containerClassName)} style={{ borderRadius } as React.CSSProperties}>
      {/* Orbiting highlight ring (masked to 1px border) */}
      <motion.span
        className={cn('pointer-events-none absolute inset-0 z-10 rounded-[inherit] p-px will-change-transform', borderClassName)}
        style={{
          background: `conic-gradient(from 0deg, rgba(255,0,128,0) 0deg, rgba(255,0,128,0) ${360 - arc}deg, rgba(255,0,128,1) ${360 - arc}deg, rgba(255,0,128,1) 360deg)`,
          WebkitMask: 'linear-gradient(#000,#000) content-box exclude, linear-gradient(#000,#000)',
          mask: 'linear-gradient(#000,#000) content-box exclude, linear-gradient(#000,#000)',
          borderRadius,
        } as React.CSSProperties}
        initial={{ rotate: 0 }}
        animate={{ rotate: 360 }}
        transition={{ duration: duration / 1000, repeat: Infinity, ease: 'linear' }}
      />
      {React.createElement(
        Comp as unknown as React.ElementType,
        {
          className: cn(
            'relative isolate inline-flex items-center justify-center text-center rounded-[inherit] px-6 py-3 text-base font-semibold text-white',
            'bg-gradient-to-r from-[#3BA3F6] to-[#0B7CDF]',
            'shadow-[0_8px_24px_rgba(59,163,246,0.28)] ring-1 ring-black/5 transition duration-200 ease-in-out',
            'hover:shadow-[0_10px_36px_rgba(255,0,128,0.45)]',
            className,
          ),
          style: { borderRadius } as React.CSSProperties,
          ...rest,
        },
        children,
      )}
    </div>
  )
}
