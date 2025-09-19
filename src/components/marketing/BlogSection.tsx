import React from 'react'
import { useTranslation } from 'react-i18next'
import { Blog7 } from '@/components/marketing/Blog7'
import { assetUrl } from '@/lib/directus'
import useLandingBlockCopy from '@/features/pages/hooks/useLandingBlockCopy'
import useBlogPosts from '@/features/blog/hooks/useBlogPosts'

export default function BlogSection() {
  const { i18n } = useTranslation()
  const locale = i18n.language?.split('-')[0] || 'en'
  const copy = useLandingBlockCopy('blog')
  const { data: posts } = useBlogPosts()

  if (!posts.length) return null

  const mapped = posts.map((p) => ({
    id: p.id,
    title: p.title,
    summary: p.summary,
    label: p.label || '',
    author: p.author || '',
    published: p.published || '',
    url: p.url,
    image: p.imageId ? assetUrl(p.imageId, { width: 800, height: 450, fit: 'cover', format: 'webp', quality: 80 }) : '',
  }))

  return (
    <Blog7
      tagline={copy?.heading || 'Latest Updates'}
      heading={copy?.subheading || 'From the blog'}
      description={''}
      buttonText={'View all articles'}
      buttonUrl={`/${locale}/blog`}
      readMoreText={'Read more'}
      posts={mapped}
    />
  )
}
