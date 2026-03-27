/// Flutter-agnostic button showcase metadata (example app + docs manifest + embed ids).
const String kButtonComponentId = 'button';

const String kButtonTitle = 'Button';

const String kButtonDescription =
    'Clickable button with HeroUI v3 variants, sizes, icons, loading, and full width — '
    'aligned with @heroui/react and `button.css` (rounded-3xl, gap-2, press scale 0.97).';

class RiseUsagePublicConfig {
  const RiseUsagePublicConfig({
    required this.slug,
    required this.sectionTitle,
    this.subtitle,
    this.minHeight = 280,
  });

  final String slug;
  final String sectionTitle;
  final String? subtitle;
  final double minHeight;

  String embedId(String componentId) => '$componentId-$slug';
}

const List<RiseUsagePublicConfig> kButtonUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Basic `onPress` / `onPressed` handler.',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'variants',
    sectionTitle: 'Variants',
    subtitle: 'Primary, secondary, tertiary, outline, ghost, danger, danger soft.',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'with-icons',
    sectionTitle: 'With icons',
    subtitle: 'Leading icon + label in a row.',
    minHeight: 160,
  ),
  RiseUsagePublicConfig(
    slug: 'icon-only',
    sectionTitle: 'Icon only',
    subtitle: '`isIconOnly: true` — square hit target.',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'loading',
    sectionTitle: 'Loading',
    subtitle: 'Spinner + label while pending (disabled tap).',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'loading-state',
    sectionTitle: 'Loading state',
    subtitle: 'Outline button with leading icon (upload).',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'sizes',
    sectionTitle: 'Sizes',
    subtitle: '`sm` · `md` · `lg` — heights 32 / 40 / 44.',
    minHeight: 140,
  ),
  RiseUsagePublicConfig(
    slug: 'full-width',
    sectionTitle: 'Full width',
    subtitle: '`fullWidth: true`.',
    minHeight: 160,
  ),
  RiseUsagePublicConfig(
    slug: 'disabled',
    sectionTitle: 'Disabled',
    subtitle: '`isDisabled: true` across variants.',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'social-buttons',
    sectionTitle: 'Social buttons',
    subtitle:
        'Outline + `fullWidth` stacked rows (swap icons for brand assets — no separate social primitive).',
    minHeight: 220,
  ),
  RiseUsagePublicConfig(
    slug: 'compound-label',
    sectionTitle: 'Compound label',
    subtitle:
        'Compose `child` with `RiseButtonLabel` for variant-colored text (e.g. icon + label + muted suffix).',
    minHeight: 140,
  ),
];
