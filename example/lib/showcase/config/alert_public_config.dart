import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kAlertComponentId = 'alert';
const String kAlertTitle = 'Alert';
const String kAlertDescription =
    'Status messages with indicator, title, description, and optional actions — aligned with '
    '@heroui/react Alert, alert.tsx, and alert.css.';

const List<RiseUsagePublicConfig> kAlertUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Default informational alert on a surface card.',
    minHeight: 140,
  ),
  RiseUsagePublicConfig(
    slug: 'accent',
    sectionTitle: 'Accent',
    subtitle: 'Accent-colored title and icon with an action.',
    minHeight: 160,
  ),
  RiseUsagePublicConfig(
    slug: 'success',
    sectionTitle: 'Success',
    subtitle: 'Positive confirmation message.',
    minHeight: 130,
  ),
  RiseUsagePublicConfig(
    slug: 'warning',
    sectionTitle: 'Warning',
    subtitle: 'Maintenance or caution copy.',
    minHeight: 150,
  ),
  RiseUsagePublicConfig(
    slug: 'danger',
    sectionTitle: 'Danger',
    subtitle: 'Error state with bullet list and retry.',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'custom-indicator',
    sectionTitle: 'Custom indicator',
    subtitle: 'Replace the default status icon.',
    minHeight: 130,
  ),
  RiseUsagePublicConfig(
    slug: 'with-actions',
    sectionTitle: 'With actions',
    subtitle: 'Multiple buttons in the alert footer.',
    minHeight: 150,
  ),
];
