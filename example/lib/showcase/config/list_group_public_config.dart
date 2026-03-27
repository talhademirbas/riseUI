import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kListGroupComponentId = 'list-group';

const String kListGroupTitle = 'List group';

const String kListGroupDescription =
    'Surface-backed grouped rows with prefix, title, description, and suffix slots — aligned with HeroUI Native '
    '[ListGroup](https://heroui.com/docs/native/components/list-group) and '
    '[list-group.tsx](https://github.com/heroui-inc/heroui-native/tree/main/src/components/list-group).';

const List<RiseUsagePublicConfig> kListGroupUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Basic usage',
    subtitle: 'Title and description rows with inset separators (Hero `Separator className="mx-4"`).',
    minHeight: 220,
  ),
  RiseUsagePublicConfig(
    slug: 'with-icons',
    sectionTitle: 'With icons',
    subtitle: 'ItemPrefix at 22px; default suffix chevron at 16px.',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'title-only',
    sectionTitle: 'Title only',
    subtitle: 'Omit description; leading icon + title + chevron.',
    minHeight: 180,
  ),
  RiseUsagePublicConfig(
    slug: 'surface-variants',
    sectionTitle: 'Surface variants',
    subtitle: 'default / secondary / tertiary / transparent shells on [RiseSurface].',
    minHeight: 420,
  ),
  RiseUsagePublicConfig(
    slug: 'custom-suffix',
    sectionTitle: 'Custom suffix',
    subtitle: 'Trailing arrow, description as value, and a semantic chip.',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'suffix-props',
    sectionTitle: 'Suffix icon props',
    subtitle: 'Chevron size 18 and custom muted color via [RiseListGroupItemSuffix].',
    minHeight: 140,
  ),
  RiseUsagePublicConfig(
    slug: 'full-layout',
    sectionTitle: 'Sectioned layout',
    subtitle: '“Account” / “Preferences” labels and two groups — Hero example structure.',
    minHeight: 480,
  ),
];
