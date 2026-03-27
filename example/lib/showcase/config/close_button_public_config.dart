import 'button_public_config.dart' show RiseUsagePublicConfig;

/// Flutter-agnostic close button showcase metadata (example app + docs manifest + embed ids).
const String kCloseButtonComponentId = 'close-button';

const String kCloseButtonTitle = 'CloseButton';

const String kCloseButtonDescription =
    'Compact control for closing dialogs, modals, or dismissing content — aligned with '
    '@heroui/react CloseButton (heroui.com/docs/react/components/close-button) and '
    'close-button.css (inline-flex, rounded-xl, press scale).';

const List<RiseUsagePublicConfig> kCloseButtonUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Default dismiss control; wraps RiseButton with tertiary · sm · icon-only defaults.',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'with-custom-icon',
    sectionTitle: 'With custom icon',
    subtitle: 'Replace the default Icons.close via child, or tune iconProps for size/color.',
    minHeight: 140,
  ),
  RiseUsagePublicConfig(
    slug: 'interactive',
    sectionTitle: 'Interactive',
    subtitle: 'Same component wired to local state.',
    minHeight: 160,
  ),
];
