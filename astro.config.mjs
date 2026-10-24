import { defineConfig } from "astro/config";

// GitHub Actions sets this so the project site is served at /eve4art.
// Local dev and other hosts stay at the domain root.
const pages = process.env.GITHUB_PAGES === "true";
const base = pages ? "/eve4art" : "";

export default defineConfig({
  site: pages ? "https://ephrem-adugna.github.io" : "https://www.eve4art.com",
  base: pages ? "/eve4art" : "/",
  // Keep the original Wix URLs working after migration.
  // Targets include the Pages base because Astro does not prefix redirect URLs.
  redirects: {
    "/gallery-l": `${base}/art`,
    "/gallery-ll": `${base}/fashion`,
    "/gallery-lll": `${base}/decor`,
    "/the_story": `${base}/story`,
    "/blank": `${base}/blog`,
  },
});
