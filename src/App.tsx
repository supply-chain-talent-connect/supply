import { useEffect } from 'react'
import AppLayout from '@/app/layout/AppLayout'
import PageBuilder from '@/components/page/PageBuilder'
import LocaleRouter from '@/app/routes/LocaleRouter'
import { createBrowserRouter, Navigate, RouterProvider } from 'react-router-dom'
import NotFound from '@/app/routes/NotFound'

const router = createBrowserRouter([
  { index: true, element: <Navigate to={`/${navigator.language?.split('-')[0] || 'en'}`} replace /> },
  {
    path: '/:locale',
    element: (
      <AppLayout>
        <LocaleRouter />
      </AppLayout>
    ),
    children: [
      { index: true, element: <PageBuilder /> },
      { path: '*', element: <NotFound /> },
    ],
  },
])

function App() {
  useEffect(() => {
    // eslint-disable-next-line no-console
    console.debug('App mounted')
  }, [])
  return <RouterProvider router={router} />
}

export default App
