import React, { useEffect, useMemo, useRef, useState } from 'react'
import { useTranslation } from 'react-i18next'
import { useLocation, useNavigate } from 'react-router-dom'
import { cn } from '@/lib/utils'

const LANGS = [
  { code: 'en', native: 'English', flag: '🇬🇧' },
  { code: 'es', native: 'Español', flag: '🇪🇸' },
  { code: 'fr', native: 'Français', flag: '🇫🇷' },
  { code: 'de', native: 'Deutsch', flag: '🇩🇪' },
] as const

type LangCode = (typeof LANGS)[number]['code']

type Props = {
  className?: string
}

function ChevronDown({ className }: { className?: string }) {
  return (
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" className={className}>
      <path d="M6 9l6 6 6-6" />
    </svg>
  )
}

export default function LanguageSwitcher({ className }: Props) {
  const { i18n } = useTranslation()
  const location = useLocation()
  const navigate = useNavigate()

  const current = (i18n.language?.split('-')[0] || 'en') as LangCode
  const [open, setOpen] = useState(false)
  const btnRef = useRef<HTMLButtonElement | null>(null)
  const menuRef = useRef<HTMLDivElement | null>(null)
  const active = useMemo(() => LANGS.find((l) => l.code === current) ?? LANGS[0], [current])

  useEffect(() => {
    function handler(e: MouseEvent) {
      if (!open) return
      if (
        menuRef.current && !menuRef.current.contains(e.target as Node) &&
        btnRef.current && !btnRef.current.contains(e.target as Node)
      ) {
        setOpen(false)
      }
    }
    window.addEventListener('mousedown', handler)
    return () => window.removeEventListener('mousedown', handler)
  }, [open])

  useEffect(() => {
    function onKey(e: KeyboardEvent) {
      if (e.key === 'Escape') setOpen(false)
    }
    window.addEventListener('keydown', onKey)
    return () => window.removeEventListener('keydown', onKey)
  }, [])

  function switchTo(code: LangCode) {
    if (code === current) return setOpen(false)
    i18n.changeLanguage(code)
    try {
      document.documentElement.lang = code
    } catch {
      // ignore
    }
    // Replace first path segment with new locale, preserve query/hash
    const { pathname, search, hash } = location
    const parts = pathname.split('/')
    if (parts.length > 1) {
      parts[1] = code
      const next = parts.join('/') || `/${code}`
      navigate(`${next}${search}${hash}`)
    } else {
      navigate(`/${code}${search}${hash}`)
    }
    setOpen(false)
  }

  return (
    <div className={cn('relative inline-block text-left', className)}>
      <button
        ref={btnRef}
        type="button"
        aria-haspopup="menu"
        aria-expanded={open}
        aria-label={`Language: ${active.native}`}
        onClick={() => setOpen((v) => !v)}
        className="inline-flex h-10 items-center gap-1 rounded-md px-2 text-sm text-gray-700 hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 opacity-80 hover:opacity-100"
      >
        <span className="text-lg leading-none">{active.flag}</span>
        <ChevronDown className="w-4 h-4 opacity-70" />
      </button>

      {open && (
        <div
          ref={menuRef}
          role="menu"
          aria-label="Select language"
          className="absolute right-0 z-50 mt-2 w-48 origin-top-right rounded-2xl border bg-white shadow-xl ring-1 ring-black/5 overflow-hidden"
        >
          <div className="max-h-64 overflow-auto py-1">
            {LANGS.map((l) => (
              <button
                key={l.code}
                role="menuitemradio"
                aria-checked={l.code === active.code}
                onClick={() => switchTo(l.code)}
                className={cn(
                  'w-full text-left px-3 py-2 text-sm flex items-center gap-2 hover:bg-gray-50 focus:bg-gray-50 focus:outline-none',
                  l.code === active.code && 'bg-gray-100',
                )}
              >
                <span className="text-lg">{l.flag}</span>
                <span className="flex-1">{l.native}</span>
              </button>
            ))}
          </div>
        </div>
      )}
    </div>
  )
}
