import defaultMdxComponents from "fumadocs-ui/mdx";
import type {MDXComponents} from "mdx/types";

import {RiseAlternative, RiseAlternatives} from "./components/rise-alternatives";
import {RisePreviewWithCode} from "./components/rise-preview-with-code";
import {RiseComponentShowcaseDoc} from "./components/rise-component-showcase-doc";

export function getMDXComponents(components?: MDXComponents): MDXComponents {
  return {
    ...defaultMdxComponents,
    RisePreviewWithCode,
    RiseAlternatives,
    RiseAlternative,
    RiseComponentShowcaseDoc,
    ...components,
  };
}

/** Required by fumadocs-mdx generated MDX bundles. */
export function useMDXComponents(): MDXComponents {
  return getMDXComponents();
}
