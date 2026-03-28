import path from "node:path";
import {fileURLToPath} from "node:url";

import type {NextConfig} from "next";
import {createMDX} from "fumadocs-mdx/next";

const docsAppRoot = path.dirname(fileURLToPath(import.meta.url));
/** Monorepo root (…/riseUI) where workspace node_modules lives */
const workspaceRoot = path.join(docsAppRoot, "../..");

const withMDX = createMDX({
  configPath: path.join(docsAppRoot, "source.config.ts"),
  outDir: path.join(docsAppRoot, ".source"),
});

/** Must match `rise-flutter-embed` + `scripts/build-flutter-docs-preview.sh` (`--base-href`). */
const docsBasePath = "/riseui/docs";

const nextConfig: NextConfig = {
  reactStrictMode: true,
  /** Standalone deploy + same path when proxied from www.risition.com (see risitionWeb rewrites). */
  basePath: docsBasePath,
  env: {
    NEXT_PUBLIC_DOCS_BASE_PATH: docsBasePath,
  },
  transpilePackages: ["fumadocs-ui", "fumadocs-core"],
  turbopack: {
    root: workspaceRoot,
  },
};

export default withMDX(nextConfig);
