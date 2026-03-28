import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kScrollShadowComponentId = 'scroll-shadow';

const String kScrollShadowTitle = 'Scroll shadow';

const String kScrollShadowDescription =
    'Scroll edge hints — [scroll-shadow.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/scroll-shadow/scroll-shadow.tsx), '
    '[use-scroll-shadow.ts](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/scroll-shadow/use-scroll-shadow.ts), '
    '[scroll-shadow.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/scroll-shadow.css) '
    '(vertical / horizontal, `--scroll-shadow-size`, hide scrollbar, visibility callbacks).';

const List<RiseUsagePublicConfig> kScrollShadowUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: '`Default`: max height 240px, padding 16 — lorem paragraphs like Storybook `LoremContent`.',
    minHeight: 280,
  ),
  RiseUsagePublicConfig(
    slug: 'variants',
    sectionTitle: 'Variants',
    subtitle: 'Fade vs blur edge treatment (`RiseScrollShadowEffect` — Storybook “Fade / Blur” labels).',
    minHeight: 560,
  ),
  RiseUsagePublicConfig(
    slug: 'orientation',
    sectionTitle: 'Orientation',
    subtitle: '`Orientation`: vertical surface + horizontal doc image strip (`LoremCards`).',
    minHeight: 520,
  ),
  RiseUsagePublicConfig(
    slug: 'hide-scrollbar',
    sectionTitle: 'Hide scrollbar',
    subtitle: '`hideScrollBar` — webkit-style hidden scrollbar ([scroll-shadow.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/scroll-shadow.css) `.scroll-shadow--hide-scrollbar`).',
    minHeight: 280,
  ),
  RiseUsagePublicConfig(
    slug: 'custom-size',
    sectionTitle: 'Custom size',
    subtitle: '`CustomSize`: 20px · 40px (default) · 80px shadow extent.',
    minHeight: 720,
  ),
  RiseUsagePublicConfig(
    slug: 'visibility-state',
    sectionTitle: 'Visibility state',
    subtitle: '`VisibilityChange`: vertical + horizontal `onVisibilityChange` with state panels.',
    minHeight: 560,
  ),
  RiseUsagePublicConfig(
    slug: 'with-card',
    sectionTitle: 'With card',
    subtitle: '`WithCard`: terms shell, `height: 300`, `size: 80`, footer actions.',
    minHeight: 420,
  ),
];
