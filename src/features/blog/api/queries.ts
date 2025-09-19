import { readItems } from '@directus/sdk'
import { directus } from '@/lib/directus'

export type BlogPostRecord = {
  id: number
  status?: string | null
  label?: string | null
  slug?: string | null
  cover_image?: string | { id: string } | null
  publish_at?: string | null
}

export type BlogPostTranslationRecord = {
  id: number
  blog_posts_id: number
  languages_code: string
  title?: string | null
  summary?: string | null
  author?: string | null
}

export type BlogPostUI = {
  id: string
  title: string
  summary: string
  label?: string
  author?: string
  published?: string
  url: string
  imageId?: string
}

function pickTranslation<T extends { languages_code: string }>(rows: T[] | undefined, locale: string) {
  if (!rows || !rows.length) return undefined
  const local = rows.find((r) => r.languages_code === locale)
  if (local) return local
  const en = rows.find((r) => r.languages_code === 'en')
  return en ?? rows[0]
}

export async function fetchBlogPosts(locale: string): Promise<BlogPostUI[]> {
  let posts: BlogPostRecord[] = []
  try {
    posts = (await directus.request(
      readItems<BlogPostRecord>('blog_posts', {
        filter: { status: { _eq: 'published' } },
        fields: ['id', 'status', 'label', 'slug', 'cover_image', 'publish_at'],
        sort: ['-publish_at', '-id'],
        limit: 12,
      }),
    )) as unknown as BlogPostRecord[]
  } catch (e) {
    if (import.meta.env.DEV) console.warn('[blog] base fetch failed', e)
    return []
  }
  if (!posts.length) return []

  const ids = posts.map((p) => p.id)

  let tx: BlogPostTranslationRecord[] = []
  try {
    tx = (await directus.request(
      readItems<BlogPostTranslationRecord>('blog_posts_translations', {
        filter: { blog_posts_id: { _in: ids }, languages_code: { _in: [locale, 'en'] } },
        fields: ['id', 'blog_posts_id', 'languages_code', 'title', 'summary', 'author'],
        limit: -1,
      }),
    )) as unknown as BlogPostTranslationRecord[]
  } catch (e) {
    if (import.meta.env.DEV) console.warn('[blog] translations fetch failed', e)
  }

  const out: BlogPostUI[] = []
  for (const p of posts) {
    const t = pickTranslation(tx.filter((r) => r.blog_posts_id === p.id), locale)
    const assetVal = p.cover_image
    const imageId = typeof assetVal === 'string' ? assetVal : assetVal?.id
    const date = p.publish_at ? new Date(p.publish_at) : undefined
    const published = date ? date.toLocaleDateString(undefined, { year: 'numeric', month: 'short', day: '2-digit' }) : undefined
    out.push({
      id: String(p.id),
      title: t?.title || p.label || 'Untitled',
      summary: t?.summary || '',
      label: p.label || undefined,
      author: t?.author || undefined,
      published,
      url: p.slug ? `/${locale}/blog/${p.slug}` : '#',
      imageId: imageId || undefined,
    })
  }
  return out
}
