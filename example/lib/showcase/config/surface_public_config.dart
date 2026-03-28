import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kSurfaceComponentId = 'surface';

const String kSurfaceTitle = 'Surface';

const String kSurfaceDescription =
    'Semantic containers with default, secondary, tertiary, and transparent variants, plus '
    'RiseSurfaceScope for child context — aligned HeroUI [Surface](https://heroui.com/docs/react/components/surface), '
    '[surface.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/surface/surface.tsx), '
    'and [surface.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/surface.css).';

const List<RiseUsagePublicConfig> kSurfaceUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Variants',
    subtitle:
        'Hero Storybook order: transparent, default, secondary, tertiary — each with sample Email field; base surface is shadowless (surface.css).',
    minHeight: 560,
  ),
  RiseUsagePublicConfig(
    slug: 'with-form',
    sectionTitle: 'With form fields',
    subtitle: 'Secondary [RiseTextField]s on a default surface shell (Hero With Form–style).',
    minHeight: 220,
  ),
];
