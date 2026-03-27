import 'package:flutter/widgets.dart';

import '../../embed/docs_embed_accordion.dart';
import '../config/accordion_public_config.dart';
import '../rise_showcase_models.dart';

/// Slug → preview (e.g. `faq` → `accordion-faq` in the docs iframe).
final Map<String, Widget Function(BuildContext context)> _accordionBuilders = {
  'faq': DocsEmbedAccordion.faq,
  'surface': DocsEmbedAccordion.surface,
  'multiple': DocsEmbedAccordion.multiple,
  'custom-indicator': DocsEmbedAccordion.customIndicator,
  'custom-indicator-variants': DocsEmbedAccordion.customIndicatorVariants,
  'disabled-root': DocsEmbedAccordion.disabledRoot,
  'disabled-items': DocsEmbedAccordion.disabledItems,
  'without-separator': DocsEmbedAccordion.withoutSeparator,
  'custom-render': DocsEmbedAccordion.customRender,
  'faq-layout': DocsEmbedAccordion.faqLayout,
  'custom-styles': DocsEmbedAccordion.customStyles,
};

/// Accordion — metadata from [kAccordionUsagePublicConfigs], builders mapped by slug.
final RiseComponentShowcase riseAccordionShowcase = RiseComponentShowcase(
  componentId: kAccordionComponentId,
  title: kAccordionTitle,
  description: kAccordionDescription,
  usages: [
    for (final c in kAccordionUsagePublicConfigs)
      RiseUsageVariant(
        slug: c.slug,
        sectionTitle: c.sectionTitle,
        subtitle: c.subtitle,
        minHeight: c.minHeight,
        builder: _accordionBuilders[c.slug]!,
      ),
  ],
);

/// Resolves `?embed=accordion-{slug}` using the same [_accordionBuilders] map as the showcase.
/// (Avoids a separate full-id map drifting out of sync — root cause of “Unknown embed”.)
Widget? buildAccordionDocsEmbed(BuildContext context, String embedId) {
  const prefix = 'accordion-';
  if (!embedId.startsWith(prefix)) return null;
  final slug = embedId.substring(prefix.length);
  final builder = _accordionBuilders[slug];
  return builder?.call(context);
}
