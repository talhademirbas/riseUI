import 'button_public_config.dart' show RiseUsagePublicConfig;

const String kInputGroupComponentId = 'input-group';
const String kInputGroupTitle = 'InputGroup';
const String kInputGroupDescription =
    'Single chrome row with prefix/suffix slots and borderless [RiseInput] children — aligned with HeroUI '
    'InputGroup ([input-group.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/input-group/input-group.tsx), '
    '[input-group.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/input-group.css)). '
    'Focus and invalid use **border emphasis only**; hover may tint the fill slightly.';

const List<RiseUsagePublicConfig> kInputGroupUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'usage',
    sectionTitle: 'Usage',
    subtitle: 'Default: icon prefix; focus shifts border only.',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'text-prefix',
    sectionTitle: 'Text prefix',
    subtitle: 'Plain text affix (e.g. https://).',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'text-suffix',
    sectionTitle: 'Text suffix',
    subtitle: 'Trailing text (e.g. .com).',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'icon-prefix-text-suffix',
    sectionTitle: 'Icon prefix + text suffix',
    subtitle: 'Mixed affix types.',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'copy-suffix',
    sectionTitle: 'Copy button suffix',
    subtitle: 'IconButton + Clipboard.',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'icon-prefix-copy-suffix',
    sectionTitle: 'Icon prefix + copy',
    subtitle: 'Globe + copy action.',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'loading',
    sectionTitle: 'Loading state',
    subtitle: 'Spinner or trigger in suffix slot.',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'keyboard-shortcut',
    sectionTitle: 'Keyboard hint',
    subtitle: 'Suffix displays a shortcut affordance (⌘K).',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'badge-suffix',
    sectionTitle: 'Badge suffix',
    subtitle: '[RiseChip] as trailing badge.',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'required-field',
    sectionTitle: 'Required field',
    subtitle: '[RiseLabel] with isRequired + group.',
    minHeight: 150,
  ),
  RiseUsagePublicConfig(
    slug: 'validation',
    sectionTitle: 'Validation',
    subtitle: 'isInvalid + [RiseFieldError] message.',
    minHeight: 150,
  ),
  RiseUsagePublicConfig(
    slug: 'disabled',
    sectionTitle: 'Disabled',
    subtitle: 'enabled: false on the group.',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'with-suffix',
    sectionTitle: 'Icon suffix only',
    subtitle: 'Trailing icon slot.',
    minHeight: 120,
  ),
  RiseUsagePublicConfig(
    slug: 'prefix-and-suffix',
    sectionTitle: 'Currency affixes',
    subtitle: '\$ … USD.',
    minHeight: 130,
  ),
  RiseUsagePublicConfig(
    slug: 'password-toggle',
    sectionTitle: 'Password toggle',
    subtitle: 'Visibility in suffix.',
    minHeight: 130,
  ),
  RiseUsagePublicConfig(
    slug: 'variants',
    sectionTitle: 'Variants',
    subtitle: 'Primary vs secondary chrome.',
    minHeight: 160,
  ),
  RiseUsagePublicConfig(
    slug: 'full-width',
    sectionTitle: 'Full width',
    subtitle: 'Stacked email + password rows.',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'invalid',
    sectionTitle: 'Invalid chrome',
    subtitle: 'Static isInvalid styling.',
    minHeight: 120,
  ),
];
