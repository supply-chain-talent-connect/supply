import * as React from 'react'
import Navbar from '@/components/layout/Navbar'

export default function AppLayout({ children }: { children: React.ReactNode }) {
  return (
    <div className="min-h-dvh flex flex-col">
      <header className="sticky top-0 z-50 bg-background/80 backdrop-blur border-b">
        <Navbar />
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
