import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kRadioComponentId = 'radio';
const String kRadioTitle = 'RadioGroup';
const String kRadioDescription =
    'Single-choice radios matching HeroUI [RadioGroup](https://heroui.com/docs/react/components/radio-group), '
    '[radio.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/radio.css), and '
    '[radio-group.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/radio-group.css).';

const List<RiseUsagePublicConfig> kRadioUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Plan selection with label, description, and vertical stack (`mt-4`).',
    minHeight: 280,
  ),
  RiseUsagePublicConfig(
    slug: 'horizontal',
    sectionTitle: 'Horizontal orientation',
    subtitle: '`flex-row flex-wrap gap-4` for subscription-style rows.',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'controlled',
    sectionTitle: 'Controlled',
    subtitle: 'Selection mirrored in helper text.',
    minHeight: 240,
  ),
  RiseUsagePublicConfig(
    slug: 'uncontrolled',
    sectionTitle: 'Uncontrolled pattern',
    subtitle: 'Local state with “last chosen” readout (Hero defaultValue + onChange story).',
    minHeight: 240,
  ),
  RiseUsagePublicConfig(
    slug: 'validation',
    sectionTitle: 'Validation',
    subtitle: 'Required group, submit, and [RiseFieldError].',
    minHeight: 280,
  ),
  RiseUsagePublicConfig(
    slug: 'disabled',
    sectionTitle: 'Disabled',
    subtitle: 'Whole group non-interactive with description.',
    minHeight: 220,
  ),
  RiseUsagePublicConfig(
    slug: 'variants',
    sectionTitle: 'Variants',
    subtitle: 'Primary (`shadow-field`) vs secondary (`shadow-none`, surface control fill).',
    minHeight: 340,
  ),
  RiseUsagePublicConfig(
    slug: 'invalid',
    sectionTitle: 'Invalid',
    subtitle: 'Required + danger strokes + error line.',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'on-surface',
    sectionTitle: 'In surface',
    subtitle: '[RiseSurface] + `variant: secondary` for lower emphasis on card shells.',
    minHeight: 320,
  ),
];
