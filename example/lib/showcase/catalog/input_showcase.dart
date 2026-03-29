import 'package:flutter/widgets.dart';

import '../../embed/docs_embed_input.dart';
import '../config/input_public_config.dart';
import '../rise_showcase_models.dart';

final Map<String, Widget Function(BuildContext context)> _inputBuilders = {
  'usage': DocsEmbedInput.usage,
  'variants': DocsEmbedInput.variants,
  'input-types': DocsEmbedInput.inputTypes,
  'controlled': DocsEmbedInput.controlled,
  'full-width': DocsEmbedInput.fullWidth,
  'on-surfaces': DocsEmbedInput.onSurfaces,
  'invalid': DocsEmbedInput.invalid,
  'disabled': DocsEmbedInput.disabled,
};

final RiseComponentShowcase riseInputShowcase = RiseComponentShowcase(
  componentId: kInputComponentId,
  title: kInputTitle,
  description: kInputDescription,
  usages: [
    for (final c in kInputUsagePublicConfigs)
      RiseUsageVariant(
        slug: c.slug,
        sectionTitle: c.sectionTitle,
        subtitle: c.subtitle,
        minHeight: c.minHeight,
        builder: _inputBuilders[c.slug]!,
      ),
  ],
);

Widget? buildInputDocsEmbed(BuildContext context, String embedId) {
  const prefix = 'input-';
  if (!embedId.startsWith(prefix)) return null;
  final slug = embedId.substring(prefix.length);
  final builder = _inputBuilders[slug];
  return builder?.call(context);
}
