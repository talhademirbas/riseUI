import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kSliderComponentId = 'slider';

const String kSliderTitle = 'Slider';

const String kSliderDescription =
    'Single and range sliders with label/output row, vertical layout, and HeroUI-aligned track '
    '(heroui.com/docs/react/components/slider, slider.tsx, slider.css in heroui v3).';

const List<RiseUsagePublicConfig> kSliderUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Label + output row, h-5 track, accent fill (HeroUI Default).',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'vertical',
    sectionTitle: 'Vertical',
    subtitle: 'Output · track · label (HeroUI Vertical).',
    minHeight: 280,
  ),
  RiseUsagePublicConfig(
    slug: 'range',
    sectionTitle: 'Range',
    subtitle: 'Two thumbs, combined output (HeroUI Range).',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'disabled',
    sectionTitle: 'Disabled',
    subtitle: 'Non-interactive slider.',
    minHeight: 100,
  ),
  RiseUsagePublicConfig(
    slug: 'custom-format',
    sectionTitle: 'Custom format',
    subtitle: 'formatValue / formatRange for currency-style labels.',
    minHeight: 120,
  ),
];
