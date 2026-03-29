import 'package:flutter/widgets.dart';

import '../../embed/docs_embed_toast.dart';
import '../config/toast_public_config.dart';
import '../rise_showcase_models.dart';

final Map<String, Widget Function(BuildContext context)> _toastBuilders = {
  'hero-stories': DocsEmbedToast.heroStoriesTap,
  'placements': DocsEmbedToast.placementsTap,
  'loading': DocsEmbedToast.loadingTap,
};

final RiseComponentShowcase riseToastShowcase = RiseComponentShowcase(
  componentId: kToastComponentId,
  title: kToastTitle,
  description: kToastDescription,
  usages: [
    for (final c in kToastUsagePublicConfigs)
      RiseUsageVariant(
        slug: c.slug,
        sectionTitle: c.sectionTitle,
        subtitle: c.subtitle,
        minHeight: c.minHeight,
        builder: _toastBuilders[c.slug]!,
      ),
  ],
);

Widget? buildToastDocsEmbed(BuildContext context, String embedId) {
  const prefix = 'toast-';
  if (!embedId.startsWith(prefix)) return null;
  final slug = embedId.substring(prefix.length);
  final builder = _toastBuilders[slug];
  return builder?.call(context);
}
