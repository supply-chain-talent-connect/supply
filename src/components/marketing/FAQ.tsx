import React from 'react'
import { Accordion, AccordionContent, AccordionItem, AccordionTrigger } from '@/components/ui/accordion'
import { useLandingFaq } from '@/features/faq/hooks/useLandingFaq'
import useLandingBlockCopy from '@/features/pages/hooks/useLandingBlockCopy'
import SectionHeader from '@/components/marketing/SectionHeader'

export default function FAQ() {
  const items = useLandingFaq()
  const copy = useLandingBlockCopy('faq')

  return (
    <section id="faq" className="w-full py-12 scroll-mt-24">
      <div className="mx-auto max-w-6xl px-4">
        <SectionHeader heading={copy?.heading} subheading={copy?.subheading} size="xl" />
        {items === undefined ? (
          <div className="h-32 rounded-lg border border-dashed border-neutral-300 dark:border-neutral-800" />
        ) : items.length === 0 ? null : (
          <div className="rounded-2xl border border-slate-200 bg-white p-4 md:p-6">
            <Accordion type="single" collapsible className="w-full">
              {items.map((it, idx) => (
                <AccordionItem key={`${it.q}-${idx}`} value={`item-${idx}`}>
                  <AccordionTrigger className="text-base font-semibold">{it.q}</AccordionTrigger>
                  <AccordionContent className="text-slate-600">{it.a}</AccordionContent>
                </AccordionItem>
              ))}
            </Accordion>
          </div>
        )}
      </div>
    </section>
  )
}
