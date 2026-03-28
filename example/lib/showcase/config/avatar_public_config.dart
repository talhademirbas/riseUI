import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kAvatarComponentId = 'avatar';

const String kAvatarTitle = 'Avatar';

const String kAvatarDescription =
    'Circular profile image, initials, or custom child — aligned with HeroUI v3 '
    '[avatar.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/avatar/avatar.tsx), '
    '[avatar.styles.ts](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/src/components/avatar/avatar.styles.ts), '
    'and [avatar.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/avatar.css) '
    '(Radix primitive + `bg-default` / soft surfaces, `text-sm` · `text-base` lg).';

const List<RiseUsagePublicConfig> kAvatarUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle:
        'Default story: three columns — text/icon fallbacks, `img.heroui.chat` portraits, and asset swatches — matching Hero Storybook `Template`.',
    minHeight: 360,
  ),
  RiseUsagePublicConfig(
    slug: 'with-delay',
    sectionTitle: 'With delay',
    subtitle:
        'Deferred image load (`WithDelay`): placeholder initials, then the same portrait as Hero (`u=3`).',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'sizes',
    sectionTitle: 'Sizes',
    subtitle: '`sm` · `md` · `lg` — `size-8` / `size-10` / `size-12` with chat portraits (`Sizes`).',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'colors',
    sectionTitle: 'Colors',
    subtitle: 'Solid fallbacks: `DF` `AC` `SC` `WR` `DG` — `WithColors` in Hero stories.',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'variants',
    sectionTitle: 'Variants',
    subtitle:
        'Matrix: letter / letter soft / icon / icon soft / img × accent · default · success · warning · danger (`Variants`).',
    minHeight: 420,
  ),
  RiseUsagePublicConfig(
    slug: 'fallback',
    sectionTitle: 'Fallback',
    subtitle: 'Text · icon · broken URL · gradient custom fallback (`Fallback`).',
    minHeight: 140,
  ),
  RiseUsagePublicConfig(
    slug: 'group',
    sectionTitle: 'Avatar group',
    subtitle: 'Overlapping stack, `ring-background`, portrait + circle rows + `+5` (`Group`).',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'custom-styles',
    sectionTitle: 'Custom content',
    subtitle: 'Accent soft slot with icon (`Icon` inherits fallback colors from `color` / `variant`).',
    minHeight: 100,
  ),
];
