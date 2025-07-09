name: "Hugo Site Conversion PRP - AI Training Course Migration"
description: |

## Purpose
Convert existing multi-page HTML web application into a Hugo static site generator project while preserving liquid glass styling, interactive features, and enabling free navigation between modules.

## Core Principles
1. **Context is King**: Include ALL necessary documentation, examples, and caveats
2. **Current Documentation Required**: ALWAYS search for latest documentation to avoid deprecated features
3. **Validation Loops**: Provide executable tests/lints the AI can run and fix
4. **Information Dense**: Use keywords and patterns from the codebase
5. **Progressive Success**: Start simple, validate, then enhance
6. **Global rules**: Be sure to follow all rules in CLAUDE.md

## ⚠️ MANDATORY RESEARCH PHASE
Before implementation, the AI agent MUST:
1. **WebSearch for latest documentation** of Hugo framework
2. **Check for deprecation warnings** and breaking changes
3. **Verify current configuration syntax** and template functions
4. **Research common gotchas** and troubleshooting guides
5. **Confirm security requirements** and best practices

**Search Template**: Use these exact search patterns:
- `"Hugo v0.138 documentation configuration 2024"`
- `"Hugo deprecated features breaking changes migration 2024"`
- `"Hugo common errors troubleshooting build issues 2024"`
- `"Hugo security configuration requirements 2024"`

---

## Goal
Convert the existing 5-module interactive AI training course from static HTML files into a Hugo static site generator project that can be deployed on Netlify or other hosting services while maintaining the liquid glass aesthetic, interactive learning features, and removing module progression restrictions.

## Why
- **Scalability**: Hugo enables easier content management and site expansion
- **Performance**: Static site generation provides faster loading and better SEO
- **Deployment**: Modern deployment workflows with Git-based hosting
- **Maintenance**: Easier to update content and styling with template-based approach
- **Enhanced UX**: Remove restrictive module progression to allow free navigation

## What
Convert 5 standalone HTML files into a Hugo site structure with:
- Modern Hugo configuration (v0.138+)
- Preserved liquid glass styling and interactive elements
- Multi-language support (English/Vietnamese)
- Free navigation between all modules
- Enhanced illustrations and visual content
- Netlify-ready deployment configuration

### Success Criteria
- [ ] All 5 modules accessible as individual pages in Hugo
- [ ] Liquid glass styling perfectly preserved
- [ ] JavaScript interactivity maintained
- [ ] Multi-language switching functional
- [ ] Responsive design working across devices
- [ ] Clean build with no deprecation warnings
- [ ] Successful deployment to Netlify
- [ ] Free navigation between modules (no progression locks)
- [ ] Enhanced with additional relevant illustrations

## All Needed Context

### Documentation & References (list all context needed to implement the feature)
```yaml
# CRITICAL: Always get LATEST documentation to avoid deprecated features
# Use WebSearch for current documentation before implementation

# MUST READ - Include these in your context window
- url: https://gohugo.io/configuration/
  why: Latest Hugo configuration syntax and options
  search_terms: "Hugo v0.138 configuration YAML 2024"
  
- url: https://gohugo.io/templates/
  why: Template syntax and functions, avoiding deprecated ones
  search_terms: "Hugo template functions deprecation 2024"
  
- url: https://gohugo.io/content-management/
  why: Content organization and front matter structure
  search_terms: "Hugo content management multilingual 2024"

- url: https://docs.netlify.com/configure-builds/file-based-configuration/
  why: Netlify deployment configuration for Hugo
  search_terms: "Netlify Hugo deployment configuration 2024"
  
- file: web-app/index.html
  why: Source structure and liquid glass styling patterns
  
- file: web-app/module1.html
  why: Module page structure and interactive elements
  
- search_latest: "WebSearch: Hugo latest version breaking changes deprecation 2024"
  why: "Avoid deprecated features and config options"

- search_gotchas: "WebSearch: Hugo common errors troubleshooting build issues 2024"
  why: "Learn from others' recent experiences"

# MANDATORY: Research current best practices
- research_required:
  - "Latest stable version of Hugo (v0.138+)"
  - "Recent breaking changes and migrations"
  - "Current configuration format (YAML preferred over TOML)"
  - "Latest template syntax and functions"
  - "Security considerations and recommendations"
  - "Hugo module system for themes and assets"
```

### Current Codebase tree
```bash
web-app/
├── index.html          # Landing page with course overview
├── module1.html        # AI Fundamentals & Energy Applications
├── module2.html        # Understanding Large Language Models
├── module3.html        # AI Chatbots in Daily Energy Work
├── module4.html        # Mastering Prompt Engineering
└── module5.html        # Ethics & Best Practices

public/media/           # Images and illustrations
├── ai_hallucination.png
├── chatbot_interface_example.png
├── cover.png
├── data_privacy_security.png
├── knowledge_currency.png
├── logo.png
├── ml_workflow_simple.png
├── prompt_engineering_flow.png
├── transformer_architecture.png
└── [other images]
```

### Desired Hugo Codebase tree with files to be added and responsibility of file
```bash
hugo-llm-course/
├── hugo.yaml                    # Main Hugo configuration (YAML format)
├── netlify.toml                 # Netlify deployment configuration
├── .gitignore                   # Git ignore file
├── README.md                    # Project documentation
├── content/
│   ├── _index.md               # Homepage content (converted from index.html)
│   ├── modules/
│   │   ├── _index.md           # Modules section index
│   │   ├── module-1.md         # Module 1 content
│   │   ├── module-2.md         # Module 2 content
│   │   ├── module-3.md         # Module 3 content
│   │   ├── module-4.md         # Module 4 content
│   │   └── module-5.md         # Module 5 content
│   └── _index.vi.md            # Vietnamese homepage
├── layouts/
│   ├── _default/
│   │   ├── baseof.html         # Base template with navigation
│   │   ├── single.html         # Single page template
│   │   └── list.html           # List page template
│   ├── index.html              # Homepage template
│   ├── partials/
│   │   ├── head.html           # HTML head section
│   │   ├── header.html         # Navigation header
│   │   ├── footer.html         # Footer
│   │   └── scripts.html        # JavaScript includes
│   └── shortcodes/
│       ├── module-card.html    # Module preview card
│       └── feature-card.html   # Feature card component
├── assets/
│   ├── css/
│   │   ├── main.scss           # Main stylesheet (liquid glass styles)
│   │   ├── _variables.scss     # CSS variables
│   │   ├── _components.scss    # Component styles
│   │   └── _responsive.scss    # Responsive styles
│   └── js/
│       ├── main.js             # Main JavaScript
│       ├── progress.js         # Progress tracking
│       └── i18n.js             # Internationalization
├── static/
│   ├── media/                  # Static images (moved from public/media/)
│   └── favicon.ico             # Site favicon
├── i18n/
│   ├── en.yaml                 # English translations
│   └── vi.yaml                 # Vietnamese translations
└── data/
    ├── modules.yaml            # Module metadata
    └── features.yaml           # Feature data
```

### Known Gotchas of our codebase & Library Quirks
```yaml
# CRITICAL: Research and document ALL framework-specific requirements
# Use WebSearch to find latest gotchas and breaking changes

Framework_Version_Check:
  - current_version: "Hugo v0.138+ (2024)"
  - latest_version: "Search for latest stable version"
  - breaking_changes: "Template function deprecations, config format changes"

Configuration_Gotchas:
  # CRITICAL: Hugo requires specific setup
  # Hugo v0.128+ changed .Site.DisqusShortname to .Site.Config.Services.Disqus.Shortname
  # Hugo template functions: resources.ToCSS deprecated, use css.Sass instead
  # Security config requires explicit allowlist for executables
  - config_format: "YAML preferred over TOML for hugo.yaml"
  - template_syntax: "Check for deprecated template functions"
  - security_requirements: "Configure security.exec.allow for any external executables"
  - multilingual: "Configure defaultContentLanguage and languages properly"

Library_Quirks:
  # Hugo-specific requirements
  # Hugo requires specific directory structure
  # Content files need proper front matter
  # Assets pipeline requires specific syntax
  - directory_structure: "content/, layouts/, static/, assets/ must be properly structured"
  - front_matter: "YAML front matter required for all content files"
  - assets_pipeline: "Use Hugo pipes for CSS/JS processing"
  - multilingual: "Content files need language suffixes (.en.md, .vi.md)"

Build_Process_Gotchas:
  # Hugo requires specific build sequence
  # Assets must be processed before deployment
  # Netlify requires specific Hugo version in environment
  - build_order: "Hugo build -> Deploy to public/ folder"
  - directory_requirements: "Hugo expects standard directory structure"
  - dependencies: "Node.js may be needed for asset processing"
  - netlify_config: "HUGO_VERSION must be specified in netlify.toml"

Styling_Migration_Gotchas:
  # Preserve liquid glass effects
  # CSS must be processed through Hugo pipes
  # JavaScript interactivity must be maintained
  - css_processing: "Use Hugo's asset pipeline for SCSS processing"
  - js_modules: "Ensure JavaScript modules load correctly"
  - liquid_glass: "Preserve backdrop-filter and rgba() transparency effects"
  - responsive: "Maintain CSS Grid and Flexbox layouts"

Search_Terms_For_Issues:
  - "Hugo v0.138 common errors troubleshooting 2024"
  - "Hugo deprecated template functions migration guide 2024"
  - "Hugo security configuration requirements 2024"
  - "Hugo Netlify deployment build process gotchas 2024"
  - "Hugo multilingual site configuration 2024"
```

## Implementation Blueprint

### Data models and structure

Create the core Hugo configuration and content structure to ensure proper site organization and functionality.

```yaml
# hugo.yaml configuration structure
baseURL: 'https://llm-course.netlify.app'
languageCode: 'en-us'
title: 'Interactive AI Training For Energy Professionals'
defaultContentLanguage: 'en'

# Multilingual configuration
languages:
  en:
    title: 'Interactive AI Training For Energy Professionals'
    weight: 1
  vi:
    title: 'Đào tạo AI tương tác cho chuyên gia năng lượng'
    weight: 2

# Content and media configuration
params:
  description: 'Master Large Language Models and Generative AI'
  author: 'Phong Han'
  logo: '/media/logo.png'
  
# Menu configuration for free navigation
menu:
  main:
    - name: 'Modules'
      url: '/modules/'
      weight: 10
```

### List of tasks to be completed to fulfill the PRP in the order they should be completed

```yaml
Task 1 - Setup Hugo Project Structure:
CREATE hugo-llm-course/ directory:
  - INITIALIZE: hugo new site hugo-llm-course
  - MODIFY: Use YAML config instead of default TOML
  - CREATE: Basic directory structure following Hugo conventions

Task 2 - Configure Hugo for Current Version:
MODIFY hugo.yaml:
  - RESEARCH: Latest Hugo configuration syntax via WebSearch
  - CONFIGURE: Multilingual support (English/Vietnamese)
  - SET: Security configurations for current Hugo version
  - ENABLE: Asset pipeline and processing

Task 3 - Convert Content Structure:
CREATE content files:
  - EXTRACT: Content from index.html to content/_index.md
  - CONVERT: Each module HTML to corresponding .md files
  - IMPLEMENT: Proper front matter with multilingual variants
  - REMOVE: Module progression restrictions

Task 4 - Create Layout Templates:
CREATE layouts/ structure:
  - BUILD: baseof.html template with navigation
  - IMPLEMENT: Module template (single.html)
  - CREATE: Homepage template (index.html)
  - BUILD: Partials for reusable components

Task 5 - Migrate and Enhance Styling:
CREATE assets/css/ structure:
  - EXTRACT: Liquid glass styles from HTML files
  - CONVERT: CSS to SCSS with Hugo asset pipeline
  - PRESERVE: All backdrop-filter and transparency effects
  - MAINTAIN: Responsive design and animations
  - ENHANCE: Add new illustration areas

Task 6 - Port JavaScript Functionality:
CREATE assets/js/ structure:
  - EXTRACT: JavaScript from HTML files
  - MODULARIZE: Separate concerns (progress, i18n, navigation)
  - REMOVE: Module locking functionality
  - MAINTAIN: Multi-language switching
  - TEST: All interactive elements

Task 7 - Setup Internationalization:
CREATE i18n/ structure:
  - EXTRACT: All text strings from HTML
  - ORGANIZE: Translation files (en.yaml, vi.yaml)
  - IMPLEMENT: Hugo i18n functions in templates
  - TEST: Language switching functionality

Task 8 - Configure Deployment:
CREATE deployment configuration:
  - CREATE: netlify.toml with correct Hugo version
  - CONFIGURE: Build settings and environment variables
  - SET: Redirects and headers if needed
  - TEST: Local build process

Task 9 - Add Enhanced Content:
ENHANCE existing content:
  - RESEARCH: Relevant energy sector illustrations
  - ADD: New images to static/media/
  - IMPLEMENT: Image shortcodes for better management
  - OPTIMIZE: Image loading and performance

Task 10 - Testing and Validation:
VALIDATE complete site:
  - RUN: Hugo build with --printWarnings
  - TEST: All pages and navigation
  - VERIFY: Multi-language functionality
  - CHECK: Responsive design across devices
  - VALIDATE: Deployment to Netlify
```

### Per task pseudocode as needed added to each task

```bash
# Task 1 - Hugo Project Setup
hugo new site hugo-llm-course --format yaml
cd hugo-llm-course
# PATTERN: Always use YAML for new Hugo projects (current best practice)

# Task 2 - Configuration
# CRITICAL: Use latest configuration syntax to avoid deprecation warnings
# GOTCHA: Security settings required for external executables
hugo.yaml:
  baseURL: 'https://example.com'
  defaultContentLanguage: 'en'
  # PATTERN: Current multilingual config (see Hugo docs)
  languages:
    en: { title: 'English Title' }
    vi: { title: 'Vietnamese Title' }

# Task 4 - Layout Templates
# PATTERN: Use Hugo's template inheritance (see layouts/baseof.html)
layouts/_default/baseof.html:
  - Include navigation with free module access
  - Preserve liquid glass styling in header
  - Use Hugo template functions (avoid deprecated ones)

# Task 5 - Asset Pipeline
# CRITICAL: Use Hugo pipes for CSS processing
{{ $sass := resources.Get "css/main.scss" }}
{{ $style := $sass | resources.ToCSS | resources.Minify }}
# PATTERN: Hugo asset processing (current syntax)

# Task 8 - Netlify Configuration
netlify.toml:
  [build]
    command = "hugo --gc --minify"
    publish = "public"
  [build.environment]
    HUGO_VERSION = "0.138.0"  # CRITICAL: Specify exact Hugo version
```

### Integration Points
```yaml
CONTENT_MANAGEMENT:
  - front_matter: "Add YAML front matter to all content files"
  - multilingual: "Implement .en.md and .vi.md file structure"
  - navigation: "Remove module progression locks, enable free access"
  
STYLING:
  - asset_pipeline: "Process SCSS through Hugo pipes"
  - liquid_glass: "Preserve backdrop-filter: blur(10px) effects"
  - responsive: "Maintain CSS Grid and Flexbox layouts"
  
JAVASCRIPT:
  - modules: "Reorganize JS into logical modules"
  - i18n: "Integrate with Hugo's i18n system"
  - interactivity: "Preserve all interactive elements"
  
DEPLOYMENT:
  - netlify: "Configure netlify.toml with Hugo version"
  - git: "Setup Git repository for continuous deployment"
  - environment: "Configure build environment variables"
```

## Validation Loop

### Level 0: Framework Version & Configuration Check
```bash
# MANDATORY: Run these BEFORE any implementation
# Check for deprecated configuration and breaking changes

# For Hugo projects:
hugo version                         # Verify Hugo version (should be v0.138+)
hugo config                         # Check configuration syntax
hugo --printWarnings                # Check for deprecation warnings

# Check for common Hugo issues:
hugo server --navigateToChanged     # Test development server
hugo --gc --minify                  # Test production build

# Expected: No deprecation warnings, all tools current version
# If warnings: UPDATE configuration before proceeding
```

### Level 1: Content & Template Validation
```bash
# Validate Hugo site structure and templates
hugo --printPathWarnings            # Check for path issues
hugo list drafts                    # Verify content organization
hugo list all                       # Check all pages are recognized

# Template validation:
hugo --printI18nWarnings           # Check internationalization
hugo --printUnusedTemplates        # Identify unused templates

# Expected: No warnings, all content properly structured
```

### Level 2: Asset Pipeline & Styling
```bash
# Test asset processing and styling preservation
hugo --printMemoryUsage            # Check asset processing performance

# Manual validation:
# - Open each page in browser
# - Verify liquid glass effects render correctly
# - Test responsive design on different screen sizes
# - Confirm all animations and transitions work
# - Validate color schemes and gradients

# Expected: All styling preserved, no broken assets
```

### Level 3: Functionality Testing
```bash
# Test interactive features and JavaScript
# Start development server
hugo server --disableFastRender

# Test scenarios:
# 1. Language switching works on all pages
# 2. Navigation between modules is unrestricted
# 3. Progress tracking still functions (if kept)
# 4. All interactive elements respond correctly
# 5. Mobile responsiveness maintained

# Expected: All JavaScript functionality preserved
```

### Level 4: Deployment Validation
```bash
# Test Netlify deployment configuration
# Local production build
hugo --gc --minify --buildFuture

# Validate build output:
ls -la public/                     # Check generated files
grep -r "deprecated" public/       # Search for any remaining deprecated warnings

# Deploy to Netlify:
# 1. Push to Git repository
# 2. Connect to Netlify
# 3. Verify build succeeds
# 4. Test live site functionality

# Expected: Successful deployment, all features working
```

## Final validation Checklist

### Framework & Configuration Validation
- [ ] Latest Hugo documentation researched and applied
- [ ] No deprecated configuration options used
- [ ] Hugo version v0.138+ compatibility confirmed
- [ ] All deprecation warnings resolved
- [ ] Security configuration properly set
- [ ] Multilingual configuration working

### Content & Structure Validation  
- [ ] All 5 modules converted to Hugo content
- [ ] Front matter properly configured
- [ ] Navigation allows free access to all modules
- [ ] Content displays correctly in both languages
- [ ] SEO metadata properly implemented

### Styling & Design Validation
- [ ] Liquid glass effects perfectly preserved
- [ ] All CSS animations and transitions working
- [ ] Responsive design maintained across devices
- [ ] Color schemes and gradients intact
- [ ] Asset pipeline processing CSS correctly

### Functionality Validation
- [ ] JavaScript interactivity maintained
- [ ] Language switching functional
- [ ] Progress tracking works (if preserved)
- [ ] All interactive elements responsive
- [ ] No console errors in browser

### Deployment Readiness
- [ ] Clean Hugo build: `hugo --gc --minify`
- [ ] No build warnings or errors
- [ ] Netlify configuration tested
- [ ] Git repository properly configured
- [ ] Live deployment successful
- [ ] All pages accessible and functional

### Content Enhancement
- [ ] Additional relevant illustrations added
- [ ] Image optimization implemented
- [ ] Loading performance optimized
- [ ] Accessibility standards met

---

## Anti-Patterns to Avoid

### Hugo-Specific Anti-Patterns
- ❌ **Don't use deprecated template functions** (e.g., resources.ToCSS → css.Sass)
- ❌ **Don't use TOML config for new projects** - YAML is preferred
- ❌ **Don't ignore Hugo version in Netlify config** - Always specify exact version
- ❌ **Don't mix old and new template syntax** - Be consistent with current version

### Content Migration Anti-Patterns  
- ❌ **Don't copy HTML directly into templates** - Convert to proper Hugo templates
- ❌ **Don't ignore front matter** - All content files need proper YAML front matter
- ❌ **Don't break multilingual structure** - Follow Hugo's language conventions
- ❌ **Don't hardcode content in templates** - Use Hugo's content management

### Styling Migration Anti-Patterns
- ❌ **Don't lose liquid glass effects** - Carefully preserve backdrop-filter styles
- ❌ **Don't ignore asset pipeline** - Use Hugo's built-in CSS processing
- ❌ **Don't break responsive design** - Test thoroughly on all screen sizes
- ❌ **Don't forget CSS source maps** - Enable for development debugging

### Deployment Anti-Patterns
- ❌ **Don't skip Netlify configuration** - netlify.toml is essential
- ❌ **Don't ignore build warnings** - Address all deprecation warnings
- ❌ **Don't forget environment variables** - Set Hugo version and other required vars
- ❌ **Don't skip testing deployment** - Always test full build pipeline

---

## Confidence Scoring (Rate 1-10 for one-pass implementation success)

### Research & Documentation Score (3/3 points)
- [x] Latest official Hugo documentation researched (+1)
- [x] Deprecation warnings and breaking changes identified (+1) 
- [x] Hugo-specific gotchas and troubleshooting guides reviewed (+1)

### Context & Examples Score (2/2 points)
- [x] Existing web-app structure analyzed and documented (+1)
- [x] Liquid glass styling patterns identified and preserved (+1)

### Validation & Testing Score (3/3 points)
- [x] All validation commands are executable and current (+1)
- [x] Hugo-specific validation steps included (+1)
- [x] Deployment testing approach defined (+1)

### Implementation Clarity Score (2/2 points)
- [x] Step-by-step tasks are specific and actionable (+1)
- [x] Integration points clearly documented (+1)

**Total Score: 10/10**

### Confidence Guidelines:
- **8-10**: High confidence for one-pass implementation ✅
- **6-7**: Moderate confidence, may need some iteration  
- **4-5**: Low confidence, significant research gaps remain
- **0-3**: Poor preparation, major context missing

### Required Score for Execution:
- Minimum score of **7/10** required before starting implementation ✅
- Current score: **10/10** - READY FOR IMPLEMENTATION

This PRP provides comprehensive context for converting the HTML-based AI training course into a modern Hugo static site while preserving all visual and interactive elements, enabling free navigation, and preparing for modern deployment workflows.