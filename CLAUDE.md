# CLAUDE.md — AI Instructions for FIDCHEM Website

This file tells AI assistants (Claude, GPT, Gemini, etc.) how this project works,
so they can help maintain and update the site correctly.

---

## Project Overview

**Site:** fidchem.com  
**Type:** Hugo static site (no database, no server-side code)  
**Hosting:** Cloudflare Pages (auto-deploys from GitHub main branch)  
**Languages:** English (primary), Spanish  
**Owner:** FIDCHEM — water purification technology company  

---

## Directory Structure

```
fidchem/
├── hugo.toml                    ← Site config: title, languages, contact info
├── content/
│   ├── en/                      ← English content
│   │   ├── _index.md            ← Homepage hero text
│   │   ├── technologies/        ← One .md file per technology
│   │   │   ├── pcdr.md
│   │   │   ├── pcdo.md
│   │   │   ├── pcds.md
│   │   │   └── gloio.md
│   │   └── contacts.md
│   └── es/                      ← Spanish content (mirrors en/)
├── layouts/
│   ├── index.html               ← Homepage template
│   ├── _default/
│   │   ├── baseof.html          ← Master HTML wrapper (head, nav, footer)
│   │   └── single.html          ← Technology detail page template
│   └── partials/
│       ├── nav.html             ← Navigation bar
│       ├── footer.html          ← Footer
│       └── ai-consultant.html   ← AI chat section
├── static/
│   ├── css/main.css             ← ALL styles (edit here for design changes)
│   └── js/main.js               ← JavaScript (nav, chat widget)
└── .github/workflows/deploy.yml ← Auto-deploy on push to main
```

---

## How to Make Common Changes

### Update contact info (phone, email, location)
Edit `hugo.toml`, section `[params]`:
```toml
[params]
  whatsapp = "34600934899"
  email = "info@fidchem.com"
  location = "Tarragona, Spain"
```

### Update homepage text
Edit `content/en/_index.md` for English.  
Edit `content/es/_index.md` for Spanish.

### Update a technology description
Edit the relevant file in `content/en/technologies/`.  
For Spanish, edit the same file in `content/es/technologies/`.

The front matter fields at the top of each file:
- `title` — page title
- `code` — short code shown in big letters (PCDR, PCDO, etc.)
- `fullname` — full technology name
- `weight` — display order (1=first, 4=last)
- `summary` — one-sentence description used on homepage cards
- `contaminants` — list of pollutants this technology removes
- `applications` — list of industries/applications

### Change site colors
Edit `static/css/main.css`, section `:root` at the very top:
```css
:root {
  --ink:    #0d1117;   /* main dark color */
  --paper:  #f4f1eb;   /* background */
  --accent: #00a878;   /* green accent */
  --plasma: #3a86ff;   /* blue plasma color */
}
```

### Add a new page
1. Create a new `.md` file in `content/en/`
2. Add front matter: `title`, `description`, `layout`
3. Write content in Markdown below the `---`
4. Add to navigation in `hugo.toml` under `[[menu.main]]`

### Replace the AI chat widget
1. Get the embed code from your AI service provider
2. Open `layouts/partials/ai-consultant.html`
3. Find the comment block that says `AI CONSULTANT WIDGET`
4. Replace the comment with your embed `<script>` or `<iframe>` code

---

## Deployment

**Every push to `main` branch automatically deploys the site.**

There is no build step needed manually. The GitHub Action in
`.github/workflows/deploy.yml` runs Hugo and pushes to Cloudflare Pages.

Typical deploy time: 30–60 seconds after a commit.

---

## Languages

The site uses Hugo's built-in multilingual system.
- English content: `content/en/`
- Spanish content: `content/es/`
- Language switcher is in the nav bar (EN / ES)
- URL structure: `/` = English, `/es/` = Spanish

When adding new content, always create files in both `en/` and `es/` folders.
If a Spanish translation is not ready, you can copy the English file temporarily.

---

## What NOT to Change

- Do not modify `layouts/_default/baseof.html` unless you know Hugo templating
- Do not delete `.github/workflows/deploy.yml` — this is what makes auto-deploy work
- Do not add large binary files to the repository (images should be optimized, max 500KB each)
- Do not commit API keys or secrets — use GitHub Secrets for sensitive values

---

## Key Technologies Used

- **Hugo** — static site generator (https://gohugo.io)
- **Cloudflare Pages** — hosting and CDN
- **GitHub** — version control and CI/CD trigger
- **Space Mono + DM Sans** — fonts (loaded from Google Fonts)
- No JavaScript frameworks — vanilla JS only
- No npm, no Node.js required to edit content

---

## Getting Help

If something breaks or you're unsure:
1. Check the Hugo documentation: https://gohugo.io/documentation/
2. Check Cloudflare Pages docs: https://developers.cloudflare.com/pages/
3. Ask Claude: paste this file + describe what you want to change
