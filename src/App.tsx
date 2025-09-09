import { useEffect } from 'react'
import AppLayout from '@/app/layout/AppLayout'
import Hero from '@/components/marketing/Hero'
import TrustLogos from '@/components/marketing/TrustLogos'

function App() {
  useEffect(() => {
    // eslint-disable-next-line no-console
  console.debug('App mounted')
  }, [])
  return (
    <AppLayout>
      <Hero />
      <div className="py-8 md:py-12">
        <TrustLogos />
      </div>
    </AppLayout>
  )
}

export default App
