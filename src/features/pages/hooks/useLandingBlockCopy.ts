import { useEffect, useState } from 'react'
import { useTranslation } from 'react-i18next'
import { fetchLandingBlockCopy } from '@/features/pages/api/queries'

export function useLandingBlockCopy(pageKey: string) {
  const { i18n } = useTranslation()
  const locale = i18n.language?.split('-')[0] || 'en'
  const [copy, setCopy] = useState<{ heading?: string; subheading?: string } | undefined>()

  useEffect(() => {
    let active = true
    fetchLandingBlockCopy(pageKey, locale).then((res) => {
      if (active) setCopy(res)
    })
    return () => {
      active = false
    }
  }, [pageKey, locale])

  return copy
}

export default useLandingBlockCopy

