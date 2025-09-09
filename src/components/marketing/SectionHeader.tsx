import React from 'react'

type Props = {
  heading?: string
  subheading?: string
  size?: 'xl' | 'lg' | 'md'
  className?: string
}

export default function SectionHeader({ heading, subheading, size = 'lg', className }: Props) {
  if (!heading && !subheading) return null

  const headingCls =
    size === 'xl'
      ? 'text-3xl md:text-5xl font-bold tracking-tight'
      : size === 'lg'
        ? 'text-2xl md:text-3xl font-semibold tracking-tight'
        : 'text-lg font-semibold tracking-tight'

  return (
    <div className={['mx-auto mb-4 max-w-3xl px-4 text-center', className].filter(Boolean).join(' ')}>
      {heading ? <h3 className={headingCls}>{heading}</h3> : null}
      {subheading ? (
        <p className="mt-3 max-w-2xl mx-auto text-slate-600" style={{ textWrap: 'balance' } as React.CSSProperties}>
          {subheading}
        </p>
      ) : null}
    </div>
  )
}
