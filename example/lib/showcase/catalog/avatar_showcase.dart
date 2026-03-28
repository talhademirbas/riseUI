import 'package:flutter/widgets.dart';

import '../../embed/docs_embed_avatar.dart';
import '../config/avatar_public_config.dart';
import '../rise_showcase_models.dart';

final Map<String, Widget Function(BuildContext context)> _avatarBuilders = {
  'usage': DocsEmbedAvatar.usage,
  'with-delay': DocsEmbedAvatar.withDelay,
  'sizes': DocsEmbedAvatar.sizes,
  'colors': DocsEmbedAvatar.colors,
  'variants': DocsEmbedAvatar.variants,
  'fallback': DocsEmbedAvatar.fallback,
  'group': DocsEmbedAvatar.group,
  'custom-styles': DocsEmbedAvatar.customStyles,
};

final RiseComponentShowcase riseAvatarShowcase = RiseComponentShowcase(
  componentId: kAvatarComponentId,
  title: kAvatarTitle,
  description: kAvatarDescription,
  usages: [
    for (final c in kAvatarUsagePublicConfigs)
      RiseUsageVariant(
        slug: c.slug,
        sectionTitle: c.sectionTitle,
        subtitle: c.subtitle,
        minHeight: c.minHeight,
        builder: _avatarBuilders[c.slug]!,
      ),
  ],
);

Widget? buildAvatarDocsEmbed(BuildContext context, String embedId) {
  const prefix = 'avatar-';
  if (!embedId.startsWith(prefix)) return null;
  final slug = embedId.substring(prefix.length);
  final builder = _avatarBuilders[slug];
  return builder?.call(context);
}
