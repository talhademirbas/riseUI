import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kPopoverComponentId = 'popover';
const String kPopoverTitle = 'Popover';

const String kPopoverDescription =
    'Anchored overlay matching HeroUI v3 '
    '[popover.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/popover/popover.tsx) '
    'and [popover.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/popover.css): '
    '`bg-overlay`, `rounded-3xl`, overlay shadow, dialog `p-4`, curved arrow, and placements.';

const List<RiseUsagePublicConfig> kPopoverUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Default story — heading + body + close (no arrow).',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'with-arrow',
    sectionTitle: 'With arrow',
    subtitle: '`Popover.Arrow` geometry — `M0 0 Q6 9 12 0`, placement-aware rotation.',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'placement',
    sectionTitle: 'Placement',
    subtitle: 'Top, right, bottom, left — each with arrow + anchor.',
    minHeight: 260,
  ),
  RiseUsagePublicConfig(
    slug: 'interactive-content',
    sectionTitle: 'Interactive content',
    subtitle: 'Rich body + actions (profile-style blocks).',
    minHeight: 240,
  ),
  RiseUsagePublicConfig(
    slug: 'custom-trigger',
    sectionTitle: 'Custom trigger',
    subtitle: '`Popover.Trigger`-style custom hit target.',
    minHeight: 180,
  ),
  RiseUsagePublicConfig(
    slug: 'card-help',
    sectionTitle: 'Card with helptext',
    subtitle: 'Storybook `CardWithHelptext` — help icon + `placement: right` help popover.',
    minHeight: 320,
  ),
];
