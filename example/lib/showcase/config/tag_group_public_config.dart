import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kTagGroupComponentId = 'tag-group';

const String kTagGroupTitle = 'TagGroup';

const String kTagGroupDescription =
    'Selectable tag list with sizes, variants, removal, and field chrome — aligned with '
    'HeroUI TagGroup (heroui.com/docs/react/components/tag-group) and tag-group.css.';

const List<RiseUsagePublicConfig> kTagGroupUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Multi-select tags with accent selection styling.',
    minHeight: 160,
  ),
  RiseUsagePublicConfig(
    slug: 'sizes',
    sectionTitle: 'Sizes',
    subtitle: 'sm · md · lg.',
    minHeight: 260,
  ),
  RiseUsagePublicConfig(
    slug: 'variants',
    sectionTitle: 'Variants',
    subtitle: 'default (outlined) vs surface (muted fill).',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'disabled',
    sectionTitle: 'Disabled',
    subtitle: 'Whole group disabled, or per-tag disabledKeys.',
    minHeight: 220,
  ),
  RiseUsagePublicConfig(
    slug: 'selection-modes',
    sectionTitle: 'Selection modes',
    subtitle: 'single vs multiple.',
    minHeight: 240,
  ),
  RiseUsagePublicConfig(
    slug: 'with-icons',
    sectionTitle: 'With icons',
    subtitle: 'Leading icon per tag via leadingBuilder.',
    minHeight: 140,
  ),
  RiseUsagePublicConfig(
    slug: 'with-remove',
    sectionTitle: 'With remove button',
    subtitle: 'onRemove removes items from the list.',
    minHeight: 160,
  ),
  RiseUsagePublicConfig(
    slug: 'with-error',
    sectionTitle: 'With error message',
    subtitle: 'Label, description, and validation line.',
    minHeight: 200,
  ),
];
