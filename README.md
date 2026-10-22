# Glyn Simpson — personal page

The home page for www.smurfworks.com: a single static page about Glyn Simpson (SmurfWorks), shown by default in a Creative view styled as an old medicine book, with a toolbar that switches to a Modern view. Link to `/#modern` to open the modern view first.

## Layout

- `src/` holds the page. Edit `src/index.html`.
- `docs/` is the built site that GitHub Pages serves. Don't edit it by hand; it is rebuilt on every commit.

## Build

```bash
npm install
```

This installs the git hooks (there are no dependencies). After that, every commit runs `npm run build`, which copies `src/` into a fresh `docs/` (adding `.nojekyll`) and stages `docs/` into the commit.

The social share image (`src/assets/og-image.jpg`) and touch icon are rendered with Google Chrome from the designs in `scripts/images/`. After changing a design or the portrait, re-render them:

```bash
npm run images
```

Page titles, descriptions and Open Graph tags point at `https://www.smurfworks.com/`; change them in `src/index.html` (and `src/robots.txt`, `src/sitemap.xml`) if the site moves.

To build by hand:

```bash
npm run build
```

## GitHub Pages

In the repository's settings on GitHub, under Pages, publish from the `main` branch and the `/docs` folder.
