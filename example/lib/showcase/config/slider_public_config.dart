import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kSliderComponentId = 'slider';

const String kSliderTitle = 'Slider';

const String kSliderDescription =
    'Single and range sliders with label/output row, vertical layout, and HeroUI-aligned track '
    'styling — see heroui.com/docs/react/components/slider and slider.css.';

const List<RiseUsagePublicConfig> kSliderUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Label, value output, and accent track (default 0–100).',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'vertical',
    sectionTitle: 'Vertical',
    subtitle: 'Orientation vertical — output, track, label.',
    minHeight: 280,
  ),
  RiseUsagePublicConfig(
    slug: 'range',
    sectionTitle: 'Range',
    subtitle: 'Two thumbs with combined output (e.g. price band).',
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
