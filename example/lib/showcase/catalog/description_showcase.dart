import 'package:flutter/widgets.dart';

import '../../embed/docs_embed_description.dart';
import '../config/description_public_config.dart';
import '../rise_showcase_models.dart';

final Map<String, Widget Function(BuildContext context)> _descriptionBuilders = {
  'usage': DocsEmbedDescription.usage,
  'with-form-field': DocsEmbedDescription.withFormField,
  'with-text-field': DocsEmbedDescription.withTextField,
};

final RiseComponentShowcase riseDescriptionShowcase = RiseComponentShowcase(
  componentId: kDescriptionComponentId,
  title: kDescriptionTitle,
  description: kDescriptionDescription,
  usages: [
    for (final c in kDescriptionUsagePublicConfigs)
      RiseUsageVariant(
        slug: c.slug,
        sectionTitle: c.sectionTitle,
        subtitle: c.subtitle,
        minHeight: c.minHeight,
        builder: _descriptionBuilders[c.slug]!,
      ),
  ],
);

Widget? buildDescriptionDocsEmbed(BuildContext context, String embedId) {
  const prefix = 'description-';
  if (!embedId.startsWith(prefix)) return null;
  final slug = embedId.substring(prefix.length);
  final builder = _descriptionBuilders[slug];
  return builder?.call(context);
}
