import 'package:flutter/widgets.dart';

import '../../embed/docs_embed_text_area.dart';
import '../config/text_area_public_config.dart';
import '../rise_showcase_models.dart';

final Map<String, Widget Function(BuildContext context)> _textAreaBuilders = {
  'usage': DocsEmbedTextArea.usage,
  'controlled': DocsEmbedTextArea.controlled,
  'rows': DocsEmbedTextArea.rows,
  'full-width': DocsEmbedTextArea.fullWidth,
  'variants': DocsEmbedTextArea.variants,
};

final RiseComponentShowcase riseTextAreaShowcase = RiseComponentShowcase(
  componentId: kTextAreaComponentId,
  title: kTextAreaTitle,
  description: kTextAreaDescription,
  usages: [
    for (final c in kTextAreaUsagePublicConfigs)
      RiseUsageVariant(
        slug: c.slug,
        sectionTitle: c.sectionTitle,
        subtitle: c.subtitle,
        minHeight: c.minHeight,
        builder: _textAreaBuilders[c.slug]!,
      ),
  ],
);

Widget? buildTextAreaDocsEmbed(BuildContext context, String embedId) {
  const prefix = 'text-area-';
  if (!embedId.startsWith(prefix)) return null;
  final slug = embedId.substring(prefix.length);
  final builder = _textAreaBuilders[slug];
  return builder?.call(context);
}
