import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kSwitchComponentId = 'switch';

const String kSwitchTitle = 'Switch';

const String kSwitchDescription =
    'Boolean toggle with sizes, label placement, optional description and thumb icons, plus '
    'SwitchGroup layouts — aligned with HeroUI Switch (heroui.com/docs/react/components/switch), '
    'switch.tsx, and switch.css.';

const List<RiseUsagePublicConfig> kSwitchUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Label with control (default: label after track).',
    minHeight: 100,
  ),
  RiseUsagePublicConfig(
    slug: 'disabled',
    sectionTitle: 'Disabled',
    subtitle: 'Non-interactive switch.',
    minHeight: 90,
  ),
  RiseUsagePublicConfig(
    slug: 'sizes',
    sectionTitle: 'Sizes',
    subtitle: 'sm · md · lg.',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'label-position',
    sectionTitle: 'Label position',
    subtitle: 'Label before vs after the control.',
    minHeight: 140,
  ),
  RiseUsagePublicConfig(
    slug: 'with-description',
    sectionTitle: 'With description',
    subtitle: 'Secondary line under the label.',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'with-icons',
    sectionTitle: 'With icons',
    subtitle: 'Optional thumb icons for on/off.',
    minHeight: 100,
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
