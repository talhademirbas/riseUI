import 'package:flutter/widgets.dart';

import '../../embed/docs_embed_alert.dart';
import '../config/alert_public_config.dart';
import '../rise_showcase_models.dart';

final Map<String, Widget Function(BuildContext context)> _alertBuilders = {
  'usage': DocsEmbedAlert.usage,
  'accent': DocsEmbedAlert.accent,
  'success': DocsEmbedAlert.success,
  'warning': DocsEmbedAlert.warning,
  'danger': DocsEmbedAlert.danger,
  'custom-indicator': DocsEmbedAlert.customIndicator,
  'with-actions': DocsEmbedAlert.withActions,
};

final RiseComponentShowcase riseAlertShowcase = RiseComponentShowcase(
  componentId: kAlertComponentId,
  title: kAlertTitle,
  description: kAlertDescription,
  usages: [
    for (final c in kAlertUsagePublicConfigs)
      RiseUsageVariant(
        slug: c.slug,
        sectionTitle: c.sectionTitle,
        subtitle: c.subtitle,
        minHeight: c.minHeight,
        builder: _alertBuilders[c.slug]!,
      ),
  ],
);

Widget? buildAlertDocsEmbed(BuildContext context, String embedId) {
  const prefix = 'alert-';
  if (!embedId.startsWith(prefix)) return null;
  final slug = embedId.substring(prefix.length);
  final builder = _alertBuilders[slug];
  return builder?.call(context);
}
