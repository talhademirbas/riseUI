import 'package:flutter/widgets.dart';

import '../../embed/docs_embed_card.dart';
import '../config/card_public_config.dart';
import '../rise_showcase_models.dart';

final Map<String, Widget Function(BuildContext context)> _cardBuilders = {
  'usage': DocsEmbedCard.usage,
  'variants': DocsEmbedCard.variants,
  'horizontal': DocsEmbedCard.horizontal,
  'with-avatar': DocsEmbedCard.withAvatar,
  'with-images': DocsEmbedCard.withImages,
  'with-form': DocsEmbedCard.withForm,
};

final RiseComponentShowcase riseCardShowcase = RiseComponentShowcase(
  componentId: kCardComponentId,
  title: kCardTitle,
  description: kCardDescription,
  usages: [
    for (final c in kCardUsagePublicConfigs)
      RiseUsageVariant(
        slug: c.slug,
        sectionTitle: c.sectionTitle,
        subtitle: c.subtitle,
        minHeight: c.minHeight,
        builder: _cardBuilders[c.slug]!,
      ),
  ],
);

Widget? buildCardDocsEmbed(BuildContext context, String embedId) {
  const prefix = 'card-';
  if (!embedId.startsWith(prefix)) return null;
  final slug = embedId.substring(prefix.length);
  final builder = _cardBuilders[slug];
  return builder?.call(context);
}
