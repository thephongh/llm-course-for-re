# Introduction to LLM and Generative AI for Energy Sector Professionals - Training Course

This repository contains the source files for a training course designed to introduce non-tech-savvy professionals in the energy sector to the world of Large Language Models (LLMs) and Generative AI.

## Course Summary

The course provides a foundational understanding of AI concepts, explains how LLMs work in simple terms, and offers practical guidance on using AI chatbots like ChatGPT, Gemini, and Claude effectively in a professional context. The content is tailored for individuals in roles such as project development and asset management.

## Project Structure

This repository contains two distinct versions of the LLM course:

### 📁 original-app/
**Standalone HTML Version** - The original working application
- **Pure HTML/CSS/JavaScript** - No build process required
- **Local Development** - Can be run with any simple HTTP server
- **Offline Capable** - All assets are local
- **Easy to Modify** - Direct HTML/CSS/JS editing

### 📁 netlify-app/
**Netlify Deployment Version** - Optimized for production
- **Next.js Static Export** - Pre-built and optimized
- **Production Ready** - Minified and optimized assets
- **CDN Optimized** - Fast loading and delivery
- **Automatic Deployments** - Integrates with Netlify

### 📁 Root Directory
**Next.js Development Environment** - For development and building
- **Development Server** - Hot reload and development tools
- **Build System** - Generates the netlify-app output
- **Configuration** - Next.js, Netlify, and build configurations

## Getting Started

### For Local Development (original-app)

The quickest way to run the course locally:

```bash
cd original-app
npm start
# or
node server.js
# or
python -m http.server 8000
```

Open [http://localhost:8000](http://localhost:8000) to view the course.

### For Next.js Development

If you want to modify the Next.js version:

```bash
npm install
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the course.

### For Netlify Deployment

The `netlify-app` folder contains ready-to-deploy files. Simply:
1. Deploy the `netlify-app` folder to Netlify
2. Or use the GitHub integration as described in the deployment section

## Course Content

The course covers five main modules:

1. **Introduction to AI and LLMs**: Basic concepts and terminology
2. **How LLMs Work**: Simplified explanation of the technology
3. **Practical Applications**: Real-world use cases in the energy sector
4. **Prompt Engineering**: Best practices for effective AI interaction
5. **Ethics and Limitations**: Responsible AI usage and understanding limitations

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

## Deployment

### Deploy on Netlify (Recommended)

This Next.js application is configured for static export and optimized for Netlify deployment.

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
   Build command: npm run build
   Publish directory: out
   ```

4. **Deploy**
   - Click "Deploy site"
   - Your site will be available at `https://your-site-name.netlify.app`

#### Option 2: Manual Deployment

1. **Build the site locally**
   ```bash
   npm run build
   ```

2. **Deploy manually**
   - Go to [netlify.com](https://netlify.com) → "Sites"
   - Drag the `out` folder to the deployment area

#### Configuration Files

The project includes optimized configuration for Netlify:

- **`netlify.toml`** - Build configuration and redirects
- **`next.config.js`** - Static export configuration
- **`package.json`** - Updated with export script

#### Features

- ✅ **Automatic Deployments** - Deploy on every push to main branch
- ✅ **Preview Deployments** - Every PR gets a preview URL
- ✅ **Custom Domain** - Add your own domain in Netlify settings
- ✅ **HTTPS** - Free SSL certificates included
- ✅ **Mobile Language Switcher** - Fixed for all device sizes

### Alternative: Deploy on Vercel

You can also deploy on [Vercel Platform](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme) from the creators of Next.js.

Check out the [Next.js deployment documentation](https://nextjs.org/docs/app/building-your-application/deploying) for more details.

---

This project was created by **Phong Han**.
