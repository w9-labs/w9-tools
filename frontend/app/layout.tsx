import './globals.css'
import type { ReactNode } from 'react'

export const metadata = {
  title: 'W9 Tools',
  description: 'W9 Labs tools frontend',
}

export default function RootLayout({ children }: { children: ReactNode }) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  )
}


