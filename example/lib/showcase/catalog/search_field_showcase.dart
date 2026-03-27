import 'package:flutter/widgets.dart';

import '../../embed/docs_embed_search_field.dart';
import '../config/search_field_public_config.dart';
import '../rise_showcase_models.dart';

final Map<String, Widget Function(BuildContext context)> _searchFieldBuilders = {
  'usage': DocsEmbedSearchField.usage,
  'with-description': DocsEmbedSearchField.withDescription,
  'required': DocsEmbedSearchField.required,
  'validation': DocsEmbedSearchField.validation,
  'disabled': DocsEmbedSearchField.disabled,
  'controlled': DocsEmbedSearchField.controlled,
  'full-width': DocsEmbedSearchField.fullWidth,
  'variants': DocsEmbedSearchField.variants,
};

final RiseComponentShowcase riseSearchFieldShowcase = RiseComponentShowcase(
  componentId: kSearchFieldComponentId,
  title: kSearchFieldTitle,
  description: kSearchFieldDescription,
  usages: [
    for (final c in kSearchFieldUsagePublicConfigs)
      RiseUsageVariant(
        slug: c.slug,
        sectionTitle: c.sectionTitle,
        subtitle: c.subtitle,
        minHeight: c.minHeight,
        builder: _searchFieldBuilders[c.slug]!,
      ),
  ],
);

Widget? buildSearchFieldDocsEmbed(BuildContext context, String embedId) {
  const prefix = 'search-field-';
  if (!embedId.startsWith(prefix)) return null;
  final slug = embedId.substring(prefix.length);
  final builder = _searchFieldBuilders[slug];
  return builder?.call(context);
}
