import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kRadioComponentId = 'radio';
const String kRadioTitle = 'RadioGroup';
const String kRadioDescription =
    'Single-choice selection with orientation, variants, disabled and invalid states — aligned with HeroUI RadioGroup and radio-group.css.';

const List<RiseUsagePublicConfig> kRadioUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Basic vertical radio group.',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'horizontal',
    sectionTitle: 'Horizontal orientation',
    subtitle: 'Options laid out in a row/wrap.',
    minHeight: 140,
  ),
  RiseUsagePublicConfig(
    slug: 'controlled',
    sectionTitle: 'Controlled',
    subtitle: 'Selection mirrored in UI state.',
    minHeight: 210,
  ),
  RiseUsagePublicConfig(
    slug: 'disabled',
    sectionTitle: 'Disabled',
    subtitle: 'Whole group disabled.',
    minHeight: 180,
  ),
  RiseUsagePublicConfig(
    slug: 'variants',
    sectionTitle: 'Variants',
    subtitle: 'primary and secondary styling.',
    minHeight: 260,
  ),
  RiseUsagePublicConfig(
    slug: 'invalid',
    sectionTitle: 'Invalid',
    subtitle: 'Danger styles and error message.',
    minHeight: 220,
  ),
];
