import 'button_public_config.dart' show RiseUsagePublicConfig;

/// Flutter-agnostic toast showcase metadata (example app + docs manifest + embed ids).
const String kToastComponentId = 'toast';

const String kToastTitle = 'Toast';

const String kToastDescription =
    'Surface notifications with semantic title + muted description — HeroUI v3 '
    '[toast.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/toast/toast.tsx), '
    '[toast.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/toast.css), '
    '[toast.stories.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/toast/toast.stories.tsx).';

const List<RiseUsagePublicConfig> kToastUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'hero-stories',
    sectionTitle: 'HeroUI story parity',
    subtitle:
        'Default / Accent (`toast.info`) / Success / Warning / Danger with description, indicator, and action — mirrors Storybook `Template`.',
    minHeight: 320,
  ),
  RiseUsagePublicConfig(
    slug: 'placements',
    sectionTitle: 'Placements',
    subtitle:
        '`RiseToastPlacement`: top · top-start · top-end · bottom · bottom-start · bottom-end (toast-region placements in toast.css).',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'loading',
    sectionTitle: 'Loading',
    subtitle:
        '`isLoading: true` shows [RiseSpinner] in the indicator slot; `duration: Duration.zero` keeps the toast until dismissed.',
    minHeight: 160,
  ),
];
