import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kSeparatorComponentId = 'separator';

const String kSeparatorTitle = 'Separator';

const String kSeparatorDescription =
    'Dividers with HeroUI tones (standard, secondary, tertiary), horizontal and vertical orientation, '
    'optional centered label, and surface-aware contrast — see '
    '[Separator](https://heroui.com/docs/react/components/separator), '
    '[separator.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/separator/separator.tsx), '
    'and [separator.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/separator.css).';

const List<RiseUsagePublicConfig> kSeparatorUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Horizontal rule under intro copy; link row with vertical separators.',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'vertical',
    sectionTitle: 'Vertical',
    subtitle: '1px vertical line between row items (bounded height).',
    minHeight: 100,
  ),
  RiseUsagePublicConfig(
    slug: 'with-content',
    sectionTitle: 'With content',
    subtitle: 'RiseLabeledSeparator — muted label between growing lines.',
    minHeight: 220,
  ),
  RiseUsagePublicConfig(
    slug: 'variants',
    sectionTitle: 'Variants',
    subtitle: 'standard, secondary, and tertiary line contrast.',
    minHeight: 140,
  ),
  RiseUsagePublicConfig(
    slug: 'with-surface',
    sectionTitle: 'With surface',
    subtitle: 'Separators on default / secondary / tertiary RiseSurface shells.',
    minHeight: 280,
  ),
];
