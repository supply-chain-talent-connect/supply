import { useEffect, useState } from 'react'
import { fetchCompanyLogo } from '../api/queries'

export function useCompanyLogo() {
  const [logoId, setLogoId] = useState<string | undefined>()
  useEffect(() => {
    let active = true
    fetchCompanyLogo().then((id) => {
      if (active) setLogoId(id)
    })
    return () => {
      active = false
    }
  }, [])
  return logoId
}

export default useCompanyLogo

