import 'package:flutter/widgets.dart';

import '../../embed/docs_embed_chip.dart';
import '../config/chip_public_config.dart';
import '../rise_showcase_models.dart';

final Map<String, Widget Function(BuildContext context)> _chipBuilders = {
  'usage': DocsEmbedChip.usage,
  'sizes': DocsEmbedChip.sizes,
  'with-icons': DocsEmbedChip.withIcons,
  'statuses': DocsEmbedChip.statuses,
  'variants': DocsEmbedChip.variants,
};

final RiseComponentShowcase riseChipShowcase = RiseComponentShowcase(
  componentId: kChipComponentId,
  title: kChipTitle,
  description: kChipDescription,
  usages: [
    for (final c in kChipUsagePublicConfigs)
      RiseUsageVariant(
        slug: c.slug,
        sectionTitle: c.sectionTitle,
        subtitle: c.subtitle,
        minHeight: c.minHeight,
        builder: _chipBuilders[c.slug]!,
      ),
  ],
);

Widget? buildChipDocsEmbed(BuildContext context, String embedId) {
  const prefix = 'chip-';
  if (!embedId.startsWith(prefix)) return null;
  final slug = embedId.substring(prefix.length);
  final builder = _chipBuilders[slug];
  return builder?.call(context);
}
