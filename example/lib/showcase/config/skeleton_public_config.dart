import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kSkeletonComponentId = 'skeleton';

const String kSkeletonTitle = 'Skeleton';

const String kSkeletonDescription =
    'Loading placeholders with shimmer (default), pulse, or static fill; optional synchronized '
    'shimmer host — aligned with HeroUI [Skeleton](https://heroui.com/docs/react/components/skeleton), '
    '[skeleton.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/skeleton/skeleton.tsx), '
    'and [skeleton.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/skeleton.css).';

const List<RiseUsagePublicConfig> kSkeletonUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Panel with stacked placeholder blocks (default shimmer).',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'text-content',
    sectionTitle: 'Text content',
    subtitle: 'Multiple lines via RiseSkeletonGroup.',
    minHeight: 160,
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
    subtitle: 'Shimmer, pulse, and none side by side.',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'grid',
    sectionTitle: 'Grid',
    subtitle: 'Dense grid of small blocks.',
    minHeight: 220,
  ),
  RiseUsagePublicConfig(
    slug: 'synchronized-shimmer',
    sectionTitle: 'Synchronized shimmer',
    subtitle: 'RiseSkeletonSyncShimmer — one phase shared across children.',
    minHeight: 120,
  ),
];
