import { useEffect, useState } from 'react'
import { fetchHeaderNavigation } from '@/features/navigation/api/queries'

export type MenuItem = { title: string; url: string; description?: string; items?: MenuItem[] }

export function useNavigationMenu(locale: string) {
  const [menu, setMenu] = useState<MenuItem[]>([])
  useEffect(() => {
    let active = true
    fetchHeaderNavigation().then((items) => {
      const byParent: Record<string | number, any[]> = {}
      items.forEach((i) => {
        if (i.parent?.id) (byParent[i.parent.id] ||= []).push(i)
      })
      const toLabel = (i: any) => i.translations?.find((t: any) => t.languages_code === locale)?.label || i.label || ''
      const toUrl = (i: any) => i.href || '#'
      const top = items.filter((i) => !i.isButton && !i.parent)
      const mapped: MenuItem[] = top.map((i) => ({
        title: toLabel(i),
        url: toUrl(i),
        items: (byParent[i.id] || []).map((c) => ({ title: toLabel(c), url: toUrl(c) })),
      }))
      if (active) setMenu(mapped)
    })
    return () => {
      active = false
    }
  }, [locale])
  return menu
}

