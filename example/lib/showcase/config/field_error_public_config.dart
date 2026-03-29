import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kFieldErrorComponentId = 'field-error';

const String kFieldErrorTitle = 'FieldError';

const String kFieldErrorDescription =
    'Validation error text for form fields with danger styling and accessibility semantics — '
    'aligned with HeroUI FieldError and field-error.css.';

const List<RiseUsagePublicConfig> kFieldErrorUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Simple error line under a field.',
    minHeight: 90,
  ),
  RiseUsagePublicConfig(
    slug: 'visibility',
    sectionTitle: 'Visibility',
    subtitle: 'Toggle data-visible: collapse and expand with motion (Hero field-error.css).',
    minHeight: 160,
  ),
  RiseUsagePublicConfig(
    slug: 'basic-validation',
    sectionTitle: 'Basic validation',
    subtitle: 'Conditional invalid state with message.',
    minHeight: 180,
  ),
  RiseUsagePublicConfig(
    slug: 'dynamic-message',
    sectionTitle: 'With dynamic message',
    subtitle: 'Message content changes with input value.',
    minHeight: 190,
  ),
  RiseUsagePublicConfig(
    slug: 'multiple-messages',
    sectionTitle: 'Multiple messages',
    subtitle: 'Render multiple validation errors.',
    minHeight: 220,
  ),
];
