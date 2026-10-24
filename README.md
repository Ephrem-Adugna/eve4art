# eve4art

Static Astro rebuild of the live Wix site [eve4art.com](https://www.eve4art.com). Pages: Home, Gallery, Art, Fashion, Decor, Story, Blog, and Contact. Gallery images open in a click-to-zoom lightbox.

## Run locally

```bash
npm install
npm run dev        # http://localhost:4321
```

## Content

Copy, navigation, captions, and image paths live in `src/data/site.json`. The story, captions, and contact address are the live site text.

Web images are in `public/images/` (JPEG photos resized to a max width of 1600px). The untouched full-resolution downloads stay in `wix-source/assets-images/`.

`/blog` matches the live Wix page at `/blank`: header and footer only, no posts.

## Deploy

GitHub Pages publishes this repo from `.github/workflows/pages.yml` on every push to `main`. The live site is [https://ephrem-adugna.github.io/eve4art/](https://ephrem-adugna.github.io/eve4art/). That build sets `GITHUB_PAGES=true`, which serves the site from `/eve4art`. Local `npm run dev` stays at the domain root.

| Host | How |
|---|---|
| **GitHub Pages** | Push to `main`. The workflow builds and deploys `dist`. |
| **Netlify** (the contact form works with no extra setup) | Import the project. `netlify.toml` is already configured. Do not set `GITHUB_PAGES`. |
| **Vercel** | Import the repo; it auto-detects Astro. Set `contact.formAction` to a Formspree endpoint. |

Leave `contact.formAction` empty to use Netlify Forms. On GitHub Pages there is no form backend, so set `contact.formAction` to a [Formspree](https://formspree.io) URL if the form should deliver messages. The button says "Send" and the success line is "Success! Message received."

These old Wix paths redirect:

| Old | New |
|---|---|
| `/gallery-l` | `/art` |
| `/gallery-ll` | `/fashion` |
| `/gallery-lll` | `/decor` |
| `/the_story` | `/story` |
| `/blank` | `/blog` |
