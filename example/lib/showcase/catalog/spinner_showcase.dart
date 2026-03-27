import 'package:flutter/widgets.dart';

import '../../embed/docs_embed_spinner.dart';
import '../config/spinner_public_config.dart';
import '../rise_showcase_models.dart';

final Map<String, Widget Function(BuildContext context)> _spinnerBuilders = {
  'usage': DocsEmbedSpinner.usage,
  'colors': DocsEmbedSpinner.colors,
  'sizes': DocsEmbedSpinner.sizes,
  'loading-flag': DocsEmbedSpinner.loadingFlag,
};

final RiseComponentShowcase riseSpinnerShowcase = RiseComponentShowcase(
  componentId: kSpinnerComponentId,
  title: kSpinnerTitle,
  description: kSpinnerDescription,
  usages: [
    for (final c in kSpinnerUsagePublicConfigs)
      RiseUsageVariant(
        slug: c.slug,
        sectionTitle: c.sectionTitle,
        subtitle: c.subtitle,
        minHeight: c.minHeight,
        builder: _spinnerBuilders[c.slug]!,
      ),
  ],
);

Widget? buildSpinnerDocsEmbed(BuildContext context, String embedId) {
  const prefix = 'spinner-';
  if (!embedId.startsWith(prefix)) return null;
  final slug = embedId.substring(prefix.length);
  final builder = _spinnerBuilders[slug];
  return builder?.call(context);
}
