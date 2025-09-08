import { useEffect, useState } from 'react'
import { fetchCompanyInfo } from '../api/queries'

export function useCompanyInfo() {
  const [info, setInfo] = useState<{
    logoId?: string
    faviconId?: string
    name?: string
    useFaviconInHeader?: boolean
  } | undefined>()
  useEffect(() => {
    let active = true
    fetchCompanyInfo().then((res) => {
      if (active) setInfo(res)
    })
    return () => {
      active = false
    }
  }, [])
  return info
}
export default useCompanyInfo
