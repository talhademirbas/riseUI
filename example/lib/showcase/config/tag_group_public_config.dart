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
    subtitle: 'Default: single selection with leading icons (HeroUI Default story).',
    minHeight: 160,
  ),
  RiseUsagePublicConfig(
    slug: 'sizes',
    sectionTitle: 'Sizes',
    subtitle: 'sm · md · lg with Label captions.',
    minHeight: 280,
  ),
  RiseUsagePublicConfig(
    slug: 'variants',
    sectionTitle: 'Variants',
    subtitle: 'default (outlined) vs surface (muted fill).',
    minHeight: 220,
  ),
  RiseUsagePublicConfig(
    slug: 'disabled',
    sectionTitle: 'Disabled',
    subtitle: 'Per-tag disabledKeys and helper copy below the list.',
    minHeight: 320,
  ),
  RiseUsagePublicConfig(
    slug: 'selection-modes',
    sectionTitle: 'Selection modes',
    subtitle: 'Single vs multiple with helper text.',
    minHeight: 300,
  ),
  RiseUsagePublicConfig(
    slug: 'controlled',
    sectionTitle: 'Controlled',
    subtitle: 'External selection state with summary line.',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'with-icons',
    sectionTitle: 'With prefix',
    subtitle: 'Icons and avatars (HeroUI WithPrefix).',
    minHeight: 360,
  ),
  RiseUsagePublicConfig(
    slug: 'with-remove',
    sectionTitle: 'With remove button',
    subtitle: 'Removable lists and empty state.',
    minHeight: 320,
  ),
  RiseUsagePublicConfig(
    slug: 'with-error',
    sectionTitle: 'With error message',
    subtitle: 'Label, dynamic description after tags, and validation line.',
    minHeight: 240,
  ),
  RiseUsagePublicConfig(
    slug: 'with-list-data',
    sectionTitle: 'With list data',
    subtitle: 'Avatars, removal, and selected summary (HeroUI WithListData).',
    minHeight: 420,
  ),
];
