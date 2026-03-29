import 'package:flutter/widgets.dart';

import '../../embed/docs_embed_input_group.dart';
import '../config/input_group_public_config.dart';
import '../rise_showcase_models.dart';

final Map<String, Widget Function(BuildContext context)> _inputGroupBuilders = {
  'usage': DocsEmbedInputGroup.usage,
  'text-prefix': DocsEmbedInputGroup.textPrefix,
  'text-suffix': DocsEmbedInputGroup.textSuffix,
  'icon-prefix-text-suffix': DocsEmbedInputGroup.iconPrefixTextSuffix,
  'copy-suffix': DocsEmbedInputGroup.copySuffix,
  'icon-prefix-copy-suffix': DocsEmbedInputGroup.iconPrefixCopySuffix,
  'loading': DocsEmbedInputGroup.loading,
  'keyboard-shortcut': DocsEmbedInputGroup.keyboardShortcut,
  'badge-suffix': DocsEmbedInputGroup.badgeSuffix,
  'required-field': DocsEmbedInputGroup.requiredField,
  'validation': DocsEmbedInputGroup.validation,
  'disabled': DocsEmbedInputGroup.disabled,
  'with-suffix': DocsEmbedInputGroup.withSuffix,
  'prefix-and-suffix': DocsEmbedInputGroup.prefixAndSuffix,
  'password-toggle': DocsEmbedInputGroup.passwordToggle,
  'variants': DocsEmbedInputGroup.variants,
  'full-width': DocsEmbedInputGroup.fullWidth,
  'invalid': DocsEmbedInputGroup.invalid,
};

final RiseComponentShowcase riseInputGroupShowcase = RiseComponentShowcase(
  componentId: kInputGroupComponentId,
  title: kInputGroupTitle,
  description: kInputGroupDescription,
  usages: [
    for (final c in kInputGroupUsagePublicConfigs)
      RiseUsageVariant(
        slug: c.slug,
        sectionTitle: c.sectionTitle,
        subtitle: c.subtitle,
        minHeight: c.minHeight,
        builder: _inputGroupBuilders[c.slug]!,
      ),
  ],
);

Widget? buildInputGroupDocsEmbed(BuildContext context, String embedId) {
  const prefix = 'input-group-';
  if (!embedId.startsWith(prefix)) return null;
  final slug = embedId.substring(prefix.length);
  final builder = _inputGroupBuilders[slug];
  return builder?.call(context);
}
