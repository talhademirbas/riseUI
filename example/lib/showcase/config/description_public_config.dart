import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kDescriptionComponentId = 'description';

const String kDescriptionTitle = 'Description';

const String kDescriptionDescription =
    'Supplementary helper text for form fields — aligned with HeroUI Description and description.css.';

const List<RiseUsagePublicConfig> kDescriptionUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Muted helper copy.',
    minHeight: 100,
  ),
  RiseUsagePublicConfig(
    slug: 'with-form-field',
    sectionTitle: 'With form field',
    subtitle: '`RiseLabel` + `RiseDescription` + `RiseInput`.',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'with-text-field',
    sectionTitle: 'With text field',
    subtitle: '`RiseTextField` uses `helperText` for the same role.',
    minHeight: 140,
  ),
];
