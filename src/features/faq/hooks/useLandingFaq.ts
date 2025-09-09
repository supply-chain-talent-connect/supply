import { useEffect, useState } from 'react'
import { useTranslation } from 'react-i18next'
import { fetchLandingFaq, type FaqItemUI } from '@/features/faq/api/queries'

export function useLandingFaq() {
  const { i18n } = useTranslation()
  const locale = i18n.language?.split('-')[0] || 'en'
  const [items, setItems] = useState<FaqItemUI[] | undefined>()

  useEffect(() => {
    let active = true
    fetchLandingFaq(locale).then((res) => {
      if (active) setItems(res)
    })
    return () => {
      active = false
    }
  }, [locale])

  return items
}

export default useLandingFaq

