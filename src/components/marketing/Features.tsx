import React from 'react'
import useLandingBlockCopy from '@/features/pages/hooks/useLandingBlockCopy'
import SectionHeader from '@/components/marketing/SectionHeader'
import FeatureTabs from '@/components/marketing/FeatureTabs'
import useFeaturesAccordion from '@/features/feature-accordion/hooks/useFeaturesAccordion'

export default function Features() {
  const copy = useLandingBlockCopy('features')
  const { data: features, loading, error } = useFeaturesAccordion()
  return (
    <section id="features" className="w-full py-12 scroll-mt-24">
      <div className="mx-auto max-w-[1600px] px-4">
        <SectionHeader heading={copy?.heading} subheading={copy?.subheading} size="xl" />
        {loading ? (
          <div className="mt-6 h-32 rounded-lg border border-dashed border-neutral-300 dark:border-neutral-800 animate-pulse" />
        ) : error ? (
          <div className="mt-6 text-sm text-red-600">Failed to load features.</div>
        ) : features.length ? (
          <FeatureTabs features={features} className="mt-6" />
        ) : (
          <div className="mt-6 text-sm text-slate-500">No features available.</div>
        )}
      </div>
    </section>
  )
}
