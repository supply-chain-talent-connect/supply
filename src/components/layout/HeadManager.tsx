import { useEffect, useRef } from 'react'
import { fetchAdvancedSiteWideSettings, fetchLandingPageSettings } from '@/features/seo/api/queries'

export default function HeadManager() {
  const cleanupNodes = useRef<HTMLElement[]>([])
  const prevTitle = useRef<string | undefined>(undefined)

  useEffect(() => {
    let active = true

    const head = document.head
    if (!head) return

    const ensureMeta = (name: string) => {
      let el = head.querySelector<HTMLMetaElement>(`meta[name="${name}"]`)
      if (!el) {
        el = document.createElement('meta')
        el.setAttribute('name', name)
        head.appendChild(el)
      }
      return el
    }

    const applyHtmlInjection = (html?: string) => {
      // remove previously injected nodes
      for (const node of cleanupNodes.current) node.remove()
      cleanupNodes.current = []

      if (!html) return

      // Parse HTML string into nodes. Rebuild <script> tags so they execute.
      const tpl = document.createElement('template')
      tpl.innerHTML = html
      const nodes = Array.from(tpl.content.childNodes)

      for (const n of nodes) {
        if (n.nodeType === Node.ELEMENT_NODE && (n as Element).tagName.toLowerCase() === 'script') {
          const s = n as HTMLScriptElement
          const script = document.createElement('script')
          // copy attributes
          for (const { name, value } of Array.from(s.attributes)) script.setAttribute(name, value)
          if (!s.src) script.textContent = s.textContent
          head.appendChild(script)
          cleanupNodes.current.push(script)
        } else if (n.nodeType === Node.ELEMENT_NODE) {
          const el = n as HTMLElement
          head.appendChild(el)
          cleanupNodes.current.push(el)
        } else if (n.nodeType === Node.COMMENT_NODE) {
          // skip
        } else if (n.nodeType === Node.TEXT_NODE) {
          // ignore stray text in head
        }
      }
    }

    const apply = async () => {
      const [sw, lp] = await Promise.all([
        fetchAdvancedSiteWideSettings(),
        fetchLandingPageSettings(),
      ])
      if (!active) return

      // Title and description with optional prefixes
      const title = [sw?.titlePrefix ?? '', lp?.title ?? ''].join('') || undefined
      if (title) {
        prevTitle.current = document.title
        document.title = title
      }

      const description =
        (sw?.descriptionPrefix || '') + (lp?.description || '') || undefined
      if (description) {
        const meta = ensureMeta('description')
        meta.setAttribute('content', description)
      }

      // CSS injections: site-wide and landing, managed separately
      const ensureStyle = (id: string, css?: string) => {
        let style = head.querySelector<HTMLStyleElement>(`#${id}`)
        if (!style && css) {
          style = document.createElement('style')
          style.id = id
          head.appendChild(style)
        }
        if (style) {
          style.textContent = css || ''
          if (!css) style.remove()
        }
      }
      ensureStyle('sw-css', sw?.css)
      ensureStyle('lp-css', lp?.css)

      // HTML header injections combined to preserve both
      const htmlCombined = `${sw?.html || ''}${lp?.html || ''}`
      applyHtmlInjection(htmlCombined || undefined)

      // JS injections: site-wide and landing, managed separately
      const ensureScript = (id: string, code?: string) => {
        let script = head.querySelector<HTMLScriptElement>(`#${id}`)
        if (!script && code) {
          script = document.createElement('script')
          script.id = id
          head.appendChild(script)
        }
        if (script) {
          script.textContent = code || ''
          if (!code) script.remove()
        }
      }
      ensureScript('sw-js', sw?.js)
      ensureScript('lp-js', lp?.js)
    }

    apply()

    return () => {
      active = false
      for (const node of cleanupNodes.current) node.remove()
      cleanupNodes.current = []
      // Do not reset title/description on unmount; app persists for SPA lifetime
    }
  }, [])

  return null
}
