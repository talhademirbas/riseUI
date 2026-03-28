# RiseUI documentation (`@rise-ui/docs`)

Next.js + [Fumadocs](https://fumadocs.dev) + MDX.

## Public URL (what visitors use)

Live docs on the main site: **`https://www.risition.com/riseui/docs/`** (same path on `risition.com` if that is your apex). There is **no** `/apps` segment in the URL — `apps/docs` below is only **where this package lives inside the Git repo**.

- **Local:** `http://localhost:4000/riseui/docs` (`npm run dev` from this folder). Uses `basePath: '/riseui/docs'`.
- **Production:** **risitionWeb** proxies `www.risition.com/riseui/docs/...` to the Vercel deployment of this app (`RISEUI_DOCS_URL`). Pushing **this** repo redeploys docs only; you do not redeploy risitionWeb for content-only changes.

## Deploy (Vercel, public `riseUI` repo)

This folder includes **`vercel.json`**: install and build run from the **monorepo root** (`npm install` + `npm run build --workspace=@rise-ui/docs`) so Turborepo detection does not run the wrong build.

1. Create a Vercel project connected to this repository.
2. Set **Root Directory** to the folder that contains this `package.json` (in this monorepo that is `apps/docs` — a filesystem path only; it does not affect the public URL).
3. Deploy. Note the project URL with path, e.g. `https://<project>.vercel.app/riseui/docs`.
4. On the **risitionWeb** Vercel project, set **`RISEUI_DOCS_URL`** to that full URL (must end with `/riseui/docs`).

Optional: custom domain on the docs project is fine; still use the full `.../riseui/docs` origin in `RISEUI_DOCS_URL`.

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
