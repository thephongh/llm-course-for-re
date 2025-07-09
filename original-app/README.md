# Original LLM Course - Standalone HTML Version

This folder contains the original working application that can be run locally without any build process.

## Structure

```
original-app/
├── index.html          # Main course page (landing page)
├── module1.html        # AI Fundamentals & Energy Applications
├── module2.html        # Understanding Large Language Models
├── module3.html        # AI Chatbots in Daily Energy Work
├── module4.html        # Mastering Prompt Engineering
├── module5.html        # Ethics & Best Practices
└── media/             # Course images and assets
```

## How to Run

### Option 1: Simple File Server
```bash
cd original-app
python -m http.server 8000
# Visit http://localhost:8000
```

### Option 2: Live Server (VS Code Extension)
1. Install "Live Server" extension in VS Code
2. Right-click on `index.html`
3. Select "Open with Live Server"

### Option 3: Direct File Opening
Simply double-click `index.html` to open in your browser (some features may not work due to CORS restrictions).

## Features

- ✅ **Pure HTML/CSS/JavaScript** - No build process required
- ✅ **Responsive Design** - Works on desktop and mobile
- ✅ **Language Switching** - Vietnamese/English support
- ✅ **Interactive Elements** - Progress tracking, module navigation
- ✅ **Offline Capable** - All assets are local
- ✅ **Mobile Language Switcher** - Fixed for all device sizes

## Course Content

The course is designed for energy sector professionals to learn about:
- AI, Machine Learning, and Generative AI fundamentals
- Large Language Models (LLMs) and how they work
- Practical applications in energy work
- Prompt engineering techniques
- Ethics and responsible AI usage

## Technical Notes

- Uses vanilla JavaScript for interactivity
- CSS media queries for responsive design
- LocalStorage for progress tracking
- No external dependencies required

This is the original, standalone version that works without any compilation or build process.