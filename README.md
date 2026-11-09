# Axel Pröger — Personal Web

> Minimalist developer portfolio: *"Just a punk rock fan who builds websites in his spare time."*  
> Live at [axelproeger.de](https://axelproeger.de)

---

## 🛠️ Tech Stack

* **Frontend:** Vue 3 (Composition API, `<script setup lang="ts">`), TypeScript
* **Styling:** Tailwind CSS v4 (`@tailwindcss/vite`), Lucide Icons
* **Build Tool:** Vite 8
* **Typography:** Self-hosted Variable Fonts (`Space Grotesk` & `JetBrains Mono` in WOFF2) — 100% GDPR-compliant with zero external Google requests
* **Container & Ops:** Docker (Multi-stage, ~26.8 MB image size), Nginx Alpine, optimized for Coolify

---

## ✨ Features & Highlights

* **Hard Swiss / Raw Editorial Design:** Intentional typography, disciplined warm color palette (`#F8CC67`, `#201A1A`, `#dc2626`), and zero generic AI clichés.
* **Ultra-Lightweight & Fast:** Only ~29 KB JavaScript (gzipped), 0 external runtime dependencies or CDNs.
* **Privacy & GDPR First:** No trackers, no cookies, no third-party font calls.
* **SEO & Social Sharing:** Full OpenGraph & Twitter Cards metadata with absolute URLs, `robots.txt`, `sitemap.xml`, and canonical links.
* **Favicon Suite:** Multi-resolution `.ico`, high-DPI `.png`, and Apple Touch Icon generated from avatar.
* **Production Nginx:** Gzip compression, 1-year immutable caching for Vite assets, and hardened security headers (`nosniff`, `SAMEORIGIN`, etc.).

---

## 🚀 Development

```bash
# Install dependencies
npm install

# Start local dev server (Vite)
npm run dev

# Type check
npm run type-check

# Build for production
npm run build
```

---

## 🐳 Docker & Coolify Deployment

The application is preconfigured for direct deployment via Dockerfile on [Coolify](https://coolify.io):

```bash
# Build Docker image locally
docker build -t personal-web .

# Run container (port 80)
docker run -d -p 8080:80 personal-web
```

* **Coolify Build Pack:** `Dockerfile`
* **Exposed Port:** `80`
