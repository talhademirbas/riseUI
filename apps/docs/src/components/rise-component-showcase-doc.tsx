"use client";

import showcaseManifest from "../data/showcase-manifest.json";
import {RiseFlutterEmbed} from "./rise-flutter-embed";
import {RisePreviewWithCode} from "./rise-preview-with-code";
import {showcaseCodeByComponent} from "./showcase-code-maps";

type Variant = {
  slug: string;
  sectionTitle: string;
  subtitle?: string | null;
  minHeight: number;
  embed: string;
};

type Component = {
  id: string;
  title: string;
  description: string;
  variants: Variant[];
};

type Manifest = {
  version: number;
  generated?: string;
  components: Component[];
};

const manifest = showcaseManifest as Manifest;

const embedClass = "w-full max-w-md rounded-lg";

/**
 * Usage variants only (preview + code). **Title** and **description** come from MDX frontmatter / doc layout.
 * Variant copy stays in [showcase-manifest.json] (generated from Dart public config).
 */
export function RiseComponentShowcaseDoc({componentId}: {componentId: string}) {
  const c = manifest.components.find((x) => x.id === componentId);
  if (!c) {
    return <p className="text-fd-muted-foreground">Unknown component showcase: {componentId}</p>;
  }
  const codes = showcaseCodeByComponent[componentId];
  if (!codes) {
    return <p className="text-fd-muted-foreground">No showcase code map for: {componentId}</p>;
  }
  return (
    <>
      {c.variants.map((v) => {
        const code = codes[v.slug];
        return (
          <div key={v.embed} className="my-8 first:mt-0">
            <h3 className="text-fd-foreground text-lg font-semibold tracking-tight">{v.sectionTitle}</h3>
            {v.subtitle ? (
              <p className="text-fd-muted-foreground mt-2 max-w-3xl text-sm leading-relaxed">{v.subtitle}</p>
            ) : null}
            <div className="mt-4">
              <RisePreviewWithCode code={code ?? `// Missing code for slug "${v.slug}" in showcase-code-maps.ts`}>
                <RiseFlutterEmbed embed={v.embed} title={`${c.title} — ${v.slug}`} minHeight={v.minHeight} className={embedClass} />
              </RisePreviewWithCode>
            </div>
          </div>
        );
      })}
    </>
  );
}
