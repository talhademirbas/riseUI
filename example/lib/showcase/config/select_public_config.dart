import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kSelectComponentId = 'select';
const String kSelectTitle = 'Select';
const String kSelectDescription =
    'Field-style trigger, overlay list, sections, and multi-select — aligned with HeroUI '
    '[select.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/select/select.tsx), '
    '[select.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/select.css), '
    'and Storybook `Components/Pickers/Select`.';

const List<RiseUsagePublicConfig> kSelectUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Story `Default`: controlled single select, state list.',
    minHeight: 180,
  ),
  RiseUsagePublicConfig(
    slug: 'with-description',
    sectionTitle: 'With description',
    subtitle: '`WithDescription`: label + helper (select hides description when invalid).',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'with-disabled-options',
    sectionTitle: 'With disabled options',
    subtitle: '`WithDisabledOptions`: non-selectable rows.',
    minHeight: 180,
  ),
  RiseUsagePublicConfig(
    slug: 'required',
    sectionTitle: 'Required form',
    subtitle: '`Required`: two fields + submit (mirrors HeroUI form story).',
    minHeight: 340,
  ),
  RiseUsagePublicConfig(
    slug: 'full-width',
    sectionTitle: 'Full width',
    subtitle: '`FullWidth`: `.select--full-width` / full-width trigger.',
    minHeight: 180,
  ),
  RiseUsagePublicConfig(
    slug: 'variants',
    sectionTitle: 'Variants',
    subtitle: '`Variants`: primary (`shadow-field`) vs secondary (`shadow-none`).',
    minHeight: 240,
  ),
  RiseUsagePublicConfig(
    slug: 'multiple-select',
    sectionTitle: 'Multiple select',
    subtitle: '`MultipleSelect`: checkmarks, menu stays open (`closeOnActivate: false`).',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'with-sections',
    sectionTitle: 'With sections',
    subtitle: '`WithSections`: grouped list headers.',
    minHeight: 220,
  ),
  RiseUsagePublicConfig(
    slug: 'custom-indicator',
    sectionTitle: 'Custom indicator',
    subtitle: '`CustomIndicator`: replace chevron.',
    minHeight: 180,
  ),
  RiseUsagePublicConfig(
    slug: 'custom-value',
    sectionTitle: 'Custom value',
    subtitle: '`CustomValue`: `triggerValueBuilder` + avatars in the trigger.',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'controlled',
    sectionTitle: 'Controlled',
    subtitle: '`Controlled`: external state + summary line.',
    minHeight: 220,
  ),
  RiseUsagePublicConfig(
    slug: 'disabled',
    sectionTitle: 'Disabled',
    subtitle: '`Disabled`: non-interactive trigger.',
    minHeight: 180,
  ),
];
