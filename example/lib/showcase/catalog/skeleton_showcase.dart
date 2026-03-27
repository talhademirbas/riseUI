import 'package:flutter/widgets.dart';

import '../../embed/docs_embed_skeleton.dart';
import '../config/skeleton_public_config.dart';
import '../rise_showcase_models.dart';

final Map<String, Widget Function(BuildContext context)> _skeletonBuilders = {
  'usage': DocsEmbedSkeleton.usage,
  'text-content': DocsEmbedSkeleton.textContent,
  'user-profile': DocsEmbedSkeleton.userProfile,
  'list-items': DocsEmbedSkeleton.listItems,
  'animation-types': DocsEmbedSkeleton.animationTypes,
  'grid': DocsEmbedSkeleton.grid,
  'synchronized-shimmer': DocsEmbedSkeleton.synchronizedShimmer,
};

final RiseComponentShowcase riseSkeletonShowcase = RiseComponentShowcase(
  componentId: kSkeletonComponentId,
  title: kSkeletonTitle,
  description: kSkeletonDescription,
  usages: [
    for (final c in kSkeletonUsagePublicConfigs)
      RiseUsageVariant(
        slug: c.slug,
        sectionTitle: c.sectionTitle,
        subtitle: c.subtitle,
        minHeight: c.minHeight,
        builder: _skeletonBuilders[c.slug]!,
      ),
  ],
);

Widget? buildSkeletonDocsEmbed(BuildContext context, String embedId) {
  const prefix = 'skeleton-';
  if (!embedId.startsWith(prefix)) return null;
  final slug = embedId.substring(prefix.length);
  final builder = _skeletonBuilders[slug];
  return builder?.call(context);
}
