import { useEffect, useState } from 'react'
import { useTranslation } from 'react-i18next'
import { fetchTrustLogos, type TrustLogosData } from '@/features/trust-logos/api/queries'

export function useTrustLogos(sectionId = 1) {
  const { i18n } = useTranslation()
  const locale = i18n.language?.split('-')[0] || 'en'
  const [data, setData] = useState<TrustLogosData | undefined>()

  useEffect(() => {
    let active = true
    fetchTrustLogos(locale, sectionId).then((res) => {
      if (active) setData(res)
    })
    return () => {
      active = false
    }
  }, [locale, sectionId])

  return data
}

export default useTrustLogos

