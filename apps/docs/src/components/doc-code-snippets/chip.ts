/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_chip.dart`. */

export const chipUsageCode = `Wrap(
  spacing: 12,
  runSpacing: 12,
  children: [
    RiseChip(
      variant: RiseChipVariant.soft,
      color: RiseChipColor.default_,
      child: Text('Default'),
    ),
    RiseChip(
      variant: RiseChipVariant.soft,
      color: RiseChipColor.accent,
      child: Text('Accent'),
    ),
    RiseChip(
      variant: RiseChipVariant.soft,
      color: RiseChipColor.success,
      child: Text('Success'),
    ),
    RiseChip(
      variant: RiseChipVariant.soft,
      color: RiseChipColor.warning,
      child: Text('Warning'),
    ),
    RiseChip(
      variant: RiseChipVariant.soft,
      color: RiseChipColor.danger,
      child: Text('Danger'),
    ),
  ],
)`;

export const chipVariantsCode = `// For each variant (primary, secondary, tertiary, soft), one Wrap with
// five chips — colors: default_, accent, success, warning, danger; size md.
Wrap(
  spacing: 8,
  runSpacing: 8,
  children: [
    RiseChip(
      variant: RiseChipVariant.primary,
      color: RiseChipColor.default_,
      size: RiseChipSize.md,
      child: Text('Label'),
    ),
    RiseChip(
      variant: RiseChipVariant.primary,
      color: RiseChipColor.accent,
      size: RiseChipSize.md,
      child: Text('Label'),
    ),
    // … success, warning, danger
  ],
)`;

export const chipWithIconsCode = `RiseChip(
  leading: Icon(Icons.info_outline),
  color: RiseChipColor.default_,
  child: Text('Information'),
)`;

export const chipStatusesCode = `Wrap(
  spacing: 12,
  runSpacing: 12,
  children: [
    RiseChip(
      leading: Icon(Icons.circle_outlined),
      child: Text('Default'),
    ),
    RiseChip(
      leading: Icon(Icons.check_circle),
      variant: RiseChipVariant.primary,
      color: RiseChipColor.accent,
      child: Text('Active'),
    ),
    RiseChip(
      leading: Icon(Icons.schedule),
      color: RiseChipColor.warning,
      child: Text('Pending'),
    ),
    RiseChip(
      leading: Icon(Icons.auto_awesome_outlined),
      color: RiseChipColor.success,
      child: Text('New Feature'),
    ),
  ],
)`;
