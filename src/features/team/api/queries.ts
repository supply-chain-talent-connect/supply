import { readItems, readUsers } from '@directus/sdk'
import { directus } from '@/lib/directus'

export type PublicUserTranslation = {
  id: number
  directus_users_id: string
  languages_code: string
  title_for_public?: string | null
  description_for_public?: string | null
}

export type DirectusUser = {
  id: string
  first_name?: string | null
  last_name?: string | null
  avatar?: string | { id: string } | null
  title?: string | null
  description?: string | null
  linkedin?: string | null
  twitter?: string | null
  facebook?: string | null
  sort?: number | null
  location?: string | null
}

export type TeamMember = {
  id: string
  name: string
  title?: string
  description?: string
  avatarId?: string
  linkedin?: string
  twitter?: string
  facebook?: string
  location?: string
}

export async function fetchTeamMembers(locale: string): Promise<TeamMember[]> {
  try {
    // First, try to fetch users with their public fields
    let users: DirectusUser[] | undefined
    try {
      users = (await directus.request(
        readUsers({
          fields: [
            'id',
            'first_name',
            'last_name',
            'avatar',
            'title',
            'description',
            'linkedin',
            'twitter',
            'facebook',
            'sort',
            'location',
          ],
          sort: ['sort', 'last_name', 'first_name'],
          limit: -1,
        }),
      )) as unknown as DirectusUser[]
    } catch (e) {
      // Non-fatal: continue with translations path below
      if (import.meta.env.DEV) console.warn('[team] users fetch failed; trying translations fallback', e)
    }

    if (users?.length) {
      // Try to enrich title/description from translations, if accessible
      const translations = (await directus.request(
        readItems<PublicUserTranslation>('junction_directus_users_translations', {
          fields: ['id', 'directus_users_id', 'languages_code', 'title_for_public', 'description_for_public'],
          filter: { languages_code: { _in: [locale, 'en'] } },
          limit: -1,
        }),
      )) as unknown as PublicUserTranslation[]

      const trByUser = new Map<string, { en?: PublicUserTranslation; local?: PublicUserTranslation }>()
      for (const tr of translations) {
        const entry = trByUser.get(tr.directus_users_id) || {}
        if (tr.languages_code === 'en') entry.en = tr
        if (tr.languages_code === locale) entry.local = tr
        trByUser.set(tr.directus_users_id, entry)
      }

      return users.map((u) => {
        const tr = trByUser.get(u.id)
        const title = tr?.local?.title_for_public || tr?.en?.title_for_public || u.title || undefined
        const description =
          tr?.local?.description_for_public || tr?.en?.description_for_public || u.description || undefined
        const avatarVal = u.avatar as string | { id: string } | undefined
        const avatarId = typeof avatarVal === 'string' ? avatarVal : avatarVal?.id
        const name = [u.first_name, u.last_name].filter(Boolean).join(' ').trim() || 'Team Member'
        return {
          id: u.id,
          name,
          title: title || undefined,
          description: description || undefined,
          avatarId,
          linkedin: u.linkedin || undefined,
          twitter: u.twitter || undefined,
          facebook: u.facebook || undefined,
          location: u.location || undefined,
        }
      })
    }

    // If no users accessible, fall back to translation-first path
    const translations = (await directus.request(
      readItems<PublicUserTranslation>('junction_directus_users_translations', {
        fields: ['id', 'directus_users_id', 'languages_code', 'title_for_public', 'description_for_public'],
        filter: { languages_code: { _in: [locale, 'en'] } },
        limit: -1,
      }),
    )) as unknown as PublicUserTranslation[]

    const byUser = new Map<string, { en?: PublicUserTranslation; local?: PublicUserTranslation }>()
    for (const tr of translations) {
      const entry = byUser.get(tr.directus_users_id) || {}
      if (tr.languages_code === 'en') entry.en = tr
      if (tr.languages_code === locale) entry.local = tr
      byUser.set(tr.directus_users_id, entry)
    }
    const userIds = Array.from(byUser.keys())
    if (import.meta.env.DEV) console.warn('[team] info', { locale, translations: translations.length, userIds: userIds.length })

    if (userIds.length === 0) {
      // Fallback: no translations accessible; try reading notable users directly (e.g., with a public title)
      try {
        const users = (await directus.request(
          readUsers({
            fields: [
              'id',
              'first_name',
              'last_name',
              'avatar',
              'title',
              'description',
              'linkedin',
              'twitter',
              'facebook',
              'location',
            ],
            filter: { title: { _nnull: true } },
            limit: -1,
          }),
        )) as unknown as DirectusUser[]
        if (import.meta.env.DEV) console.warn('[team] fallback users', { count: users.length })
        return users.map((u) => {
          const avatarVal = u.avatar as string | { id: string } | undefined
          const avatarId = typeof avatarVal === 'string' ? avatarVal : avatarVal?.id
          const name = [u.first_name, u.last_name].filter(Boolean).join(' ').trim() || 'Team Member'
          return {
            id: u.id,
            name,
            title: u.title ?? undefined,
            description: u.description ?? undefined,
            avatarId,
            linkedin: u.linkedin || undefined,
            twitter: u.twitter || undefined,
            facebook: u.facebook || undefined,
            location: u.location || undefined,
          }
        })
      } catch (e) {
        if (import.meta.env.DEV) console.warn('[team] fallback users fetch failed', e)
        return []
      }
    }

    const users2 = (await directus.request(
      readUsers({
        fields: [
          'id',
          'first_name',
          'last_name',
          'avatar',
          'title',
          'description',
          'linkedin',
          'twitter',
          'facebook',
          'location',
        ],
        filter: { id: { _in: userIds } },
        limit: -1,
      }),
    )) as unknown as DirectusUser[]

    const byId = new Map(users2.map((u) => [u.id, u]))
    const ordered = userIds.map((id) => byId.get(id)).filter(Boolean) as DirectusUser[]

    return ordered.map((u) => {
      const tr = byUser.get(u.id)
      const title = tr?.local?.title_for_public || tr?.en?.title_for_public || u.title || undefined
      const description =
        tr?.local?.description_for_public || tr?.en?.description_for_public || u.description || undefined
      const avatarVal = u.avatar as string | { id: string } | undefined
      const avatarId = typeof avatarVal === 'string' ? avatarVal : avatarVal?.id
      const name = [u.first_name, u.last_name].filter(Boolean).join(' ').trim() || 'Team Member'
      return {
        id: u.id,
        name,
        title: title || undefined,
        description: description || undefined,
        avatarId,
        linkedin: u.linkedin || undefined,
        twitter: u.twitter || undefined,
        email: u.email || undefined,
        facebook: u.facebook || undefined,
        location: u.location || undefined,
      }
    })
  } catch (e) {
    if (import.meta.env.DEV) console.warn('[team] fetch failed', e)
    return []
  }
}
