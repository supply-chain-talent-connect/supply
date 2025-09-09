import React from 'react'

type Props = {
  className?: string
}

export default function AnimatedGradientBackground({ className }: Props) {
  return (
    <div
      aria-hidden
      className={[
        'bg-landing-animated fixed inset-0 -z-10 pointer-events-none select-none',
        className,
      ]
        .filter(Boolean)
        .join(' ')}
    />
  )
}

