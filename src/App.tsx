import { useEffect } from 'react'
import AppLayout from '@/app/layout/AppLayout'

function App() {
  useEffect(() => {
    // eslint-disable-next-line no-console
    console.debug('App mounted')
  }, [])
  return (
    <AppLayout>
      <div className="prose max-w-none" />
    </AppLayout>
  )
}

export default App
