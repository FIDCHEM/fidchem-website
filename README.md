# FIDCHEM Website

**fidchem.com** — Advanced Water Purification Technologies

Static site built with [Hugo](https://gohugo.io/), deployed to [Cloudflare Pages](https://pages.cloudflare.com/).

---

## Quick Start for Editors

**To update any text on the site:**
1. Find the file in `content/en/` (or `content/es/` for Spanish)
2. Click the pencil icon ✏️ to edit
3. Save → site updates in ~45 seconds

📖 Full guide: [SITE-GUIDE.md](./SITE-GUIDE.md)  
🤖 AI assistant instructions: [CLAUDE.md](./CLAUDE.md)

---

## Tech Stack

| Layer | Tool | Cost |
|---|---|---|
| Generator | Hugo | Free |
| Hosting | Cloudflare Pages | Free |
| CDN + SSL | Cloudflare | Free |
| Domain | fidchem.com | ~€12/year |
| CI/CD | GitHub Actions | Free |

## Languages

- 🇬🇧 English: `/` (primary)  
- 🇪🇸 Spanish: `/es/`

## Local Development (for developers)

```bash
# Install Hugo: https://gohugo.io/installation/
git clone https://github.com/YOUR_USERNAME/fidchem-website
cd fidchem-website
hugo server -D
# Open http://localhost:1313
```

## Deploy

Push to `main` branch → GitHub Action builds with Hugo → deploys to Cloudflare Pages automatically.
