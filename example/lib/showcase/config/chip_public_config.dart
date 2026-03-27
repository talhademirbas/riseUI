import 'button_public_config.dart' show RiseUsagePublicConfig;

/// Flutter-agnostic chip showcase metadata (example app + docs manifest + embed ids).
const String kChipComponentId = 'chip';

const String kChipTitle = 'Chip';

const String kChipDescription =
    'Small informational badges for labels, statuses, and categories — aligned with '
    '@heroui/react Chip (heroui.com/docs/react/components/chip) and chip.css '
    '(rounded-2xl, compound colors × variants).';

const List<RiseUsagePublicConfig> kChipUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Semantic colors with the default soft style (HeroUI Usage row).',
    minHeight: 140,
  ),
  RiseUsagePublicConfig(
    slug: 'variants',
    sectionTitle: 'Variants',
    subtitle: 'Variant × color matrix at md size — primary, secondary, tertiary, soft.',
    minHeight: 520,
  ),
  RiseUsagePublicConfig(
    slug: 'with-icons',
    sectionTitle: 'With icons',
    subtitle: 'Leading icon + label via leading.',
    minHeight: 180,
  ),
  RiseUsagePublicConfig(
    slug: 'statuses',
    sectionTitle: 'Statuses',
    subtitle: 'Typical status and release labels using semantic colors.',
    minHeight: 220,
  ),
];
