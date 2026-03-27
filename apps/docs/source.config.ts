import {rehypeCodeDefaultOptions} from "fumadocs-core/mdx-plugins";
import {defineConfig, defineDocs} from "fumadocs-mdx/config";

export const docs = defineDocs({
  dir: "content/docs",
});

export default defineConfig({
  mdxOptions: {
    /** Must resolve from consumers (e.g. risitionWeb) via package exports */
    providerImportSource: "@rise-ui/docs/mdx-components",
    rehypeCodeOptions: {
      ...rehypeCodeDefaultOptions,
    },
  },
});
