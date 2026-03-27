import 'package:flutter/widgets.dart';

import '../../embed/docs_embed_button.dart';
import '../config/button_public_config.dart';
import '../rise_showcase_models.dart';

final Map<String, Widget Function(BuildContext context)> _buttonBuilders = {
  'usage': DocsEmbedButton.usage,
  'variants': DocsEmbedButton.variants,
  'with-icons': DocsEmbedButton.withIcons,
  'icon-only': DocsEmbedButton.iconOnly,
  'loading': DocsEmbedButton.loading,
  'loading-state': DocsEmbedButton.loadingState,
  'sizes': DocsEmbedButton.sizes,
  'full-width': DocsEmbedButton.fullWidth,
  'disabled': DocsEmbedButton.disabled,
  'social-buttons': DocsEmbedButton.socialButtons,
  'compound-label': DocsEmbedButton.compoundLabel,
};

final RiseComponentShowcase riseButtonShowcase = RiseComponentShowcase(
  componentId: kButtonComponentId,
  title: kButtonTitle,
  description: kButtonDescription,
  usages: [
    for (final c in kButtonUsagePublicConfigs)
      RiseUsageVariant(
        slug: c.slug,
        sectionTitle: c.sectionTitle,
        subtitle: c.subtitle,
        minHeight: c.minHeight,
        builder: _buttonBuilders[c.slug]!,
      ),
  ],
);

Widget? buildButtonDocsEmbed(BuildContext context, String embedId) {
  const prefix = 'button-';
  if (!embedId.startsWith(prefix)) return null;
  final slug = embedId.substring(prefix.length);
  final builder = _buttonBuilders[slug];
  return builder?.call(context);
}
