import * as React from 'react'
import Navbar from '@/components/layout/Navbar'
import useHeaderNavigation from '@/features/navigation/hooks/useHeaderNavigation'
import useCompanyInfo from '@/features/navigation/hooks/useCompany'
import { assetUrl } from '@/lib/directus'

export default function AppLayout({ children }: { children: React.ReactNode }) {
  const menu = useHeaderNavigation()
  const company = useCompanyInfo()
  const useFavicon = company?.useFaviconInHeader
  const imageId = useFavicon ? company?.faviconId : company?.logoId
  const logo = imageId
    ? {
        url: '/',
        src: assetUrl(imageId, { height: 32 }),
        alt: company?.name || 'Logo',
        title: useFavicon ? company?.name || 'Logo' : undefined,
      }
    : undefined
  // Hydrate favicon when available
  if (company?.faviconId) {
    const href = assetUrl(company.faviconId, {})
    const link = document.querySelector<HTMLLinkElement>('link[rel="icon"]')
    if (link && link.href !== href) link.href = href
  }
  return (
    <div className="min-h-dvh flex flex-col">
      <header className="sticky top-0 z-50 bg-background/80 backdrop-blur border-b">
        <Navbar menu={menu} logo={logo} />
      </header>
      <main className="flex-1">
        <div className="container py-8">{children}</div>
      </main>
      <footer className="border-t">
        <div className="container py-6 text-sm text-muted-foreground" />
      </footer>
    </div>
  )
}
