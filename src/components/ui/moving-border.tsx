"use client";

import * as React from 'react'
import { motion, type MotionProps } from 'motion/react'
import { cn } from '@/lib/utils'

type AnyEl = keyof JSX.IntrinsicElements | React.JSXElementConstructor<any>

export interface ButtonProps<E extends AnyEl = 'button'>
  extends Omit<React.ComponentPropsWithoutRef<E>, 'as' | 'className' | 'children'>,
    Omit<MotionProps, 'transition' | 'animate' | 'initial'> {
  as?: E
  children: React.ReactNode
  className?: string
  containerClassName?: string
  borderClassName?: string
  borderRadius?: string
  duration?: number // ms
  href?: string
  target?: string
  rel?: string
}

export function Button<E extends AnyEl = 'button'>(props: ButtonProps<E>) {
  const {
    as,
    children,
    className,
    containerClassName,
    borderClassName,
    borderRadius = '1.75rem',
    duration = 6000,
    ...rest
  } = props as ButtonProps

  const Comp: AnyEl = as || 'button'

  // Single-direction sweep across a thin 1px border using a moving linear gradient.
  const borderGradient = 'linear-gradient(90deg, rgba(255,0,128,0), rgba(255,0,128,0.95), rgba(255,0,128,0))'

  return (
    <div className={cn('relative inline-flex', containerClassName)} style={{ borderRadius } as React.CSSProperties}>
      <motion.div
        aria-hidden
        className={cn('pointer-events-none absolute inset-0 z-10 rounded-[inherit] p-px', borderClassName)}
        style={{
          backgroundImage: borderGradient,
          backgroundSize: '200% 100%',
          WebkitMask: 'linear-gradient(#000,#000) content-box, linear-gradient(#000,#000)',
          WebkitMaskComposite: 'xor',
          mask: 'linear-gradient(#000,#000) content-box, linear-gradient(#000,#000)',
          maskComposite: 'exclude',
          borderRadius,
        } as React.CSSProperties}
        initial={{ backgroundPosition: '0% 50%' }}
        animate={{ backgroundPosition: '200% 50%' }}
        transition={{ duration: duration / 1000, repeat: Infinity, ease: 'linear' }}
      />
      {React.createElement(
        Comp as any,
        {
          className: cn(
            'relative isolate inline-flex items-center justify-center rounded-[inherit] px-6 py-3 text-base font-semibold',
            // Vibrant blue fill with toned-down glow
            'bg-gradient-to-r from-[#3BA3F6] to-[#0B7CDF] text-white',
            'shadow-[0_6px_18px_rgba(59,163,246,0.22)] ring-1 ring-black/5 transition duration-200 ease-in-out',
            'hover:shadow-[0_8px_22px_rgba(255,0,128,0.25)]',
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
