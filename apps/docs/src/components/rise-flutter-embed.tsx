"use client";

type RiseFlutterEmbedProps = {
  /** Matches `?embed=` in the example Flutter web app (`example/lib/embed/docs_embed_page.dart`). */
  embed: string;
  /** Accessible name for the iframe. */
  title: string;
  /** Minimum height so the canvas has room before Flutter paints. */
  minHeight?: number;
  className?: string;
};

function buildFlutterEmbedSrc(embed: string): string {
  const origin = process.env.NEXT_PUBLIC_FLUTTER_EMBED_ORIGIN?.replace(/\/$/, "") ?? "";
  const params = new URLSearchParams({embed});
  if (origin) {
    return `${origin}/?${params.toString()}`;
  }
  const base = (process.env.NEXT_PUBLIC_DOCS_BASE_PATH ?? "").replace(/\/$/, "");
  return `${base}/flutter-previews/index.html?${params.toString()}`;
}

/**
 * Embeds the **real** RiseUI Flutter web build (same widgets as the example app)
 * inside the docs site. Production: static files under `{basePath}/flutter-previews/`
 * (see `scripts/build-flutter-docs-preview.sh`). Local dev: set
 * `NEXT_PUBLIC_FLUTTER_EMBED_ORIGIN` to the Flutter dev server origin, e.g.
 * `http://localhost:57567`.
 */
export function RiseFlutterEmbed({embed, title, minHeight = 360, className}: RiseFlutterEmbedProps) {
  const src = buildFlutterEmbedSrc(embed);

  return (
    <iframe
      title={title}
      src={src}
      className={className}
      style={{width: "100%", minHeight, border: 0, display: "block"}}
      loading="lazy"
      referrerPolicy="same-origin"
    />
  );
}
