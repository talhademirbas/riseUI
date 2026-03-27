import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kPopoverComponentId = 'popover';
const String kPopoverTitle = 'Popover';
const String kPopoverDescription =
    'Anchored rich-content overlay with placement, arrow, and interactive content — aligned with '
    '@heroui/react Popover, popover.tsx, and popover.css.';

const List<RiseUsagePublicConfig> kPopoverUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Basic trigger + dialog content.',
    minHeight: 180,
  ),
  RiseUsagePublicConfig(
    slug: 'with-arrow',
    sectionTitle: 'With arrow',
    subtitle: 'Popover with directional arrow.',
    minHeight: 190,
  ),
  RiseUsagePublicConfig(
    slug: 'placement',
    sectionTitle: 'Placement',
    subtitle: 'Top, right, bottom, and left anchors.',
    minHeight: 260,
  ),
  RiseUsagePublicConfig(
    slug: 'interactive-content',
    sectionTitle: 'Interactive content',
    subtitle: 'Focusable content with actions inside the popover.',
    minHeight: 220,
  ),
  RiseUsagePublicConfig(
    slug: 'custom-trigger',
    sectionTitle: 'Custom trigger',
    subtitle: 'Use any custom widget as trigger.',
    minHeight: 180,
  ),
];
