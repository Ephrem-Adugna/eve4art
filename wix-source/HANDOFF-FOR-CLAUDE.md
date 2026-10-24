# Task: remake eve4art.com from its real Wix source

You are working in the eve4art-clone Astro project. It is currently a PLACEHOLDER rebuild (invented name "Your Studio", fake SVG images, fake story and contact info in src/data/site.json). Replace all of that with the real content of the live Wix site below. Do not invent any text, names, captions, or contact details.

## Step 1: download the source first

Run: `bash wix-source/download-source.sh`

That fetches, from https://www.eve4art.com :
- Raw HTML for all 8 published pages into wix-source/pages/ (this is exactly what Wix serves; Wix offers no code export, so this HTML plus its images are the source of truth)
- Every original full-resolution image (27 site-owner images on static.wixstatic.com, filenames start with 0f0c73_) into wix-source/assets-images/ and copied into public/images/

Parse each page's HTML yourself for exact per-page text, image order, alt text, and form fields. The summary below is verified from that same HTML, use it to check your work.

## The site (verified facts)

- Name: eve4art
- Home page title: "eve4art Handmade Art and Fashion"
- Meta description: "Creative Home, Art and Fashion Designs by eve4art"
- Repeated header word / ticker: INTERIORS
- Footer line, verbatim: "Copyright 2022, No animals were harmed in the making"
- Fonts on Wix: Arial / Helvetica sans-serif throughout (headings bold, largest heading about 41px)
- Wix theme colors extracted from the page CSS: white #FFFFFF, near-black #1A1A1A, dark teal #3E5D5E, tan #C6B695, brown #663A14, dark brown #533913, gold #A67327, amber #F9AD3B and #FBB03B, grays #565656, #999797, #D4D3D3. Body background in the Wix CSS is #5F6360. Match the look of the live site, sample the downloaded pages and images rather than guessing.

## Pages (nav label: Wix URL -> new route in this project)

- HOME: https://www.eve4art.com/ -> /
- GALLERY: https://www.eve4art.com/gallery -> /gallery (landing page, mostly imagery, no body text on Wix)
- ART: https://www.eve4art.com/gallery-l -> /art (gallery, 9 artwork images, no captions on Wix, click to zoom, Wix label says "press to zoom")
- FASHION: https://www.eve4art.com/gallery-ll -> /fashion (gallery, captions below)
- DECOR: https://www.eve4art.com/gallery-lll -> /decor (gallery, captions below)
- STORY: https://www.eve4art.com/the_story -> /story (Wix page title is "Bio", on-page heading is "THE STORY")
- BLOG: https://www.eve4art.com/blank -> /blog (yes, the Wix slug is blank, and the page itself is essentially empty apart from header and footer)
- CONTACT: https://www.eve4art.com/contact -> /contact

Old Wix URLs should keep redirecting to the new routes (astro.config.mjs already sets this up, verify it covers all 8).

## Real content (verbatim from the live site)

### Story page
Heading: THE STORY
Body, verbatim: "Hi. Thank you for stopping by! My name is eve and for, as long as I can remember, I have loved fashion design and making things with my hands. I studied fashion design, and costuming for motion picture, television and stage. My designs have been worn on stage by Stevie Wonder, Anita Baker, Denise Williams and others. My quilts and mix-media art are sold and exhibited in galleries. I love to sing, entertain, travel, parties, dancing, gallery openings, fashion shows, concerts, live theater, thrift stores, helping others, the beach, teaching free sewing & art workshops for inner-city youth and children, the beach and Family gatherings! This creative space allows me to share with you my passion for fashion, decorating, interior design, textiles and making art. I hope this creative space is an inspiration to you!"

### Contact page
Heading: "Let's Talk."
Address lines: "P.O. Box 451935" and "Los Angeles, Ca 90045."
It has a contact form (check wix-source/pages/contact.html for the exact fields and placeholders). On submit the Wix form shows: "Success! Message received." and the button says "Send". Keep the existing Netlify/Formspree form handling in this project, just use the real heading, address, button text, and success text. No email address is published on the Wix contact page, do not invent one.

### Fashion gallery captions (from alt text, in page order)
- "Hand made Assorted Scarf's"
- "Hand bejeweled heels" (3 different heel images share this caption)
- "Hand made clutches"

### Decor gallery captions
- "Handmade Quilt", with detail: 72" X 45"
- The other decor images have no captions on Wix, leave them blank.

### Social links (header/footer on every Wix page)
- Pinterest: http://pinterest.com/eve4art2/
- Etsy: http://www.etsy.com/shop/eve4art
- Blog: http://eve4art.blogspot.com/
- Facebook: http://www.Facebook.com/eve4art
- Polyvore: http://eveart.polyvore.com/ (dead service; the Wix site still links it, keep or drop it but note your choice in your summary)
Use text links or simple inline icons. The Wix social icon images are Wix stock files, do not hotlink them.

## What to do

1. Run the download script (Step 1) and confirm all 8 HTML files and 27 images landed. Report any that failed.
2. Rewrite src/data/site.json with the real name, tagline, nav, footer, story, and contact info above, and point home features and galleries at the real downloaded images in public/images/ (map images to pages using the per-page HTML in wix-source/pages/, in the order they appear there).
3. Delete or stop referencing the placeholder SVG images and all placeholder text ("Your Studio", "Replace this with your own story", the fake P.O. Box, hello@example.com, none of that may remain anywhere).
4. Keep the existing Astro structure, gallery lightbox (zoom on click, like Wix's "press to zoom"), and deployment setup. Match the Wix layout and colors as closely as the source allows.
5. Run `npm run build`, fix any errors, and finish with a short summary: pages rebuilt, image count used per gallery, anything from the Wix site you could not reproduce, and why.
