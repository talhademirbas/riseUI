import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kSpinnerComponentId = 'spinner';

const String kSpinnerTitle = 'Spinner';

const String kSpinnerDescription =
    'Loading indicator with HeroUI-aligned sizes (sm–xl), semantic colors including current '
    '(inherits icon/text color), and continuous rotation — see '
    '[Spinner](https://heroui.com/docs/react/components/spinner), '
    '[spinner.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/spinner/spinner.tsx), '
    'and [spinner.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/spinner.css).';

const List<RiseUsagePublicConfig> kSpinnerUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Default spinner (md, current color).',
    minHeight: 100,
  ),
  RiseUsagePublicConfig(
    slug: 'colors',
    sectionTitle: 'Colors',
    subtitle: 'current, accent, success, warning, danger.',
    minHeight: 140,
  ),
  RiseUsagePublicConfig(
    slug: 'sizes',
    sectionTitle: 'Sizes',
    subtitle: 'sm, md, lg, xl — match HeroUI size tokens.',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'loading-flag',
    sectionTitle: 'Loading flag',
    subtitle: 'isLoading: false renders no space (optional).',
    minHeight: 80,
  ),
];
