import 'package:flutter/widgets.dart';

import '../../embed/docs_embed_scroll_shadow.dart';
import '../config/scroll_shadow_public_config.dart';
import '../rise_showcase_models.dart';

final Map<String, Widget Function(BuildContext context)> _scrollShadowBuilders = {
  'usage': DocsEmbedScrollShadow.usage,
  'horizontal': DocsEmbedScrollShadow.horizontal,
  'hide-scrollbar': DocsEmbedScrollShadow.hideScrollbar,
  'custom-size': DocsEmbedScrollShadow.customSize,
  'visibility-state': DocsEmbedScrollShadow.visibilityState,
  'with-card': DocsEmbedScrollShadow.withCard,
};

final RiseComponentShowcase riseScrollShadowShowcase = RiseComponentShowcase(
  componentId: kScrollShadowComponentId,
  title: kScrollShadowTitle,
  description: kScrollShadowDescription,
  usages: [
    for (final c in kScrollShadowUsagePublicConfigs)
      RiseUsageVariant(
        slug: c.slug,
        sectionTitle: c.sectionTitle,
        subtitle: c.subtitle,
        minHeight: c.minHeight,
        builder: _scrollShadowBuilders[c.slug]!,
      ),
  ],
);

Widget? buildScrollShadowDocsEmbed(BuildContext context, String embedId) {
  const prefix = 'scroll-shadow-';
  if (!embedId.startsWith(prefix)) return null;
  final slug = embedId.substring(prefix.length);
  final builder = _scrollShadowBuilders[slug];
  return builder?.call(context);
}
