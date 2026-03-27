import 'package:flutter/widgets.dart';

import '../../embed/docs_embed_text_field.dart';
import '../config/text_field_public_config.dart';
import '../rise_showcase_models.dart';

final Map<String, Widget Function(BuildContext context)> _textFieldBuilders = {
  'usage': DocsEmbedTextField.usage,
  'with-description': DocsEmbedTextField.withDescription,
  'required': DocsEmbedTextField.required,
  'validation': DocsEmbedTextField.validation,
  'controlled': DocsEmbedTextField.controlled,
  'error-message': DocsEmbedTextField.errorMessage,
  'disabled': DocsEmbedTextField.disabled,
  'multiline': DocsEmbedTextField.multiline,
  'input-types': DocsEmbedTextField.inputTypes,
  'full-width': DocsEmbedTextField.fullWidth,
  'in-surface': DocsEmbedTextField.inSurface,
  'variants': DocsEmbedTextField.variants,
};

final RiseComponentShowcase riseTextFieldShowcase = RiseComponentShowcase(
  componentId: kTextFieldComponentId,
  title: kTextFieldTitle,
  description: kTextFieldDescription,
  usages: [
    for (final c in kTextFieldUsagePublicConfigs)
      RiseUsageVariant(
        slug: c.slug,
        sectionTitle: c.sectionTitle,
        subtitle: c.subtitle,
        minHeight: c.minHeight,
        builder: _textFieldBuilders[c.slug]!,
      ),
  ],
);

Widget? buildTextFieldDocsEmbed(BuildContext context, String embedId) {
  const prefix = 'text-field-';
  if (!embedId.startsWith(prefix)) return null;
  final slug = embedId.substring(prefix.length);
  final builder = _textFieldBuilders[slug];
  return builder?.call(context);
}
