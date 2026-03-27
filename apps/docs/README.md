# RiseUI documentation (`@rise-ui/docs`)

HeroUI-style **`apps/docs`** package: Next.js + [Fumadocs](https://fumadocs.dev) + MDX.

## URLs

- **Standalone** (this package): `http://localhost:4000/rise_ui/docs` (`npm run dev` from `apps/docs`).
- **Embedded in [Risition](https://www.risition.com)**: same path on the main site — `https://www.risition.com/rise_ui/docs` — wired via `file:../riseUI/apps/docs` in `risitionWeb`.

## Scripts

From the **monorepo root** (`riseUI/`):

```bash
npm install
npm run dev:docs
```

Or from this folder:

```bash
npm run dev
```

After editing MDX under `content/docs/`, run `npx fumadocs-mdx` if needed (also runs on `postinstall`).

## Content

Author pages in `content/docs/` (see `meta.json` files for navigation).
