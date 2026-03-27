import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kTextFieldComponentId = 'text-field';
const String kTextFieldTitle = 'TextField';
const String kTextFieldDescription =
    'Label, input, helper, and error in one field — aligned with @heroui/react TextField, '
    'textfield.tsx, and textfield.css.';

const List<RiseUsagePublicConfig> kTextFieldUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Email-style field with label and placeholder.',
    minHeight: 150,
  ),
  RiseUsagePublicConfig(
    slug: 'with-description',
    sectionTitle: 'With description',
    subtitle: 'Helper text under the input.',
    minHeight: 170,
  ),
  RiseUsagePublicConfig(
    slug: 'required',
    sectionTitle: 'Required field',
    subtitle: 'Required marker with helper text.',
    minHeight: 170,
  ),
  RiseUsagePublicConfig(
    slug: 'validation',
    sectionTitle: 'Validation',
    subtitle: 'Invalid state hides helper and shows error.',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'controlled',
    sectionTitle: 'Controlled',
    subtitle: 'Synced values and character counts.',
    minHeight: 280,
  ),
  RiseUsagePublicConfig(
    slug: 'error-message',
    sectionTitle: 'Error message',
    subtitle: 'Static invalid state with FieldError-style copy.',
    minHeight: 160,
  ),
  RiseUsagePublicConfig(
    slug: 'disabled',
    sectionTitle: 'Disabled',
    subtitle: 'Non-editable field with helper text.',
    minHeight: 160,
  ),
  RiseUsagePublicConfig(
    slug: 'multiline',
    sectionTitle: 'Multiline',
    subtitle: 'Several rows inside the same TextField API.',
    minHeight: 220,
  ),
  RiseUsagePublicConfig(
    slug: 'input-types',
    sectionTitle: 'Input types',
    subtitle: 'Password, numeric, and email keyboards.',
    minHeight: 260,
  ),
  RiseUsagePublicConfig(
    slug: 'full-width',
    sectionTitle: 'Full width',
    subtitle: 'Stacked fields that stretch to the container.',
    minHeight: 220,
  ),
  RiseUsagePublicConfig(
    slug: 'in-surface',
    sectionTitle: 'In surface',
    subtitle: 'Secondary variant on a surface background.',
    minHeight: 260,
  ),
  RiseUsagePublicConfig(
    slug: 'variants',
    sectionTitle: 'Variants',
    subtitle: 'Primary vs secondary field fill.',
    minHeight: 200,
  ),
];
