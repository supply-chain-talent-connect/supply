import { useEffect, useMemo, useState } from 'react'
import { useTranslation } from 'react-i18next'
import { fetchHeaderNavigation, type NavItem } from '../api/queries'

export function useNavigation() {
  const { i18n } = useTranslation()
  const [items, setItems] = useState<NavItem[]>([])

  useEffect(() => {
    let active = true
    fetchHeaderNavigation().then((res) => {
      if (active) setItems(res)
    })
    return () => {
      active = false
    }
  }, [])

  const locale = i18n.language?.split('-')[0] || 'en'

  const { topLinks, cta, childrenByParent } = useMemo(() => {
    const links = items.filter((n) => !n.isButton && (!n.parent || !n.parent.id))
    const grouped: Record<string | number, NavItem[]> = {}
    items.forEach((n) => {
      if (n.parent?.id) {
        const pid = n.parent.id
        if (!grouped[pid]) grouped[pid] = []
        grouped[pid].push(n)
      }
    })
    const button = items.find((n) => n.isButton)
    return { topLinks: links, cta: button, childrenByParent: grouped }
  }, [items])

  function labelFor(item: NavItem) {
    const match = item.translations?.find((t) => t.languages_code === locale) || item.translations?.[0]
    return match?.label || item.label || ''
  }
  function hrefFor(item: NavItem) {
    const raw = item.href || '#'
    // Absolute URLs and hash anchors are returned as-is
    if (/^https?:\/\//i.test(raw) || raw.startsWith('#')) return raw
    // Prefix locale for site.ai/en/... style paths
    const path = raw.startsWith('/') ? raw : `/${raw}`
    return `/${locale}${path}`
  }

  return { topLinks, cta, childrenByParent, labelFor, hrefFor }
}

export default useNavigation
