import { useEffect, useState } from 'react'
import { useTranslation } from 'react-i18next'
import { fetchBlogPosts, type BlogPostUI } from '@/features/blog/api/queries'

export default function useBlogPosts() {
  const { i18n } = useTranslation()
  const locale = i18n.language?.split('-')[0] || 'en'
  const [data, setData] = useState<BlogPostUI[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<unknown>()

  useEffect(() => {
    let cancelled = false
    setLoading(true)
    fetchBlogPosts(locale)
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

