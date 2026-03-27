/// Flutter-agnostic accordion showcase metadata (single source for Dart registry + JSON manifest + docs).
///
/// When adding a variant: add a row here, map the slug in [accordion_showcase.dart] builders, and
/// add the matching code string in `apps/docs/.../showcase-code-maps.ts`.
const String kAccordionComponentId = 'accordion';

const String kAccordionTitle = 'Accordion';

const String kAccordionDescription =
    'Collapsible panels with a compound API (trigger, indicator, content). '
    'Defaults align with HeroUI v3 — text-sm triggers, muted body, motion tokens, optional surface shell.';

/// Public fields for one usage row (no [Widget] — safe for `dart run` manifest tooling).
class RiseUsagePublicConfig {
  const RiseUsagePublicConfig({
    required this.slug,
    required this.sectionTitle,
    this.subtitle,
    this.minHeight = 320,
  });

  final String slug;
  final String sectionTitle;
  final String? subtitle;
  final double minHeight;

  String embedId(String componentId) => '$componentId-$slug';
}

const List<RiseUsagePublicConfig> kAccordionUsagePublicConfigs = [
  RiseUsagePublicConfig(
    slug: 'faq',
    sectionTitle: 'Usage · Default',
    subtitle:
        'Full-width accordion with hairline separators and no outer chrome (HeroUI `variant="default"`). '
        'Triggers use 14px / font-medium; body uses muted 14px text; chevron 250ms; panel 200ms.',
    minHeight: 420,
  ),
  RiseUsagePublicConfig(
    slug: 'surface',
    sectionTitle: 'Usage · Surface',
    subtitle:
        'Rounded 24px `RiseThemeData.surface` shell (`RiseAccordionDecorations.surface`), wider padding, inset separators — HeroUI `variant="surface"`.',
    minHeight: 340,
  ),
  RiseUsagePublicConfig(
    slug: 'multiple',
    sectionTitle: 'Usage · Multiple expanded',
    subtitle: 'Set `selectionMode: RiseAccordionSelectionMode.multiple`.',
    minHeight: 280,
  ),
  RiseUsagePublicConfig(
    slug: 'custom-indicator',
    sectionTitle: 'Usage · Custom indicator',
    subtitle: '`RiseAccordionIndicator` with `child` and `expandedTurns` (e.g. 0.125 for a 45° plus).',
    minHeight: 200,
  ),
  RiseUsagePublicConfig(
    slug: 'custom-indicator-variants',
    sectionTitle: 'Usage · Custom indicator variants',
    subtitle: 'Plus, caret, and arrow rows — each uses a custom indicator child.',
    minHeight: 280,
  ),
  RiseUsagePublicConfig(
    slug: 'disabled-root',
    sectionTitle: 'Usage · Disabled (root)',
    subtitle: '`isDisabled: true` on `RiseAccordion`.',
    minHeight: 220,
  ),
  RiseUsagePublicConfig(
    slug: 'disabled-items',
    sectionTitle: 'Usage · Disabled (items)',
    subtitle: 'Per-item `isDisabled`.',
    minHeight: 220,
  ),
  RiseUsagePublicConfig(
    slug: 'without-separator',
    sectionTitle: 'Usage · Without separator',
    subtitle: '`hideSeparator: true`.',
    minHeight: 220,
  ),
  RiseUsagePublicConfig(
    slug: 'custom-render',
    sectionTitle: 'Usage · Custom render',
    subtitle: '`RiseAccordionItem.render` exposes `isExpanded` / `value` to the builder.',
    minHeight: 220,
  ),
  RiseUsagePublicConfig(
    slug: 'faq-layout',
    sectionTitle: 'Usage · FAQ layout',
    subtitle:
        'Page title, subtitle, section labels (General, Licensing, …) and one `RiseAccordion` per section — HeroUI FAQ story.',
    minHeight: 560,
  ),
  RiseUsagePublicConfig(
    slug: 'custom-styles',
    sectionTitle: 'Usage · Custom styles',
    subtitle: 'Rich triggers: title + subtitle in the trigger row; body in `RiseAccordionContent`.',
    minHeight: 380,
  ),
];
