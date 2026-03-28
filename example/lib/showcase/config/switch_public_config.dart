import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kSwitchComponentId = 'switch';

const String kSwitchTitle = 'Switch';

const String kSwitchDescription =
    'Boolean toggle with sizes, label placement, optional description and thumb icons, plus '
    'SwitchGroup layouts — aligned with HeroUI Switch (heroui.com/docs/react/components/switch), '
    'switch.tsx, and switch.css in heroui v3.';

const List<RiseUsagePublicConfig> kSwitchUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Default off and on (HeroUI Default + DefaultSelected).',
    minHeight: 180,
  ),
  RiseUsagePublicConfig(
    slug: 'disabled',
    sectionTitle: 'Disabled',
    subtitle: 'Unchecked and checked disabled (HeroUI Disabled + DisabledDefaultSelected).',
    minHeight: 160,
  ),
  RiseUsagePublicConfig(
    slug: 'controlled',
    sectionTitle: 'Controlled',
    subtitle: 'External state with status text.',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'without-label',
    sectionTitle: 'Without label',
    subtitle: 'Track only — use semanticLabel for a11y.',
    minHeight: 72,
  ),
  RiseUsagePublicConfig(
    slug: 'sizes',
    sectionTitle: 'Sizes',
    subtitle: 'sm · md · lg (HeroUI Sizes).',
    minHeight: 320,
  ),
  RiseUsagePublicConfig(
    slug: 'label-position',
    sectionTitle: 'Label position',
    subtitle: 'Label after vs before the control (HeroUI LabelBefore).',
    minHeight: 140,
  ),
  RiseUsagePublicConfig(
    slug: 'with-description',
    sectionTitle: 'With description',
    subtitle: 'Label + Description in switch content (HeroUI WithDescription).',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'with-custom-styles',
    sectionTitle: 'With custom styles',
    subtitle: 'accentColor for checked track (HeroUI WithCustomStyles).',
    minHeight: 140,
  ),
  RiseUsagePublicConfig(
    slug: 'with-icons',
    sectionTitle: 'With icons',
    subtitle: 'Thumb icons and accent colors (HeroUI WithIcons).',
    minHeight: 520,
  ),
  RiseUsagePublicConfig(
    slug: 'render-props',
    sectionTitle: 'Render props',
    subtitle: 'Label reflects selection (HeroUI RenderProps).',
    minHeight: 72,
  ),
  RiseUsagePublicConfig(
    slug: 'group',
    sectionTitle: 'Group',
    subtitle: 'Vertical SwitchGroup spacing.',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'group-horizontal',
    sectionTitle: 'Group horizontal',
    subtitle: 'Horizontal SwitchGroup with scroll.',
    minHeight: 120,
  ),
];
