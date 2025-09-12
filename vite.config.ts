import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import tsconfigPaths from 'vite-tsconfig-paths'

// https://vite.dev/config/
export default defineConfig({
  plugins: [react(), tsconfigPaths()],
  server: {
    host: true, // allow LAN/IP access like 10.0.20.150
    proxy: {
      // Proxy Directus requests during dev to avoid CORS
      '/directus': {
        target: 'https://admin.bradjohnson.ai',
        changeOrigin: true,
        secure: true,
        rewrite: (path) => path.replace(/^\/directus/, ''),
      },
    },
  },
})
