import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kCheckboxComponentId = 'checkbox';

const String kCheckboxTitle = 'Checkbox';

const String kCheckboxDescription =
    'Selection control with label/description, indeterminate, invalid, primary/secondary variants, '
    'sizes, and custom indicators — aligned with HeroUI Checkbox '
    '(heroui.com/docs/react/components/checkbox), checkbox.tsx, and checkbox.css in heroui v3.';

const List<RiseUsagePublicConfig> kCheckboxUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Default label (HeroUI Default).',
    minHeight: 90,
  ),
  RiseUsagePublicConfig(
    slug: 'controlled',
    sectionTitle: 'Controlled',
    subtitle: 'External state + status line.',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'indeterminate',
    sectionTitle: 'Indeterminate',
    subtitle: 'Tristate / dash (HeroUI Indeterminate).',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'with-description',
    sectionTitle: 'With description',
    subtitle: 'Label + helper (HeroUI WithDescription).',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'invalid',
    sectionTitle: 'Invalid',
    subtitle: 'Danger border + message (HeroUI Invalid).',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'variants',
    sectionTitle: 'Variants',
    subtitle: 'Primary vs secondary (HeroUI Variants).',
    minHeight: 260,
  ),
  RiseUsagePublicConfig(
    slug: 'disabled',
    sectionTitle: 'Disabled',
    subtitle: 'Non-interactive (HeroUI Disabled).',
    minHeight: 100,
  ),
  RiseUsagePublicConfig(
    slug: 'custom-indicator',
    sectionTitle: 'Custom indicator',
    subtitle: 'Custom glyphs when checked (HeroUI WithCustomIndicator).',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'render-props',
    sectionTitle: 'Render props',
    subtitle: 'Label + description follow selection (HeroUI RenderProps).',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'sizes',
    sectionTitle: 'Sizes',
    subtitle: 'sm · md · lg · xl (HeroUI FullRounded).',
    minHeight: 360,
  ),
  RiseUsagePublicConfig(
    slug: 'features',
    sectionTitle: 'Features',
    subtitle: 'Notification preferences list (HeroUI FeaturesAndAddOnsExample).',
    minHeight: 340,
  ),
];
