import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kTextAreaComponentId = 'text-area';
const String kTextAreaTitle = 'TextArea';
const String kTextAreaDescription =
    'Multiline text input with HeroUI-style field tokens, rows, variants, and full width — '
    'aligned with @heroui/react TextArea and textarea.css.';

const List<RiseUsagePublicConfig> kTextAreaUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Basic multi-line input with placeholder.',
    minHeight: 160,
  ),
  RiseUsagePublicConfig(
    slug: 'controlled',
    sectionTitle: 'Controlled',
    subtitle: 'Live character count with max length.',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'rows',
    sectionTitle: 'Rows',
    subtitle: 'Short vs taller default row counts.',
    minHeight: 260,
  ),
  RiseUsagePublicConfig(
    slug: 'full-width',
    sectionTitle: 'Full width',
    subtitle: 'Stretches to container width.',
    minHeight: 160,
  ),
  RiseUsagePublicConfig(
    slug: 'variants',
    sectionTitle: 'Variants',
    subtitle: 'Primary and secondary surface styles.',
    minHeight: 220,
  ),
];
