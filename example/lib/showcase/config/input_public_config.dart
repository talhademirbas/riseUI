import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kInputComponentId = 'input';
const String kInputTitle = 'Input';
const String kInputDescription =
    'Primitive single-line field with HeroUI variants (`primary` / `secondary`), `fullWidth`, '
    'hover/focus/invalid styling, and surface contexts — aligned with HeroUI Input, input.tsx, and input.css.';

const List<RiseUsagePublicConfig> kInputUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Placeholder and default styling.',
    minHeight: 110,
  ),
  RiseUsagePublicConfig(
    slug: 'variants',
    sectionTitle: 'Variants',
    subtitle: 'Primary (shadow-field) vs secondary (flat).',
    minHeight: 150,
  ),
  RiseUsagePublicConfig(
    slug: 'input-types',
    sectionTitle: 'Input types',
    subtitle: 'Email, number, and password.',
    minHeight: 220,
  ),
  RiseUsagePublicConfig(
    slug: 'controlled',
    sectionTitle: 'Controlled',
    subtitle: 'Value driven from state.',
    minHeight: 130,
  ),
  RiseUsagePublicConfig(
    slug: 'full-width',
    sectionTitle: 'Full width',
    subtitle: 'Stretch + secondary input on a surface block (Hero FullWidth story).',
    minHeight: 340,
  ),
  RiseUsagePublicConfig(
    slug: 'on-surfaces',
    sectionTitle: 'On surfaces',
    subtitle: 'Default, secondary, tertiary, and transparent surfaces (Hero OnSurfaces story).',
    minHeight: 720,
  ),
  RiseUsagePublicConfig(
    slug: 'invalid',
    sectionTitle: 'Invalid',
    subtitle: 'data-invalid / danger border and fill.',
    minHeight: 110,
  ),
  RiseUsagePublicConfig(
    slug: 'disabled',
    sectionTitle: 'Disabled',
    subtitle: 'Disabled opacity and border.',
    minHeight: 110,
  ),
];
