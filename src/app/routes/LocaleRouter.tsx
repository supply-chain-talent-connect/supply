import React, { useEffect } from 'react'
import { Outlet, useNavigate, useParams } from 'react-router-dom'
import { useTranslation } from 'react-i18next'

const SUPPORTED = new Set(['en', 'fr', 'de', 'es'])

export default function LocaleRouter() {
  const { i18n } = useTranslation()
  const params = useParams()
  const navigate = useNavigate()
  const locale = (params.locale || '').split('-')[0]

  useEffect(() => {
    const target = SUPPORTED.has(locale) ? locale : 'en'
    if (i18n.language !== target) i18n.changeLanguage(target)
    if (!SUPPORTED.has(locale)) navigate(`/${target}`, { replace: true })
  }, [locale, i18n, navigate])

  return <Outlet />
}

