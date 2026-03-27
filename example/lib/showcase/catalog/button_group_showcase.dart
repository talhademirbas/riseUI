import 'package:flutter/widgets.dart';

import '../../embed/docs_embed_button_group.dart';
import '../config/button_group_public_config.dart';
import '../rise_showcase_models.dart';

final Map<String, Widget Function(BuildContext context)> _buttonGroupBuilders = {
  'usage': DocsEmbedButtonGroup.usage,
  'variants': DocsEmbedButtonGroup.variants,
  'sizes': DocsEmbedButtonGroup.sizes,
  'orientation': DocsEmbedButtonGroup.orientation,
  'with-icons': DocsEmbedButtonGroup.withIcons,
  'full-width': DocsEmbedButtonGroup.fullWidth,
  'disabled': DocsEmbedButtonGroup.disabled,
  'without-separator': DocsEmbedButtonGroup.withoutSeparator,
};

final RiseComponentShowcase riseButtonGroupShowcase = RiseComponentShowcase(
  componentId: kButtonGroupComponentId,
  title: kButtonGroupTitle,
  description: kButtonGroupDescription,
  usages: [
    for (final c in kButtonGroupUsagePublicConfigs)
      RiseUsageVariant(
        slug: c.slug,
        sectionTitle: c.sectionTitle,
        subtitle: c.subtitle,
        minHeight: c.minHeight,
        builder: _buttonGroupBuilders[c.slug]!,
      ),
  ],
);

Widget? buildButtonGroupDocsEmbed(BuildContext context, String embedId) {
  const prefix = 'button-group-';
  if (!embedId.startsWith(prefix)) return null;
  final slug = embedId.substring(prefix.length);
  final builder = _buttonGroupBuilders[slug];
  return builder?.call(context);
}
