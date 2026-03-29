import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kAlertComponentId = 'alert';
const String kAlertTitle = 'Alert';
const String kAlertDescription =
    'Status messages with indicator, title, description, optional actions, and dismiss — '
    'mirroring HeroUI v3 '
    '[Alert](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/alert/alert.tsx) '
    'and [alert.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/alert.css).';

const List<RiseUsagePublicConfig> kAlertUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Default — general information (`alert--default`, info icon).',
    minHeight: 140,
  ),
  RiseUsagePublicConfig(
    slug: 'accent',
    sectionTitle: 'Accent',
    subtitle: 'Accent title/icon, primary action, and close — matches the “Update available” story.',
    minHeight: 180,
  ),
  RiseUsagePublicConfig(
    slug: 'success',
    sectionTitle: 'Success',
    subtitle: 'Confirmation with “View Receipt” — matches the payment success story.',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'warning',
    sectionTitle: 'Warning',
    subtitle: 'Storage quota — matches the warning story with action + close.',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'danger',
    sectionTitle: 'Danger',
    subtitle: 'Error with bullet steps and Retry — matches the connection error story.',
    minHeight: 260,
  ),
  RiseUsagePublicConfig(
    slug: 'without-description',
    sectionTitle: 'Without description',
    subtitle: 'Title-only success state with close.',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'custom-indicator',
    sectionTitle: 'Custom indicator',
    subtitle: 'Loading state — [RiseSpinner] in the indicator slot (HeroUI custom indicator story).',
    minHeight: 150,
  ),
  RiseUsagePublicConfig(
    slug: 'without-close',
    sectionTitle: 'Without close',
    subtitle: 'No dismiss control — scheduled maintenance copy from HeroUI stories.',
    minHeight: 160,
  ),
  RiseUsagePublicConfig(
    slug: 'with-actions',
    sectionTitle: 'With actions',
    subtitle: 'Multiple buttons in the footer wrap.',
    minHeight: 170,
  ),
];
