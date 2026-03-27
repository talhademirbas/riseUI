import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kInputGroupComponentId = 'input-group';
const String kInputGroupTitle = 'InputGroup';
const String kInputGroupDescription =
    'Grouped input controls with prefix/suffix slots for icons, text, and actions — aligned with '
    'HeroUI InputGroup and input-group.css.';

const List<RiseUsagePublicConfig> kInputGroupUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Input with a prefix icon.',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'with-suffix',
    sectionTitle: 'With suffix icon',
    subtitle: 'Input with trailing icon.',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'prefix-and-suffix',
    sectionTitle: 'With prefix and suffix',
    subtitle: 'Currency and unit styling around input.',
    minHeight: 130,
  ),
  RiseUsagePublicConfig(
    slug: 'password-toggle',
    sectionTitle: 'Password toggle',
    subtitle: 'Interactive suffix button.',
    minHeight: 130,
  ),
  RiseUsagePublicConfig(
    slug: 'variants',
    sectionTitle: 'Variants',
    subtitle: 'primary vs secondary.',
    minHeight: 140,
  ),
  RiseUsagePublicConfig(
    slug: 'full-width',
    sectionTitle: 'Full width',
    subtitle: 'InputGroup expands to container width.',
    minHeight: 120,
  ),
];
