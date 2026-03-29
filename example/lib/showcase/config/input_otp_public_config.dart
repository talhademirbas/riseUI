import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kInputOtpComponentId = 'input-otp';
const String kInputOtpTitle = 'InputOTP';
const String kInputOtpDescription =
    'One-time passcode slots with HeroUI [input-otp.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/input-otp.css) '
    'styling — primary/secondary variants, separator, validation, and completion callbacks.';

const List<RiseUsagePublicConfig> kInputOtpUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Verify layout with label, description, 3│3 separator, and actions.',
    minHeight: 220,
  ),
  RiseUsagePublicConfig(
    slug: 'four-digits',
    sectionTitle: 'Four digits',
    subtitle: 'PIN-style 4-slot input.',
    minHeight: 140,
  ),
  RiseUsagePublicConfig(
    slug: 'disabled',
    sectionTitle: 'Disabled state',
    subtitle: 'Non-interactive slots (Hero disabled story).',
    minHeight: 180,
  ),
  RiseUsagePublicConfig(
    slug: 'with-pattern',
    sectionTitle: 'With pattern',
    subtitle: 'Letters-only via RegExp (REGEXP_ONLY_CHARS).',
    minHeight: 160,
  ),
  RiseUsagePublicConfig(
    slug: 'controlled',
    sectionTitle: 'Controlled',
    subtitle: 'Mirror the value from onChanged.',
    minHeight: 160,
  ),
  RiseUsagePublicConfig(
    slug: 'variants',
    sectionTitle: 'Variants',
    subtitle: 'Primary (shadow-field) vs secondary (shadow-none).',
    minHeight: 220,
  ),
  RiseUsagePublicConfig(
    slug: 'with-validation',
    sectionTitle: 'With validation',
    subtitle: 'Submit hint 123456 + FieldError on mismatch.',
    minHeight: 260,
  ),
  RiseUsagePublicConfig(
    slug: 'on-complete',
    sectionTitle: 'On complete',
    subtitle: 'Fire logic when all slots are filled.',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'form-example',
    sectionTitle: 'Form example',
    subtitle: '2FA-style copy with verify and backup link.',
    minHeight: 300,
  ),
];
