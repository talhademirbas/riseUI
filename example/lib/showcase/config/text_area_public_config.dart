import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kTextAreaComponentId = 'text-area';
const String kTextAreaTitle = 'TextArea';
const String kTextAreaDescription =
    'Multiline control with HeroUI field tokens — '
    '[textarea.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/textarea/textarea.tsx), '
    '[textarea.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/textarea.css) '
    '(`rounded-field`, `px-3`/`py-2`, `min-height: 38px`, primary/secondary, Storybook `Components/Forms/Textarea`).';

const List<RiseUsagePublicConfig> kTextAreaUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Story `Default`: placeholder, rows, maxLines.',
    minHeight: 180,
  ),
  RiseUsagePublicConfig(
    slug: 'controlled',
    sectionTitle: 'Controlled',
    subtitle: 'Character count with `maxLength` (like a capped message).',
    minHeight: 220,
  ),
  RiseUsagePublicConfig(
    slug: 'rows',
    sectionTitle: 'Rows',
    subtitle: 'Different `rows` / `minLines` for short vs tall fields.',
    minHeight: 280,
  ),
  RiseUsagePublicConfig(
    slug: 'full-width',
    sectionTitle: 'Full width',
    subtitle: '`.textarea--full-width` — stretch to container.',
    minHeight: 180,
  ),
  RiseUsagePublicConfig(
    slug: 'variants',
    sectionTitle: 'Variants',
    subtitle: '`Variants`: primary (`shadow-field`) vs secondary (`shadow-none`).',
    minHeight: 240,
  ),
  RiseUsagePublicConfig(
    slug: 'disabled',
    sectionTitle: 'Disabled',
    subtitle: '`[data-disabled]` / non-interactive.',
    minHeight: 160,
  ),
  RiseUsagePublicConfig(
    slug: 'invalid',
    sectionTitle: 'Invalid',
    subtitle: '`[data-invalid]` + error text.',
    minHeight: 200,
  ),
];
