import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kLabelComponentId = 'label';

const String kLabelTitle = 'Label';

const String kLabelDescription =
    'Accessible labels matching HeroUI [label.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/label.css) '
    '(`text-sm font-medium`, required asterisk, disabled opacity, invalid danger) and [label.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/label/label.tsx).';

const List<RiseUsagePublicConfig> kLabelUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Default label typography.',
    minHeight: 100,
  ),
  RiseUsagePublicConfig(
    slug: 'required',
    sectionTitle: 'Required',
    subtitle: 'Danger asterisk with spacing (`after:ml-0.5`).',
    minHeight: 100,
  ),
  RiseUsagePublicConfig(
    slug: 'disabled',
    sectionTitle: 'Disabled',
    subtitle: '`status-disabled` via [RiseThemeData.disabledOpacity].',
    minHeight: 100,
  ),
  RiseUsagePublicConfig(
    slug: 'invalid',
    sectionTitle: 'Invalid',
    subtitle: '`text-danger` for error context.',
    minHeight: 100,
  ),
  RiseUsagePublicConfig(
    slug: 'with-input',
    sectionTitle: 'With input',
    subtitle: 'Stacked above [RiseInput].',
    minHeight: 160,
  ),
  RiseUsagePublicConfig(
    slug: 'with-description',
    sectionTitle: 'With description',
    subtitle: 'Label + helper line (common form pattern).',
    minHeight: 130,
  ),
  RiseUsagePublicConfig(
    slug: 'required-invalid',
    sectionTitle: 'Required + invalid',
    subtitle: 'Combined states.',
    minHeight: 100,
  ),
  RiseUsagePublicConfig(
    slug: 'custom-indicator',
    sectionTitle: 'Custom indicator',
    subtitle: 'Replace the default asterisk.',
    minHeight: 100,
  ),
  RiseUsagePublicConfig(
    slug: 'control-field',
    sectionTitle: 'Control field',
    subtitle: 'Label + description + control via [RiseControlField].',
    minHeight: 200,
  ),
];
