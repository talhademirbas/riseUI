import 'package:flutter/widgets.dart';

import '../../embed/docs_embed_field_error.dart';
import '../config/field_error_public_config.dart';
import '../rise_showcase_models.dart';

final Map<String, Widget Function(BuildContext context)> _fieldErrorBuilders = {
  'usage': DocsEmbedFieldError.usage,
  'basic-validation': DocsEmbedFieldError.basicValidation,
  'dynamic-message': DocsEmbedFieldError.dynamicMessage,
  'multiple-messages': DocsEmbedFieldError.multipleMessages,
};

final RiseComponentShowcase riseFieldErrorShowcase = RiseComponentShowcase(
  componentId: kFieldErrorComponentId,
  title: kFieldErrorTitle,
  description: kFieldErrorDescription,
  usages: [
    for (final c in kFieldErrorUsagePublicConfigs)
      RiseUsageVariant(
        slug: c.slug,
        sectionTitle: c.sectionTitle,
        subtitle: c.subtitle,
        minHeight: c.minHeight,
        builder: _fieldErrorBuilders[c.slug]!,
      ),
  ],
);

Widget? buildFieldErrorDocsEmbed(BuildContext context, String embedId) {
  const prefix = 'field-error-';
  if (!embedId.startsWith(prefix)) return null;
  final slug = embedId.substring(prefix.length);
  final builder = _fieldErrorBuilders[slug];
  return builder?.call(context);
}
