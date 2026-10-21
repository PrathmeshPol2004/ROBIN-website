# ROBIN — Official Community Website

> **BUILD TOGETHER.**  
> *A place for students who'd rather build than just learn.*  
> **Location:** Initially focused on Pune, Maharashtra, India.  
> **Brand Thesis:** *Same students. Bigger opportunities.*  
> **Instagram:** [@robin.community](https://www.instagram.com/robin.community/)

---

## 1. Overview & Purpose

This is the production-ready official website for **ROBIN**, an authentic student-builder community founded in Pune, Maharashtra.

The website is engineered to:
1. Clearly communicate what ROBIN is and what it stands for.
2. Outline the 5-stage student builder journey (Learn &rarr; Collaborate &rarr; Build &rarr; Document &rarr; Grow).
3. Showcase real student projects with an honest empty state (strictly zero fake testimonials or invented case studies).
4. Encourage driven students in Pune to join the builder cohorts.
5. Provide a trustworthy, transparent digital home for collaborators, campus clubs, and partners.

---

## 2. Visual Identity & Brand Compliance

The design follows the official ROBIN brand guide:

| Token | Value | Role |
|---|---|---|
| **Charcoal** | `#202020` | Headings, primary text, prominent borders, high-contrast badges |
| **Clay Brown** | `#A69684` | Primary brand accent, button backgrounds, 'TOGETHER' highlight |
| **Warm Ivory** | `#F7F4ED` | Main background surface, minimal editorial warmth |
| **Soft Grey** | `#D9D6CF` | Fine dividers, card borders, secondary metadata |
| **White** | `#FFFFFF` | Project cards, highlight callouts |

- **Typography**: 
  - Headings: `Space Grotesk` (Bold / Semibold)
  - Body: `Inter` (Regular / Medium)
  - Editorial Annotations: `Caveat` handwriting accents
- **Logo**: Exact mathematical vectorization of the official ROBIN symbol (`assets/images/robin-horizontal.svg`, `robin-logo.svg`, `robin-icon.svg`, and `favicon.svg`).

---

## 3. Project Structure

```
robin-website/
├── index.html                  # Main semantic HTML5 application
├── 404.html                    # Brand-compliant 404 fallback page
├── robots.txt                  # Search engine crawler instructions
├── sitemap.xml                 # XML sitemap with canonical URLs
├── preview-server.ps1          # One-click Windows PowerShell local server (port 3000)
├── server.js                   # Cross-platform Node.js preview server
├── README.md                   # This documentation guide
├── css/
│   ├── variables.css           # Color tokens, typography, spacing, radii
│   ├── base.css                # Semantic layout, typography hierarchy, reset
│   ├── components.css          # Navigation, buttons, cards, timeline, empty state, footer
│   └── responsive.css          # Breakpoints for mobile (< 640px), tablet, and desktop
├── js/
│   ├── config.js               # Central configuration (all links, social handles, email)
│   ├── projects.js             # Real student projects data array and status definitions
│   └── main.js                 # App initialization, mobile menu, dynamic rendering
└── assets/
    ├── icons/                  # Custom SVGs (community, learning, building, growth, collab)
    └── images/
        ├── robin-horizontal.svg# Horizontal logo for header & footer
        ├── robin-logo.svg      # Primary vertical brand lockup
        ├── robin-icon.svg      # Standalone vector icon
        ├── favicon.svg         # SVG favicon for modern browsers
        ├── favicon.png         # PNG fallback favicon
        ├── og-image.png        # Social share card (1200x630)
        ├── pune-skyline.png    # Authentic student builders overlooking Pune skyline
        └── laptop-sticker.png  # Workspace laptop with ROBIN branding
```

---

## 4. How to Run Locally

### Option A: Windows PowerShell (Zero Install Needed)
Double-click `preview-server.ps1` or run in PowerShell:
```powershell
powershell -ExecutionPolicy Bypass -File .\preview-server.ps1
```
This starts a local HTTP server at `http://localhost:3000` and automatically opens your browser.

### Option B: Node.js (If Installed or using Antigravity)
```bash
node server.js
```
Or with Antigravity Node:
```powershell
& "$env:APPDATA\Antigravity\bin\agy-node.cmd" server.js
```

### Option C: VS Code Live Server
Right-click `index.html` and click **"Open with Live Server"**.

---

## 5. Maintenance & Founder Customizations

All editable community details are located in two clean files:

### A. Updating Community Links & Handles (`js/config.js`)
To update the Discord invite URL, email, or WhatsApp link, edit `js/config.js`:
```javascript
export const CONFIG = {
  urls: {
    instagram: "https://www.instagram.com/robin.community/",
    discord: "https://discord.gg/YOUR_REAL_CODE", // Replace placeholder here
    isDiscordPlaceholder: false,                   // Set to false when link is live!
    github: "https://github.com/your-org",
    isGithubPlaceholder: false,
    whatsapp: "https://chat.whatsapp.com/YOUR_GROUP",
    isWhatsappPlaceholder: false,
    email: "founders@yourdomain.in"
  }
};
```
When `isDiscordPlaceholder: false` is set, clicking the Discord button directly redirects users to your server instead of opening the configuration notice modal.

### B. Adding Shipped Student Projects (`js/projects.js`)
When students in your cohort ship a verified project, add an entry to the `PROJECTS` array in `js/projects.js`:
```javascript
export const PROJECTS = [
  {
    id: "pune-bus-tracker",
    name: "Pune Transit Pulse",
    tagline: "Live PMPML bus route tracking with crowd-sourced crowd estimates.",
    problem: "Pune college commuters struggle with unpredictable bus timings.",
    built: "A responsive progressive web app integrating open GTFS timetable feeds.",
    contributors: [
      { name: "Rahul Sharma", role: "Backend", college: "COEP Pune" },
      { name: "Pooja Kulkarni", role: "UI Design", college: "MIT Pune" }
    ],
    technologies: ["React", "FastAPI", "TailwindCSS"],
    status: "In Progress", // "In Progress" | "Alpha Testing" | "Shipped" | "Open for Contributors"
    demoUrl: "https://demo.punetransit.in",
    githubUrl: "https://github.com/robin-community/pune-transit",
    featured: true
  }
];
```
If `PROJECTS` is empty (`[]`), the website automatically renders the honest empty state inviting students to submit the first project.

---

## 6. How to Deploy for Free

Because this website uses lightweight semantic HTML, CSS, and vanilla ES modules without build-tool dependencies, you can deploy it in 60 seconds on any free static hosting platform:

### 1. GitHub Pages (Recommended for student clubs)
1. Initialize a git repository and commit all files:
   ```bash
   git init
   git add .
   git commit -m "Initial release of ROBIN website"
   ```
2. Create a repository on GitHub (e.g. `robin-community/website`).
3. Push to `main`:
   ```bash
   git remote add origin https://github.com/robin-community/website.git
   git push -u origin main
   ```
4. In GitHub repository settings, go to **Pages** &rarr; under **Branch**, select `main` and `/ (root)` &rarr; click **Save**.
5. Your website is live at `https://robin-community.github.io/website/` or your custom domain!

### 2. Vercel (1-Click)
1. Install Vercel CLI (`npm i -g vercel`) or go to [vercel.com/new](https://vercel.com/new).
2. Import your GitHub repository.
3. Framework Preset: **Other** (leave Root Directory as `./`).
4. Click **Deploy**. Vercel will assign a free SSL-secured `*.vercel.app` domain.

### 3. Cloudflare Pages or Netlify
Drag and drop the `robin-website/` directory into the Netlify/Cloudflare dashboard, and it goes live instantly with global CDN caching.

---

## 7. Community License & Attribution

Designed and engineered with pride for student builders in Pune, Maharashtra, India.  
Copyright &copy; 2026 ROBIN Community.
