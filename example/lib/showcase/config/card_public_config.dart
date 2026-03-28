import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kCardComponentId = 'card';

const String kCardTitle = 'Card';

const String kCardDescription =
    'Rounded container with HeroUI variants (transparent, default, secondary, tertiary) and '
    'compound slots for header, title, description, content, and footer — see '
    '[Card](https://heroui.com/docs/react/components/card), '
    '[card.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/card/card.tsx), '
    'and [card.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/card.css).';

const List<RiseUsagePublicConfig> kCardUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Header, title, description, content, and footer with a primary action.',
    minHeight: 280,
  ),
  RiseUsagePublicConfig(
    slug: 'variants',
    sectionTitle: 'Variants',
    subtitle: 'transparent, standard (default surface), secondary, tertiary.',
    minHeight: 360,
  ),
  RiseUsagePublicConfig(
    slug: 'horizontal',
    sectionTitle: 'Horizontal layout',
    subtitle: 'Media + copy; stacks on narrow widths (Hero horizontal / md:flex-row).',
    minHeight: 240,
  ),
  RiseUsagePublicConfig(
    slug: 'with-avatar',
    sectionTitle: 'With avatar',
    subtitle: 'Community rows with large avatar, title, members, and byline — Hero With Avatar story.',
    minHeight: 260,
  ),
  RiseUsagePublicConfig(
    slug: 'with-images',
    sectionTitle: 'With images',
    subtitle: 'Hero-style media header card plus secondary payment / community cards.',
    minHeight: 520,
  ),
  RiseUsagePublicConfig(
    slug: 'with-form',
    sectionTitle: 'With form',
    subtitle: 'Login-style fields and footer actions (Hero With Form).',
    minHeight: 320,
  ),
];
