# Netlify Deployment - Static Export

This folder contains the built and optimized files ready for deployment to Netlify.

## Structure

```
netlify-app/
├── index.html          # Next.js generated page (redirects to course.html)
├── course.html         # Main course content
├── module1.html        # Module pages
├── module2.html
├── module3.html
├── module4.html
├── module5.html
├── media/             # Course assets
├── _next/             # Next.js static assets
├── 404.html           # Error page
└── netlify.toml       # Netlify configuration
```

## Deployment to Netlify

### Option 1: GitHub Integration (Recommended)

1. **Push to GitHub** (if not already done)
2. **Go to Netlify Dashboard**
   - Visit [netlify.com](https://netlify.com) and log in
   - Click "Add new site" → "Import an existing project"
3. **Connect Repository**
   - Choose "Deploy with GitHub"
   - Select your repository
   - Branch: `main`
4. **Configure Build Settings**
   ```
   Build command: npm run build
   Publish directory: out
   ```
5. **Deploy**
   - Click "Deploy site"
   - Site will be available at `https://your-site-name.netlify.app`

### Option 2: Manual Deployment

1. **Drag & Drop**
   - Go to [netlify.com](https://netlify.com) → "Sites"
   - Drag the entire `netlify-app` folder to the deployment area
   - Site will be deployed instantly

### Option 3: Netlify CLI

```bash
npm install -g netlify-cli
netlify login
cd netlify-app
netlify deploy --prod --dir=.
```

## Configuration

### netlify.toml
```toml
[build]
  command = "npm run build"
  publish = "out"

[build.environment]
  NODE_VERSION = "18"

[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 200
```

## Features

- ✅ **Static Export** - Pre-built for optimal performance
- ✅ **Next.js Optimization** - Minified and optimized assets
- ✅ **Automatic Redirects** - Handles routing properly
- ✅ **Mobile Responsive** - Language switcher works on all devices
- ✅ **SEO Optimized** - Proper meta tags and structure
- ✅ **Fast Loading** - Optimized images and assets

## Technical Details

- Built with Next.js 15.3.4 and React 19
- Static export for maximum compatibility
- Optimized for CDN delivery
- Automatic redirect from index.html to course.html
- All assets are pre-optimized and minified

## Troubleshooting

If the site shows "Redirecting to course..." and gets stuck:
1. Check that `course.html` exists in the deployment
2. Verify that redirects are working properly
3. Check browser console for any JavaScript errors

This folder is ready for production deployment on Netlify.