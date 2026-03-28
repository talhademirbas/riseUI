/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_chip.dart`. */

export const chipUsageCode = `const Row(
  children: [
    RiseChip(
      color: RiseChipColor.accent,
      variant: RiseChipVariant.secondary,
      child: Text('Label'),
    ),
  ],
)`;

export const chipSizesCode = `Wrap(
  spacing: 12,
  children: [
    RiseChip(
      color: RiseChipColor.accent,
      variant: RiseChipVariant.secondary,
      size: RiseChipSize.sm,
      child: Text('Small'),
    ),
    RiseChip(
      color: RiseChipColor.accent,
      variant: RiseChipVariant.secondary,
      size: RiseChipSize.md,
      child: Text('Medium'),
    ),
    RiseChip(
      color: RiseChipColor.accent,
      variant: RiseChipVariant.secondary,
      size: RiseChipSize.lg,
      child: Text('Large'),
    ),
  ],
)`;

export const chipWithIconsCode = `RiseChip(
  color: RiseChipColor.accent,
  variant: RiseChipVariant.secondary,
  leading: Icon(Icons.circle_outlined, size: 14),
  trailing: Icon(Icons.circle_outlined, size: 14),
  child: Text('Label'),
)`;

export const chipStatusesCode = `Wrap(
  spacing: 12,
  children: [
    RiseChip(
      variant: RiseChipVariant.primary,
      color: RiseChipColor.default_,
      leading: Icon(Icons.circle, size: 6),
      child: Text('Information'),
    ),
    RiseChip(
      variant: RiseChipVariant.primary,
      color: RiseChipColor.success,
      leading: Icon(Icons.circle, size: 6),
      child: Text('Completed'),
    ),
  ],
)`;

export const chipVariantsCode = `// lg / md / sm × primary|secondary|tertiary|soft × five colors
RiseChip(
  color: RiseChipColor.accent,
  variant: RiseChipVariant.secondary,
  size: RiseChipSize.md,
  leading: Icon(Icons.circle_outlined, size: 14),
  trailing: Icon(Icons.circle_outlined, size: 14),
  child: Text('Label'),
)`;
