import path from "node:path";
import {fileURLToPath} from "node:url";

import type {NextConfig} from "next";
import {createMDX} from "fumadocs-mdx/next";

const docsAppRoot = path.dirname(fileURLToPath(import.meta.url));
/** Monorepo root (…/riseUI) where workspace node_modules lives */
const workspaceRoot = path.join(docsAppRoot, "../..");

const withMDX = createMDX();

const nextConfig: NextConfig = {
  reactStrictMode: true,
  /** Standalone deploy + same path when proxied from www.risition.com (see risitionWeb rewrites). */
  basePath: "/riseui/docs",
  transpilePackages: ["fumadocs-ui", "fumadocs-core"],
  turbopack: {
    root: workspaceRoot,
  },
};

export default withMDX(nextConfig);
