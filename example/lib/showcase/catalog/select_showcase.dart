import 'package:flutter/widgets.dart';

import '../../embed/docs_embed_select.dart';
import '../config/select_public_config.dart';
import '../rise_showcase_models.dart';

final Map<String, Widget Function(BuildContext context)> _selectBuilders = {
  'usage': DocsEmbedSelect.usage,
  'with-description': DocsEmbedSelect.withDescription,
  'with-disabled-options': DocsEmbedSelect.withDisabledOptions,
  'required': DocsEmbedSelect.required,
  'full-width': DocsEmbedSelect.fullWidth,
  'variants': DocsEmbedSelect.variants,
  'multiple-select': DocsEmbedSelect.multipleSelect,
  'with-sections': DocsEmbedSelect.withSections,
  'custom-indicator': DocsEmbedSelect.customIndicator,
  'custom-value': DocsEmbedSelect.customValue,
  'controlled': DocsEmbedSelect.controlled,
  'disabled': DocsEmbedSelect.disabled,
};

final RiseComponentShowcase riseSelectShowcase = RiseComponentShowcase(
  componentId: kSelectComponentId,
  title: kSelectTitle,
  description: kSelectDescription,
  usages: [
    for (final c in kSelectUsagePublicConfigs)
      RiseUsageVariant(
        slug: c.slug,
        sectionTitle: c.sectionTitle,
        subtitle: c.subtitle,
        minHeight: c.minHeight,
        builder: _selectBuilders[c.slug]!,
      ),
  ],
);

Widget? buildSelectDocsEmbed(BuildContext context, String embedId) {
  const prefix = 'select-';
  if (!embedId.startsWith(prefix)) return null;
  final slug = embedId.substring(prefix.length);
  final builder = _selectBuilders[slug];
  return builder?.call(context);
}
