import 'package:flutter/widgets.dart';

import '../../embed/docs_embed_tag_group.dart';
import '../config/tag_group_public_config.dart';
import '../rise_showcase_models.dart';

final Map<String, Widget Function(BuildContext context)> _tagGroupBuilders = {
  'usage': DocsEmbedTagGroup.usage,
  'sizes': DocsEmbedTagGroup.sizes,
  'variants': DocsEmbedTagGroup.variants,
  'disabled': DocsEmbedTagGroup.disabled,
  'selection-modes': DocsEmbedTagGroup.selectionModes,
  'with-icons': DocsEmbedTagGroup.withIcons,
  'with-remove': DocsEmbedTagGroup.withRemove,
  'with-error': DocsEmbedTagGroup.withError,
};

final RiseComponentShowcase riseTagGroupShowcase = RiseComponentShowcase(
  componentId: kTagGroupComponentId,
  title: kTagGroupTitle,
  description: kTagGroupDescription,
  usages: [
    for (final c in kTagGroupUsagePublicConfigs)
      RiseUsageVariant(
        slug: c.slug,
        sectionTitle: c.sectionTitle,
        subtitle: c.subtitle,
        minHeight: c.minHeight,
        builder: _tagGroupBuilders[c.slug]!,
      ),
  ],
);

Widget? buildTagGroupDocsEmbed(BuildContext context, String embedId) {
  const prefix = 'tag-group-';
  if (!embedId.startsWith(prefix)) return null;
  final slug = embedId.substring(prefix.length);
  final builder = _tagGroupBuilders[slug];
  return builder?.call(context);
}
