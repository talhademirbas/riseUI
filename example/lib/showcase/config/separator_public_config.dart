import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kSeparatorComponentId = 'separator';

const String kSeparatorTitle = 'Separator';

const String kSeparatorDescription =
    'Hairlines with HeroUI tokens (`separator--default`, `secondary`, `tertiary`), horizontal / vertical '
    'orientation, optional labeled row (`separator__container`), and on-surface contrast — see '
    '[Separator](https://heroui.com/docs/react/components/separator), '
    '[separator.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/separator/separator.tsx), '
    'and [separator.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/separator.css).';

const List<RiseUsagePublicConfig> kSeparatorUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Horizontal rule under intro; row links with vertical separators (Storybook Default).',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'vertical',
    sectionTitle: 'Vertical',
    subtitle: '`separator--vertical` in a height-bounded row (Storybook Vertical).',
    minHeight: 100,
  ),
  RiseUsagePublicConfig(
    slug: 'with-content',
    sectionTitle: 'With content',
    subtitle: 'Icon steps + plain `RiseSeparator` blocks + `RiseLabeledSeparator` (Storybook With).',
    minHeight: 320,
  ),
  RiseUsagePublicConfig(
    slug: 'variants',
    sectionTitle: 'Variants',
    subtitle: 'Default, secondary, tertiary line contrast (`bg-separator*`).',
    minHeight: 140,
  ),
  RiseUsagePublicConfig(
    slug: 'with-surface',
    sectionTitle: 'With surface',
    subtitle: 'Separators on default / secondary / tertiary RiseSurface shells.',
    minHeight: 280,
  ),
];
