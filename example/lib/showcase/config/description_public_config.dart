import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kDescriptionComponentId = 'description';

const String kDescriptionTitle = 'Description';

const String kDescriptionDescription =
    'Supplementary helper text (`text-xs`, muted, wrapping) — aligned with HeroUI Description '
    '(heroui.com/docs/native/components/description) and description.css in heroui v3.';

const List<RiseUsagePublicConfig> kDescriptionUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Standalone helper copy (Hero `.description`).',
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
    subtitle: '`RiseTextField` `helperText` for the same role.',
    minHeight: 140,
  ),
  RiseUsagePublicConfig(
    slug: 'long-wrap',
    sectionTitle: 'Long text wrap',
    subtitle: 'Narrow width + long string (`text-wrap` / break-words).',
    minHeight: 100,
  ),
];
