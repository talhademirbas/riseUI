import 'package:flutter/widgets.dart';

import '../../embed/docs_embed_list_group.dart';
import '../config/list_group_public_config.dart';
import '../rise_showcase_models.dart';

final Map<String, Widget Function(BuildContext context)> _listGroupBuilders = {
  'usage': DocsEmbedListGroup.usage,
  'with-icons': DocsEmbedListGroup.withIcons,
  'title-only': DocsEmbedListGroup.titleOnly,
  'surface-variants': DocsEmbedListGroup.surfaceVariants,
  'custom-suffix': DocsEmbedListGroup.customSuffix,
  'suffix-props': DocsEmbedListGroup.suffixProps,
  'full-layout': DocsEmbedListGroup.fullLayout,
};

final RiseComponentShowcase riseListGroupShowcase = RiseComponentShowcase(
  componentId: kListGroupComponentId,
  title: kListGroupTitle,
  description: kListGroupDescription,
  usages: [
    for (final c in kListGroupUsagePublicConfigs)
      RiseUsageVariant(
        slug: c.slug,
        sectionTitle: c.sectionTitle,
        subtitle: c.subtitle,
        minHeight: c.minHeight,
        builder: _listGroupBuilders[c.slug]!,
      ),
  ],
);

Widget? buildListGroupDocsEmbed(BuildContext context, String embedId) {
  const prefix = 'list-group-';
  if (!embedId.startsWith(prefix)) return null;
  final slug = embedId.substring(prefix.length);
  final builder = _listGroupBuilders[slug];
  return builder?.call(context);
}
