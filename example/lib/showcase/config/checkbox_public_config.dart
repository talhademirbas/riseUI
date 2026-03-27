import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kCheckboxComponentId = 'checkbox';

const String kCheckboxTitle = 'Checkbox';

const String kCheckboxDescription =
    'Selection control with label/description slot, indeterminate, invalid, and variants '
    '(primary/secondary) — aligned with HeroUI Checkbox and checkbox.css.';

const List<RiseUsagePublicConfig> kCheckboxUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Basic checkbox with label.',
    minHeight: 90,
  ),
  RiseUsagePublicConfig(
    slug: 'controlled',
    sectionTitle: 'Controlled',
    subtitle: 'External state + status text.',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'indeterminate',
    sectionTitle: 'Indeterminate',
    subtitle: 'Tristate null value (dash).',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'with-description',
    sectionTitle: 'With description',
    subtitle: 'Label and helper text block.',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'invalid',
    sectionTitle: 'Invalid',
    subtitle: 'Danger styling for required agreement.',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'variants',
    sectionTitle: 'Variants',
    subtitle: 'primary vs secondary visual style.',
    minHeight: 140,
  ),
  RiseUsagePublicConfig(
    slug: 'disabled',
    sectionTitle: 'Disabled',
    subtitle: 'Non-interactive checkbox.',
    minHeight: 100,
  ),
];
