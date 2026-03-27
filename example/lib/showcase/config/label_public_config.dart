import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kLabelComponentId = 'label';
const String kLabelTitle = 'Label';
const String kLabelDescription =
    'Accessible form label with required, disabled, and invalid states — aligned with HeroUI Label and label.css.';

const List<RiseUsagePublicConfig> kLabelUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Basic field label.',
    minHeight: 100,
  ),
  RiseUsagePublicConfig(
    slug: 'required',
    sectionTitle: 'Required indicator',
    subtitle: 'Adds danger-colored asterisk.',
    minHeight: 100,
  ),
  RiseUsagePublicConfig(
    slug: 'disabled',
    sectionTitle: 'Disabled state',
    subtitle: 'Muted label for disabled inputs.',
    minHeight: 100,
  ),
  RiseUsagePublicConfig(
    slug: 'invalid',
    sectionTitle: 'Invalid state',
    subtitle: 'Danger-colored label for invalid controls.',
    minHeight: 100,
  ),
  RiseUsagePublicConfig(
    slug: 'with-input',
    sectionTitle: 'With input',
    subtitle: 'Common label + input composition.',
    minHeight: 150,
  ),
];
