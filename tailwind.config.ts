import type { Config } from 'tailwindcss'

const config: Config = {
  content: [
    './src/pages/**/*.{js,ts,jsx,tsx,mdx}',
    './src/components/**/*.{js,ts,jsx,tsx,mdx}',
    './src/app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      colors: {
        primary: '#000000',
        secondary: '#FFFFFF',
        accent: '#3B82F6',
        'accent-dark': '#8B5CF6',
        'gray-light': '#F3F4F6',
        'gray-medium': '#E5E7EB',
        'gray-dark': '#4B5563',
        'gray-darker': '#111827',
        'gray-darkest': '#1F2937',
        'text-light': '#FFFFFF',
        'text-dark': '#111827',
        'text-gray': '#6B7280',
      },
      backgroundImage: {
        'gradient-primary': 'linear-gradient(135deg, #3B82F6 0%, #8B5CF6 100%)',
      },
      boxShadow: {
        'card': '0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05)',
      },
      borderRadius: {
        'card': '1rem',
        'button': '0.5rem',
      },
      fontSize: {
        'h1': '4.5rem',
        'h2': '3rem',
        'p': '1.125rem',
      },
    },
  },
  plugins: [],
}
export default config
