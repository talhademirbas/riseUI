import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kSelectComponentId = 'select';
const String kSelectTitle = 'Select';
const String kSelectDescription =
    'Collapsible option selector with field chrome, validation states, and variants — aligned with HeroUI Select and select.css.';

const List<RiseUsagePublicConfig> kSelectUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Basic controlled single select.',
    minHeight: 170,
  ),
  RiseUsagePublicConfig(
    slug: 'with-description',
    sectionTitle: 'With description',
    subtitle: 'Label + helper text.',
    minHeight: 190,
  ),
  RiseUsagePublicConfig(
    slug: 'with-disabled-options',
    sectionTitle: 'With disabled options',
    subtitle: 'Some options are not selectable.',
    minHeight: 170,
  ),
  RiseUsagePublicConfig(
    slug: 'required',
    sectionTitle: 'Required',
    subtitle: 'Required indicator + validation.',
    minHeight: 210,
  ),
  RiseUsagePublicConfig(
    slug: 'full-width',
    sectionTitle: 'Full width',
    subtitle: 'Stretches to available width.',
    minHeight: 170,
  ),
  RiseUsagePublicConfig(
    slug: 'variants',
    sectionTitle: 'Variants',
    subtitle: 'primary and secondary trigger styles.',
    minHeight: 220,
  ),
  RiseUsagePublicConfig(
    slug: 'disabled',
    sectionTitle: 'Disabled',
    subtitle: 'Non-interactive select.',
    minHeight: 170,
  ),
];
