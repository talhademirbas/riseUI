import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kTabsComponentId = 'tabs';
const String kTabsTitle = 'Tabs';
const String kTabsDescription =
    'Tab list + panels with primary/secondary variants and vertical layout — aligned with '
    '@heroui/react Tabs, tabs.tsx, and tabs.css.';

const List<RiseUsagePublicConfig> kTabsUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Primary horizontal tabs with segment indicator.',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'vertical',
    sectionTitle: 'Vertical',
    subtitle: 'Primary tabs along the leading edge.',
    minHeight: 220,
  ),
  RiseUsagePublicConfig(
    slug: 'disabled',
    sectionTitle: 'Disabled tab',
    subtitle: 'One tab cannot be selected.',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'with-separator',
    sectionTitle: 'With separator',
    subtitle: 'Hairline dividers between tab labels.',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'custom-styles',
    sectionTitle: 'Custom styles',
    subtitle: 'Secondary tabs with centered alignment.',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'secondary',
    sectionTitle: 'Secondary variant',
    subtitle: 'Underline indicator on a transparent bar.',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'secondary-vertical',
    sectionTitle: 'Secondary vertical',
    subtitle: 'Leading border and accent stroke on the active tab.',
    minHeight: 220,
  ),
  RiseUsagePublicConfig(
    slug: 'scrollable',
    sectionTitle: 'Scrollable',
    subtitle: 'Many tabs in the secondary style.',
    minHeight: 200,
  ),
];
