import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kButtonGroupComponentId = 'button-group';

const String kButtonGroupTitle = 'ButtonGroup';

const String kButtonGroupDescription =
    'Group related buttons with shared styling, joined corners, optional separators — aligned with '
    'HeroUI ButtonGroup (heroui.com/docs/react/components/button-group) and button-group.css.';

const List<RiseUsagePublicConfig> kButtonGroupUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Merged radii, zero gap; optional RiseButtonGroupSeparator inside 2nd+ buttons.',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'variants',
    sectionTitle: 'Variants',
    subtitle: 'Shared variant on the group (primary, secondary, tertiary, outline, ghost, danger).',
    minHeight: 420,
  ),
  RiseUsagePublicConfig(
    slug: 'sizes',
    sectionTitle: 'Sizes',
    subtitle: 'sm · md · lg on the group.',
    minHeight: 260,
  ),
  RiseUsagePublicConfig(
    slug: 'orientation',
    sectionTitle: 'Orientation',
    subtitle: 'horizontal vs vertical.',
    minHeight: 280,
  ),
  RiseUsagePublicConfig(
    slug: 'with-icons',
    sectionTitle: 'With icons',
    subtitle: 'Icon-only segments in a row.',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'full-width',
    sectionTitle: 'Full width',
    subtitle: 'fullWidth: true — equal flex segments.',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'disabled',
    sectionTitle: 'Disabled state',
    subtitle: 'Group isDisabled; allowEnabledWhenGroupDisabled on one segment.',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'without-separator',
    sectionTitle: 'Without separator',
    subtitle: 'Omit RiseButtonGroupSeparator for a flush join.',
    minHeight: 120,
  ),
];
