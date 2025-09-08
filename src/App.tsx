import { useEffect } from 'react'
import AppLayout from '@/app/layout/AppLayout'
import Hero from '@/components/marketing/Hero'

function App() {
  useEffect(() => {
    // eslint-disable-next-line no-console
    console.debug('App mounted')
  }, [])
  return (
    <AppLayout>
      <Hero />
    </AppLayout>
  )
}

export default App
