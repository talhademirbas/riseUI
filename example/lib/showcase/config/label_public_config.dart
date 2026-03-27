import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kLabelComponentId = 'label';

const String kLabelTitle = 'Label';

const String kLabelDescription =
    'Accessible form label with required, disabled, and invalid states — aligned with HeroUI Label and label.css.';

const List<RiseUsagePublicConfig> kLabelUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Plain text label.',
    minHeight: 100,
  ),
  RiseUsagePublicConfig(
    slug: 'required',
    sectionTitle: 'Required',
    subtitle: 'Asterisk indicator (or custom [requiredIndicator]).',
    minHeight: 100,
  ),
  RiseUsagePublicConfig(
    slug: 'disabled',
    sectionTitle: 'Disabled',
    subtitle: 'Muted foreground when `isDisabled`.',
    minHeight: 100,
  ),
  RiseUsagePublicConfig(
    slug: 'invalid',
    sectionTitle: 'Invalid',
    subtitle: 'Danger color for error context.',
    minHeight: 100,
  ),
  RiseUsagePublicConfig(
    slug: 'with-input',
    sectionTitle: 'With input',
    subtitle: 'Label stacked above `RiseInput`.',
    minHeight: 160,
  ),
];
