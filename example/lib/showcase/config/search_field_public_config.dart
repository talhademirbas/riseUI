import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kSearchFieldComponentId = 'search-field';
const String kSearchFieldTitle = 'SearchField';
const String kSearchFieldDescription =
    'Search input with leading icon, clear button, validation, and variants — aligned with HeroUI SearchField and search-field.css.';

const List<RiseUsagePublicConfig> kSearchFieldUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Basic search input.',
    minHeight: 140,
  ),
  RiseUsagePublicConfig(
    slug: 'with-description',
    sectionTitle: 'With description',
    subtitle: 'Label + helper text.',
    minHeight: 170,
  ),
  RiseUsagePublicConfig(
    slug: 'required',
    sectionTitle: 'Required field',
    subtitle: 'Required indicator with helper text.',
    minHeight: 170,
  ),
  RiseUsagePublicConfig(
    slug: 'validation',
    sectionTitle: 'Validation',
    subtitle: 'Invalid state with field error.',
    minHeight: 190,
  ),
  RiseUsagePublicConfig(
    slug: 'disabled',
    sectionTitle: 'Disabled',
    subtitle: 'Non-interactive search field.',
    minHeight: 150,
  ),
  RiseUsagePublicConfig(
    slug: 'controlled',
    sectionTitle: 'Controlled',
    subtitle: 'External value and clear action.',
    minHeight: 190,
  ),
  RiseUsagePublicConfig(
    slug: 'full-width',
    sectionTitle: 'Full width',
    subtitle: 'Stretches to available width.',
    minHeight: 140,
  ),
  RiseUsagePublicConfig(
    slug: 'variants',
    sectionTitle: 'Variants',
    subtitle: 'primary and secondary styles.',
    minHeight: 180,
  ),
];
