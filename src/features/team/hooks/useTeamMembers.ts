import { useEffect, useState } from 'react'
import { useTranslation } from 'react-i18next'
import { fetchTeamMembers, type TeamMember } from '@/features/team/api/queries'

export function useTeamMembers(): { members: TeamMember[]; loading: boolean } {
  const { i18n } = useTranslation()
  const locale = i18n.language?.split('-')[0] || 'en'
  const [members, setMembers] = useState<TeamMember[]>([])
  const [loading, setLoading] = useState<boolean>(true)

  useEffect(() => {
    let active = true
    setLoading(true)
    fetchTeamMembers(locale).then((rows) => {
      if (!active) return
      setMembers(rows)
      setLoading(false)
    })
    return () => {
      active = false
    }
  }, [locale])

  return { members, loading }
}

export default useTeamMembers
