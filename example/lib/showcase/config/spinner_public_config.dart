import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kSpinnerComponentId = 'spinner';

const String kSpinnerTitle = 'Spinner';

const String kSpinnerDescription =
    'Vector spinner from HeroUI v3 '
    '[spinner.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/spinner/spinner.tsx) '
    'SVG paths + gradients, sizes `sm`–`xl` and colors from '
    '[spinner.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/spinner.css), '
    'with Storybook layouts from '
    '[spinner.stories.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/spinner/spinner.stories.tsx).';

const List<RiseUsagePublicConfig> kSpinnerUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Default — `current` color via IconTheme (`spinner--current`, md size).',
    minHeight: 100,
  ),
  RiseUsagePublicConfig(
    slug: 'colors',
    sectionTitle: 'Colors',
    subtitle: 'Accent → Current → Success → Warning → Danger (`gap-8`, `text-xs` / muted labels).',
    minHeight: 140,
  ),
  RiseUsagePublicConfig(
    slug: 'sizes',
    sectionTitle: 'Sizes',
    subtitle: 'sm, md, lg, xl with Small … Extra Large labels (Hero `Sizes` story).',
    minHeight: 140,
  ),
  RiseUsagePublicConfig(
    slug: 'loading-flag',
    sectionTitle: 'Loading flag',
    subtitle: 'isLoading: false → [SizedBox.shrink()] (Flutter-only convenience).',
    minHeight: 80,
  ),
];
