import React from 'react'
import useLandingBlockCopy from '@/features/pages/hooks/useLandingBlockCopy'

export default function Community() {
  const copy = useLandingBlockCopy('community')
  return (
    <section id="community" className="w-full py-12">
      <div className="mx-auto max-w-[1600px] px-4">
        {(copy?.heading || copy?.subheading) && (
          <div className="mx-auto mb-4 max-w-3xl text-center">
            {copy?.heading ? (
              <h3 className="text-lg font-semibold tracking-tight text-neutral-900 dark:text-neutral-100">{copy.heading}</h3>
            ) : null}
            {copy?.subheading ? (
              <p className="mt-1 text-sm text-neutral-600 dark:text-neutral-400">{copy.subheading}</p>
            ) : null}
          </div>
        )}
        <div className="h-32 rounded-lg border border-dashed border-neutral-300 dark:border-neutral-800" />
      </div>
    </section>
  )
}
