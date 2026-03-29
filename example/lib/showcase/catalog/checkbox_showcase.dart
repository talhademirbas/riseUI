import 'package:flutter/widgets.dart';

import '../../embed/docs_embed_checkbox.dart';
import '../config/checkbox_public_config.dart';
import '../rise_showcase_models.dart';

final Map<String, Widget Function(BuildContext context)> _checkboxBuilders = {
  'usage': DocsEmbedCheckbox.usage,
  'controlled': DocsEmbedCheckbox.controlled,
  'indeterminate': DocsEmbedCheckbox.indeterminate,
  'with-description': DocsEmbedCheckbox.withDescription,
  'invalid': DocsEmbedCheckbox.invalid,
  'variants': DocsEmbedCheckbox.variants,
  'disabled': DocsEmbedCheckbox.disabled,
  'custom-indicator': DocsEmbedCheckbox.customIndicator,
  'render-props': DocsEmbedCheckbox.renderProps,
  'sizes': DocsEmbedCheckbox.sizes,
  'features': DocsEmbedCheckbox.features,
};

final RiseComponentShowcase riseCheckboxShowcase = RiseComponentShowcase(
  componentId: kCheckboxComponentId,
  title: kCheckboxTitle,
  description: kCheckboxDescription,
  usages: [
    for (final c in kCheckboxUsagePublicConfigs)
      RiseUsageVariant(
        slug: c.slug,
        sectionTitle: c.sectionTitle,
        subtitle: c.subtitle,
        minHeight: c.minHeight,
        builder: _checkboxBuilders[c.slug]!,
      ),
  ],
);

Widget? buildCheckboxDocsEmbed(BuildContext context, String embedId) {
  const prefix = 'checkbox-';
  if (!embedId.startsWith(prefix)) return null;
  final slug = embedId.substring(prefix.length);
  final builder = _checkboxBuilders[slug];
  return builder?.call(context);
}
