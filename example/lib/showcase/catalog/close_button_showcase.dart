import 'package:flutter/widgets.dart';

import '../../embed/docs_embed_close_button.dart';
import '../config/close_button_public_config.dart';
import '../rise_showcase_models.dart';

final Map<String, Widget Function(BuildContext context)> _closeButtonBuilders = {
  'usage': DocsEmbedCloseButton.usage,
  'with-custom-icon': DocsEmbedCloseButton.withCustomIcon,
  'interactive': DocsEmbedCloseButton.interactive,
};

final RiseComponentShowcase riseCloseButtonShowcase = RiseComponentShowcase(
  componentId: kCloseButtonComponentId,
  title: kCloseButtonTitle,
  description: kCloseButtonDescription,
  usages: [
    for (final c in kCloseButtonUsagePublicConfigs)
      RiseUsageVariant(
        slug: c.slug,
        sectionTitle: c.sectionTitle,
        subtitle: c.subtitle,
        minHeight: c.minHeight,
        builder: _closeButtonBuilders[c.slug]!,
      ),
  ],
);

Widget? buildCloseButtonDocsEmbed(BuildContext context, String embedId) {
  const prefix = 'close-button-';
  if (!embedId.startsWith(prefix)) return null;
  final slug = embedId.substring(prefix.length);
  final builder = _closeButtonBuilders[slug];
  return builder?.call(context);
}
