import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kAvatarComponentId = 'avatar';

const String kAvatarTitle = 'Avatar';

const String kAvatarDescription =
    'Circular profile image, initials, or custom child — sized like HeroUI size-8 · size-10 · size-12, '
    'with semantic colors and solid vs soft fallback surfaces (HeroUI avatar.css / @heroui/react Avatar).';

const List<RiseUsagePublicConfig> kAvatarUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Network image, initials from `name`, or a custom `child`.',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'sizes',
    sectionTitle: 'Sizes',
    subtitle: '`sm` · `md` · `lg` — 32 / 40 / 48 px diameter (Tailwind `size-8` / `10` / `12`).',
    minHeight: 100,
  ),
  RiseUsagePublicConfig(
    slug: 'colors',
    sectionTitle: 'Colors',
    subtitle: 'Solid fallbacks: default, accent, success, warning, danger.',
    minHeight: 100,
  ),
  RiseUsagePublicConfig(
    slug: 'variants',
    sectionTitle: 'Variants',
    subtitle: '`solid` vs `soft` letter fallbacks for each color.',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'fallback',
    sectionTitle: 'Fallback',
    subtitle: 'Broken image shows initials from `name`.',
    minHeight: 100,
  ),
  RiseUsagePublicConfig(
    slug: 'group',
    sectionTitle: 'Avatar group',
    subtitle: 'Overlapping stack with ring separator (`RiseAvatarGroup`).',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'custom-styles',
    sectionTitle: 'Custom content',
    subtitle: 'Any widget as `child` (clipped to the circle).',
    minHeight: 100,
  ),
];
