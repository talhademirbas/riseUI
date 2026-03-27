import 'package:flutter/widgets.dart';

import '../../embed/docs_embed_separator.dart';
import '../config/separator_public_config.dart';
import '../rise_showcase_models.dart';

final Map<String, Widget Function(BuildContext context)> _separatorBuilders = {
  'usage': DocsEmbedSeparator.usage,
  'vertical': DocsEmbedSeparator.vertical,
  'with-content': DocsEmbedSeparator.withContent,
  'variants': DocsEmbedSeparator.variants,
  'with-surface': DocsEmbedSeparator.withSurface,
};

final RiseComponentShowcase riseSeparatorShowcase = RiseComponentShowcase(
  componentId: kSeparatorComponentId,
  title: kSeparatorTitle,
  description: kSeparatorDescription,
  usages: [
    for (final c in kSeparatorUsagePublicConfigs)
      RiseUsageVariant(
        slug: c.slug,
        sectionTitle: c.sectionTitle,
        subtitle: c.subtitle,
        minHeight: c.minHeight,
        builder: _separatorBuilders[c.slug]!,
      ),
  ],
);

Widget? buildSeparatorDocsEmbed(BuildContext context, String embedId) {
  const prefix = 'separator-';
  if (!embedId.startsWith(prefix)) return null;
  final slug = embedId.substring(prefix.length);
  final builder = _separatorBuilders[slug];
  return builder?.call(context);
}
