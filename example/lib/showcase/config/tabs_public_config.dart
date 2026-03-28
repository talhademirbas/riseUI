import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kTabsComponentId = 'tabs';
const String kTabsTitle = 'Tabs';
const String kTabsDescription =
    'Tab list + panels aligned with HeroUI v3 packages/react/src/components/tabs/tabs.tsx and '
    'packages/styles/components/tabs.css — default segment track + surface pill / shadow, secondary underline on border.';

const List<RiseUsagePublicConfig> kTabsUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle:
        'Horizontal default variant: `RiseThemeData.muted` list, `RiseThemeData.surface` segment + surface shadow, `text-sm` labels; `mt-4` gap before panel.',
    minHeight: 220,
  ),
  RiseUsagePublicConfig(
    slug: 'vertical',
    sectionTitle: 'Vertical',
    subtitle: 'Default variant vertical strip — same segment pill + shadow as horizontal.',
    minHeight: 240,
  ),
  RiseUsagePublicConfig(
    slug: 'disabled',
    sectionTitle: 'Disabled tab',
    subtitle: 'One tab cannot be selected.',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'custom-styles',
    sectionTitle: 'Custom styles',
    subtitle:
        'Same default segment chrome as Usage, but `labelStyle` (12px semibold, wider tracking), '
        '`labelColor: rise.accent` for the selected tab, and `initialIndex: 1` — Daily / Weekly / Bi-Weekly / Monthly.',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'secondary',
    sectionTitle: 'Secondary variant',
    subtitle: '`.tabs--secondary`: transparent list, `border-border` rule, `bg-accent` 2px indicator.',
    minHeight: 220,
  ),
  RiseUsagePublicConfig(
    slug: 'secondary-vertical',
    sectionTitle: 'Secondary vertical',
    subtitle: 'Left border on list; accent vertical stroke on the selected tab.',
    minHeight: 240,
  ),
  RiseUsagePublicConfig(
    slug: 'scrollable',
    sectionTitle: 'Scrollable',
    subtitle: 'Many tabs in the secondary style.',
    minHeight: 200,
  ),
];
