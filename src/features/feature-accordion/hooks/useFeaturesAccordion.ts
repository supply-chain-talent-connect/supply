import { useEffect, useState } from 'react'
import { useTranslation } from 'react-i18next'
import { fetchLandingFeatures, type FeatureUI } from '@/features/feature-accordion/api/queries'

export default function useFeaturesAccordion() {
  const { i18n } = useTranslation()
  const locale = i18n.language?.split('-')[0] || 'en'
  const [data, setData] = useState<FeatureUI[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<unknown>()

  useEffect(() => {
    let cancelled = false
    setLoading(true)
    fetchLandingFeatures(locale)
      .then((res) => {
        if (!cancelled) setData(res)
      })
      .catch((e) => {
        if (!cancelled) setError(e)
      })
      .finally(() => {
        if (!cancelled) setLoading(false)
      })
    return () => {
      cancelled = true
    }
  }, [locale])

  return { data, loading, error }
}

