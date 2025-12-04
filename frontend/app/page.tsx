'use client'

import { useEffect } from 'react'
import App from '../src/App'

export default function Page() {
  // Preserve dynamic document.title behavior from the Vite app
  useEffect(() => {
    // App component already manages document.title based on route
  }, [])

  return <App />
}


