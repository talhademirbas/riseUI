/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_separator.dart`. */

export const separatorUsageCode = `Column(
  children: [
    Text('Intro copy'),
    SizedBox(height: 16),
    RiseSeparator(),
    SizedBox(height: 16),
    Row(
      children: [
        Text('Blog'),
        SizedBox(
          height: 24,
          child: RiseSeparator(orientation: RiseSeparatorOrientation.vertical),
        ),
        Text('Docs'),
      ],
    ),
  ],
)`;

export const separatorVerticalCode = `SizedBox(
  height: 48,
  child: Row(
    children: [
      Text('Left'),
      RiseSeparator(orientation: RiseSeparatorOrientation.vertical),
      Text('Right'),
    ],
  ),
)`;

export const separatorWithContentCode = `Column(
  children: [
    Text('Step title'),
    RiseSeparator(),
    SizedBox(height: 16),
    RiseLabeledSeparator(child: Text('OR')),
    Text('Next step'),
  ],
)`;

export const separatorVariantsCode = `RiseSeparator(tone: RiseSeparatorTone.default_)
RiseSeparator(tone: RiseSeparatorTone.secondary)
RiseSeparator(tone: RiseSeparatorTone.tertiary)`;

export const separatorWithSurfaceCode = `RiseSurface(
  variant: RiseSurfaceVariant.primary,
  child: Column(
    children: [
      Text('Heading'),
      RiseSeparator(),
      Text('Body'),
    ],
  ),
)`;
