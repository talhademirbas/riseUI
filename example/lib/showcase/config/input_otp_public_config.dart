import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kInputOtpComponentId = 'input-otp';
const String kInputOtpTitle = 'InputOTP';
const String kInputOtpDescription =
    'One-time passcode input with grouped slots, validation states, and completion callbacks — '
    'aligned with HeroUI InputOTP and input-otp.css.';

const List<RiseUsagePublicConfig> kInputOtpUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Basic 6-digit OTP.',
    minHeight: 130,
  ),
  RiseUsagePublicConfig(
    slug: 'four-digits',
    sectionTitle: 'Four digits',
    subtitle: 'PIN-style 4-slot input.',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'disabled',
    sectionTitle: 'Disabled state',
    subtitle: 'Non-interactive slots.',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'with-pattern',
    sectionTitle: 'With pattern',
    subtitle: 'Letters-only input pattern.',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'controlled',
    sectionTitle: 'Controlled',
    subtitle: 'Read OTP value through onChanged.',
    minHeight: 150,
  ),
  RiseUsagePublicConfig(
    slug: 'variants',
    sectionTitle: 'Variants',
    subtitle: 'primary vs secondary slot styling.',
    minHeight: 160,
  ),
];
