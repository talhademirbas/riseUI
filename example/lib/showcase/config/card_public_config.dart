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
    subtitle: 'Row with media placeholder and stacked copy (responsive pattern).',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'with-form',
    sectionTitle: 'With form',
    subtitle: 'Stacked fields and actions inside the card.',
    minHeight: 320,
  ),
];
