/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_scroll_shadow.dart`. */

export const scrollShadowUsageCode = `SizedBox(
  height: 240,
  child: RiseScrollShadow(
    child: ListView(
      padding: EdgeInsets.all(16),
      children: [
        // … lorem paragraphs
      ],
    ),
  ),
)`;

export const scrollShadowVariantsCode = `Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text('Fade (opacity effect)'),
    SizedBox(
      height: 240,
      child: RiseScrollShadow(
        effect: RiseScrollShadowEffect.fade,
        child: listView,
      ),
    ),
    Text('Blur (blur effect)'),
    SizedBox(
      height: 240,
      child: RiseScrollShadow(
        effect: RiseScrollShadowEffect.blur,
        child: listView,
      ),
    ),
  ],
)`;

export const scrollShadowOrientationCode = `Column(
  children: [
    RiseSurface(
      child: SizedBox(
        height: 240,
        child: RiseScrollShadow(child: verticalList),
      ),
    ),
    SizedBox(
      height: 112,
      child: RiseScrollShadow(
        axis: Axis.horizontal,
        child: horizontalImageCards,
      ),
    ),
  ],
)`;

export const scrollShadowHideScrollbarCode = `SizedBox(
  height: 240,
  child: RiseScrollShadow(
    hideScrollBar: true,
    child: ListView(...),
  ),
)`;

export const scrollShadowCustomSizeCode = `SizedBox(
  height: 200,
  child: RiseScrollShadow(
    size: 40,
    child: ListView(...),
  ),
)`;

export const scrollShadowVisibilityStateCode = `RiseScrollShadow(
  onVisibilityChange: (v) => setState(() => _vertical = v),
  child: ListView(...),
)`;

export const scrollShadowWithCardCode = `SizedBox(
  height: 300,
  child: RiseScrollShadow(
    size: 80,
    child: ListView(...),
  ),
)`;
