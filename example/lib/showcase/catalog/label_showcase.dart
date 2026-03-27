import 'package:flutter/widgets.dart';

import '../../embed/docs_embed_label.dart';
import '../config/label_public_config.dart';
import '../rise_showcase_models.dart';

final Map<String, Widget Function(BuildContext context)> _labelBuilders = {
  'usage': DocsEmbedLabel.usage,
  'required': DocsEmbedLabel.required,
  'disabled': DocsEmbedLabel.disabled,
  'invalid': DocsEmbedLabel.invalid,
  'with-input': DocsEmbedLabel.withInput,
};

final RiseComponentShowcase riseLabelShowcase = RiseComponentShowcase(
  componentId: kLabelComponentId,
  title: kLabelTitle,
  description: kLabelDescription,
  usages: [
    for (final c in kLabelUsagePublicConfigs)
      RiseUsageVariant(
        slug: c.slug,
        sectionTitle: c.sectionTitle,
        subtitle: c.subtitle,
        minHeight: c.minHeight,
        builder: _labelBuilders[c.slug]!,
      ),
  ],
);

Widget? buildLabelDocsEmbed(BuildContext context, String embedId) {
  const prefix = 'label-';
  if (!embedId.startsWith(prefix)) return null;
  final slug = embedId.substring(prefix.length);
  final builder = _labelBuilders[slug];
  return builder?.call(context);
}
