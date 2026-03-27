import 'package:flutter/widgets.dart';

import '../../embed/docs_embed_radio.dart';
import '../config/radio_public_config.dart';
import '../rise_showcase_models.dart';

final Map<String, Widget Function(BuildContext context)> _radioBuilders = {
  'usage': DocsEmbedRadio.usage,
  'horizontal': DocsEmbedRadio.horizontal,
  'controlled': DocsEmbedRadio.controlled,
  'disabled': DocsEmbedRadio.disabled,
  'variants': DocsEmbedRadio.variants,
  'invalid': DocsEmbedRadio.invalid,
};

final RiseComponentShowcase riseRadioShowcase = RiseComponentShowcase(
  componentId: kRadioComponentId,
  title: kRadioTitle,
  description: kRadioDescription,
  usages: [
    for (final c in kRadioUsagePublicConfigs)
      RiseUsageVariant(
        slug: c.slug,
        sectionTitle: c.sectionTitle,
        subtitle: c.subtitle,
        minHeight: c.minHeight,
        builder: _radioBuilders[c.slug]!,
      ),
  ],
);

Widget? buildRadioDocsEmbed(BuildContext context, String embedId) {
  const prefix = 'radio-';
  if (!embedId.startsWith(prefix)) return null;
  final slug = embedId.substring(prefix.length);
  final builder = _radioBuilders[slug];
  return builder?.call(context);
}
