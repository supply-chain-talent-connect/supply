import { useEffect, useState } from 'react'
import { useTranslation } from 'react-i18next'
import { fetchHero, type HeroTranslation } from '@/features/hero/api/queries'

export function useHero(heroId = 1) {
  const { i18n } = useTranslation()
  const locale = i18n.language?.split('-')[0] || 'en'
  const [data, setData] = useState<HeroTranslation | undefined>()

  useEffect(() => {
    let active = true
    fetchHero(locale, heroId).then((res) => {
      if (active) setData(res)
    })
    return () => {
      active = false
    }
  }, [locale, heroId])

  return data
}

export default useHero

