import 'button_public_config.dart' show RiseUsagePublicConfig;

/// Flutter-agnostic chip showcase metadata (example app + docs manifest + embed ids).
const String kChipComponentId = 'chip';

const String kChipTitle = 'Chip';

const String kChipDescription =
    'Inline badges — [chip.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/chip/chip.tsx), '
    '[chip.styles.ts](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/src/components/chip/chip.styles.ts), '
    '[chip.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/chip.css) '
    '(`rounded-2xl`, `text-xs`/`text-sm` lg, compound primary · soft surfaces).';

const List<RiseUsagePublicConfig> kChipUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle:
        'Storybook `Default`: `color: accent`, `variant: secondary`, child `Label` (Hero defaultArgs).',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'sizes',
    sectionTitle: 'Sizes',
    subtitle: '`sm` · `md` · `lg` — `Sizes` story (accent + secondary).',
    minHeight: 140,
  ),
  RiseUsagePublicConfig(
    slug: 'with-icons',
    sectionTitle: 'With icons',
    subtitle: '`WithIcon`: leading + `Label` + trailing (circle-outline icons).',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'statuses',
    sectionTitle: 'Statuses',
    subtitle: '`Statuses`: four variant rows × Information / Completed / Pending / Failed.',
    minHeight: 420,
  ),
  RiseUsagePublicConfig(
    slug: 'variants',
    sectionTitle: 'Variants',
    subtitle: '`Variants`: lg / md / sm blocks — variant × color matrix with icons + label.',
    minHeight: 720,
  ),
];
