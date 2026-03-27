import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kInputComponentId = 'input';
const String kInputTitle = 'Input';
const String kInputDescription =
    'Primitive single-line input with variants, input types, controlled state, and full width — '
    'aligned with HeroUI Input and input.css.';

const List<RiseUsagePublicConfig> kInputUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Basic input with placeholder.',
    minHeight: 110,
  ),
  RiseUsagePublicConfig(
    slug: 'input-types',
    sectionTitle: 'Input types',
    subtitle: 'Email, age, and password.',
    minHeight: 220,
  ),
  RiseUsagePublicConfig(
    slug: 'controlled',
    sectionTitle: 'Controlled',
    subtitle: 'Value driven from state.',
    minHeight: 130,
  ),
  RiseUsagePublicConfig(
    slug: 'full-width',
    sectionTitle: 'Full width',
    subtitle: 'Input expands to container width.',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'variants',
    sectionTitle: 'Variants',
    subtitle: 'primary vs secondary.',
    minHeight: 130,
  ),
];
