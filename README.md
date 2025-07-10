# Introduction to LLM and Generative AI for Energy Sector Professionals - Training Course

This repository contains the source files for a training course designed to introduce non-tech-savvy professionals in the energy sector to the world of Large Language Models (LLMs) and Generative AI.

## Course Summary

The course provides a foundational understanding of AI concepts, explains how LLMs work in simple terms, and offers practical guidance on using AI chatbots like ChatGPT, Gemini, and Claude effectively in a professional context. The content is tailored for individuals in roles such as project development and asset management.

## Project Structure

This repository contains a streamlined LLM course with the following structure:

### 📁 netlify-app/
**Production-Ready Static Files** - Ready for deployment
- **Static HTML/CSS/JavaScript** - Pre-built, no build process required
- **Production Optimized** - Minified and optimized assets
- **CDN Ready** - Fast loading and delivery
- **Self-Contained** - Includes all necessary files and configurations

```
netlify-app/
├── index.html          # Landing page (redirects to course.html)
├── course.html         # Main course content
├── module1.html        # Module pages
├── module2.html
├── module3.html
├── module4.html
├── module5.html
├── media/             # Course assets (images, etc.)
├── _next/             # Next.js static assets
├── 404.html           # Error page
```

### 📁 Root Directory
**Next.js Development Environment** - For future development
- **Development Server** - Hot reload and development tools (`npm run dev`)
- **Build System** - Can generate new static exports if needed
- **Configuration** - Next.js setup and Netlify deployment config (`netlify.toml`)

## Getting Started

### For Local Development

To run the course locally during development:

```bash
npm install
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) to view the course with hot reload.

### For Local Testing (Static Files)

To test the production version locally:

```bash
# Serve the pre-built static files
cd netlify-app
python -m http.server 8000
# or
npx serve .
```

Open [http://localhost:8000](http://localhost:8000) to view the production version.

## Course Content

The course covers five main modules:

1. **Introduction to AI and LLMs**: Basic concepts and terminology
2. **How LLMs Work**: Simplified explanation of the technology
3. **Practical Applications**: Real-world use cases in the energy sector
4. **Prompt Engineering**: Best practices for effective AI interaction
5. **Ethics and Limitations**: Responsible AI usage and understanding limitations

## Deployment

### Deploy on Netlify (Recommended)

This application uses pre-built static files optimized for Netlify deployment.

#### Option 1: GitHub Integration (Recommended)

1. **Go to Netlify Dashboard**
   - Visit [netlify.com](https://netlify.com) and log in
   - Click "Add new site" → "Import an existing project"

2. **Connect Your GitHub Repository**
   - Choose "Deploy with GitHub"
   - Select your repository: `thephongh/llm-course-for-re`
   - Choose branch: `main`

3. **Configure Build Settings**
   ```
   Build command: (leave blank - pre-built static files)
   Publish directory: netlify-app
   ```

4. **Deploy**
   - Click "Deploy site"
   - Your site will be available at `https://your-site-name.netlify.app`

#### Option 2: Manual Deployment

1. **Deploy manually**
   - Go to [netlify.com](https://netlify.com) → "Sites"
   - Drag the `netlify-app` folder to the deployment area
   - Site will be deployed instantly

#### Option 3: Netlify CLI

```bash
npm install -g netlify-cli
netlify login
cd netlify-app
netlify deploy --prod --dir=.
```

### Configuration Files

The project includes optimized configuration for Netlify:

- **`netlify.toml`** - Deployment configuration and redirects (root directory)
- **`next.config.js`** - Next.js development configuration
- **`package.json`** - Dependencies and development scripts

### Current netlify.toml Configuration

```toml
[build]
  # No build command needed - using pre-built static files
  publish = "netlify-app"

[[redirects]]
  from = "/*"
  to = "/course.html"
  status = 200
```

### Features

- ✅ **Static Export** - Pre-built for optimal performance
- ✅ **No Build Required** - Deploy static files directly
- ✅ **Automatic Redirects** - Routes to main course content
- ✅ **Mobile Responsive** - Works on all device sizes
- ✅ **SEO Optimized** - Proper meta tags and structure
- ✅ **Fast Loading** - Optimized images and assets
- ✅ **Automatic Deployments** - Deploy on every push to main branch
- ✅ **Preview Deployments** - Every PR gets a preview URL
- ✅ **Custom Domain** - Add your own domain in Netlify settings
- ✅ **HTTPS** - Free SSL certificates included

## Technical Details

- Built with Next.js 15.3.4 and React 19
- Static export for maximum compatibility
- Optimized for CDN delivery
- All assets are pre-optimized and minified
- No server-side rendering required

## Future Improvements

This course serves as a solid foundation, but it can be significantly enhanced. Here are some suggestions for future development:

### 1. Enhanced Interactive Features

- **Quizzes and Assessments**: Interactive quizzes at the end of each module
- **Progress Tracking**: User accounts and progress monitoring
- **Interactive Examples**: Live prompt playground for hands-on practice

### 2. Mobile Application

- **Cross-Platform**: React Native or Flutter development
- **Offline Access**: Downloadable content for offline learning
- **Push Notifications**: Learning reminders and updates

### 3. Enhanced Content

- **Video Content**: Embedded video lectures and demonstrations
- **Case Studies**: Energy sector-specific AI implementation examples
- **Resource Library**: Curated additional reading and tools

## Troubleshooting

If the site shows "Redirecting to course..." and gets stuck:
1. Check that `course.html` exists in the deployment
2. Verify that redirects are working properly in netlify.toml
3. Check browser console for any JavaScript errors

### Alternative: Deploy on Vercel

You can also deploy on [Vercel Platform](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme) from the creators of Next.js.

Check out the [Next.js deployment documentation](https://nextjs.org/docs/app/building-your-application/deploying) for more details.

---

This project was created by **Phong Han**.