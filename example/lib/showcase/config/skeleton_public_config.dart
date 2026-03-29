import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kSkeletonComponentId = 'skeleton';

const String kSkeletonTitle = 'Skeleton';

const String kSkeletonDescription =
    'Loading placeholders matching HeroUI v3 '
    '[Skeleton](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/skeleton/skeleton.tsx), '
    '[skeleton.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/skeleton.css), '
    'and Storybook '
    '[skeleton.stories.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/skeleton/skeleton.stories.tsx) '
    '(Default / Grid / SingleShimmer templates).';

const List<RiseUsagePublicConfig> kSkeletonUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Default story — 200px surface card, hero block + three `h-3` lines (`rounded-lg`).',
    minHeight: 240,
  ),
  RiseUsagePublicConfig(
    slug: 'text-content',
    sectionTitle: 'Text content',
    subtitle: 'Stacked lines with `space-y-3`-style spacing.',
    minHeight: 140,
  ),
  RiseUsagePublicConfig(
    slug: 'user-profile',
    sectionTitle: 'User profile',
    subtitle: 'Avatar circle + two text lines.',
    minHeight: 100,
  ),
  RiseUsagePublicConfig(
    slug: 'list-items',
    sectionTitle: 'List items',
    subtitle: 'Repeated row pattern (line + short pill).',
    minHeight: 220,
  ),
  RiseUsagePublicConfig(
    slug: 'animation-types',
    sectionTitle: 'Animation types',
    subtitle: 'Shimmer, pulse (`animate-pulse`), and none — `h-24` blocks.',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'grid',
    sectionTitle: 'Grid',
    subtitle: 'Storybook `Grid` — 450× row, three `h-24` `rounded-xl` cells, `gap-4`.',
    minHeight: 140,
  ),
  RiseUsagePublicConfig(
    slug: 'synchronized-shimmer',
    sectionTitle: 'Synchronized shimmer',
    subtitle: 'Storybook `SingleShimmer` geometry — [RiseSkeletonSyncShimmer] shares one sweep phase.',
    minHeight: 140,
  ),
];
