import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kDescriptionComponentId = 'description';

const String kDescriptionTitle = 'Description';

const String kDescriptionDescription =
    'Supplementary helper text for form fields and component chrome — aligned with HeroUI '
    'Description (heroui.com/docs/react/components/description) and description.css.';

const List<RiseUsagePublicConfig> kDescriptionUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Muted helper text under a label.',
    minHeight: 100,
  ),
  RiseUsagePublicConfig(
    slug: 'with-form-field',
    sectionTitle: 'With form field',
    subtitle: 'Label + input + helper text stack.',
    minHeight: 170,
  ),
  RiseUsagePublicConfig(
    slug: 'with-text-field',
    sectionTitle: 'Integration with text field',
    subtitle: 'Description used below RiseTextField.',
    minHeight: 140,
  ),
];
