import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kScrollShadowComponentId = 'scroll-shadow';

const String kScrollShadowTitle = 'Scroll shadow';

const String kScrollShadowDescription =
    'Edge fade overlays when content overflows — aligned with HeroUI ScrollShadow, scroll-shadow.tsx, '
    'and scroll-shadow.css (vertical / horizontal, size, offset, hide scrollbar, visibility).';

const List<RiseUsagePublicConfig> kScrollShadowUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Vertical list: fades at the top and/or bottom when there is more content.',
    minHeight: 260,
  ),
  RiseUsagePublicConfig(
    slug: 'horizontal',
    sectionTitle: 'Horizontal',
    subtitle: 'Axis.horizontal with a horizontal ListView.',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'hide-scrollbar',
    sectionTitle: 'Hide scrollbar',
    subtitle: 'Hero hideScrollBar — thumb and track hidden for Material scrollbars.',
    minHeight: 260,
  ),
  RiseUsagePublicConfig(
    slug: 'custom-size',
    sectionTitle: 'Custom shadow size',
    subtitle: 'Hero size prop (fade extent in logical pixels, default 40).',
    minHeight: 260,
  ),
  RiseUsagePublicConfig(
    slug: 'visibility-state',
    sectionTitle: 'Visibility state',
    subtitle: 'onVisibilityChange when visibility is auto (both · top · bottom · none for vertical).',
    minHeight: 280,
  ),
  RiseUsagePublicConfig(
    slug: 'with-card',
    sectionTitle: 'Inside surface',
    subtitle: 'ScrollShadow inside a padded RiseSurface shell.',
    minHeight: 360,
  ),
];
