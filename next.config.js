/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'export',
  distDir: 'netlify-app',
  images: {
    unoptimized: true
  },
  assetPrefix: '',
  basePath: '',
  trailingSlash: true
}

module.exports = nextConfig