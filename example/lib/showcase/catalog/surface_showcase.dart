import 'package:flutter/widgets.dart';

import '../../embed/docs_embed_surface.dart';
import '../config/surface_public_config.dart';
import '../rise_showcase_models.dart';

final Map<String, Widget Function(BuildContext context)> _surfaceBuilders = {
  'usage': DocsEmbedSurface.usage,
  'with-form': DocsEmbedSurface.withForm,
};

final RiseComponentShowcase riseSurfaceShowcase = RiseComponentShowcase(
  componentId: kSurfaceComponentId,
  title: kSurfaceTitle,
  description: kSurfaceDescription,
  usages: [
    for (final c in kSurfaceUsagePublicConfigs)
      RiseUsageVariant(
        slug: c.slug,
        sectionTitle: c.sectionTitle,
        subtitle: c.subtitle,
        minHeight: c.minHeight,
        builder: _surfaceBuilders[c.slug]!,
      ),
  ],
);

Widget? buildSurfaceDocsEmbed(BuildContext context, String embedId) {
  const prefix = 'surface-';
  if (!embedId.startsWith(prefix)) return null;
  final slug = embedId.substring(prefix.length);
  final builder = _surfaceBuilders[slug];
  return builder?.call(context);
}
