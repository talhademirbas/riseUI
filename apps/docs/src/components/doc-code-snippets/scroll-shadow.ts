/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_scroll_shadow.dart`. */

export const scrollShadowUsageCode = `SizedBox(
  height: 220,
  child: RiseScrollShadow(
    child: ListView(
      children: [
        // ... paragraphs
      ],
    ),
  ),
)`;

export const scrollShadowHorizontalCode = `SizedBox(
  height: 132,
  child: RiseScrollShadow(
    axis: Axis.horizontal,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        // ... cards
      ],
    ),
  ),
)`;

export const scrollShadowHideScrollbarCode = `SizedBox(
  height: 220,
  child: RiseScrollShadow(
    hideScrollBar: true,
    child: ListView(...),
  ),
)`;

export const scrollShadowCustomSizeCode = `SizedBox(
  height: 220,
  child: RiseScrollShadow(
    size: 72,
    child: ListView(...),
  ),
)`;

export const scrollShadowVisibilityStateCode = `RiseScrollShadow(
  onVisibilityChange: (v) => setState(() => _reported = v.name),
  child: ListView(...),
)`;

export const scrollShadowWithCardCode = `RiseSurface(
  variant: RiseSurfaceVariant.secondary,
  child: Column(
    children: [
      Text('Terms and conditions'),
      SizedBox(
        height: 180,
        child: RiseScrollShadow(child: ListView(...)),
      ),
      Row(children: [TextButton(...), FilledButton(...)]),
    ],
  ),
)`;
