import { useEffect, useMemo, useState } from 'react'
import { useTranslation } from 'react-i18next'
import { fetchHeaderNavigation, type NavItem } from '@/features/navigation/api/queries'
import { Book, FileEdit, Search, FileText } from 'lucide-react'

export type MenuItem = {
  title: string
  url: string
  description?: string
  icon?: JSX.Element
  items?: MenuItem[]
}

function mapIcon(name?: string | null): JSX.Element | undefined {
  if (!name) return undefined
  switch (name) {
    case 'manage_search':
    case 'search':
      return <Search className="size-5 shrink-0" />
    case 'edit_document':
    case 'file_edit':
      return <FileEdit className="size-5 shrink-0" />
    case 'file_text':
      return <FileText className="size-5 shrink-0" />
    case 'book':
      return <Book className="size-5 shrink-0" />
    default:
      return undefined
  }
}

export function useHeaderNavigation() {
  const { i18n } = useTranslation()
  const locale = i18n.language?.split('-')[0] || 'en'
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

  const menu = useMemo<MenuItem[]>(() => {
    const byParent: Record<string | number, NavItem[]> = {}
    items.forEach((i) => {
      const pid = typeof i.parent === 'object' ? (i.parent?.id as string | number) : i.parent
      if (pid) {
        if (!byParent[pid]) byParent[pid] = []
        byParent[pid].push(i)
      }
    })

    const pickT = (i: NavItem) =>
      i.translations?.find((t) => t.languages_code === locale) || i.translations?.[0] || { languages_code: locale, label: '' }

    const toUrl = (i: NavItem) => i.href || '#'

    const top = items.filter((i) => !i.isButton && !i.parent)

    return top
      .sort((a, b) => (a.sort ?? 0) - (b.sort ?? 0))
      .map((i) => {
        const t = pickT(i)
        const children = (byParent[i.id] || [])
          .sort((a, b) => (a.sort ?? 0) - (b.sort ?? 0))
          .map((c) => {
            const ct = pickT(c)
            return {
              title: ct.label || c.label || '',
              url: toUrl(c),
              description: ct.description || undefined,
              icon: mapIcon(c.icon || undefined),
            }
          })
        return {
          title: t.label || i.label || '',
          url: toUrl(i),
          items: children.length ? children : undefined,
        }
      })
  }, [items, locale])

  return menu
}

export default useHeaderNavigation
