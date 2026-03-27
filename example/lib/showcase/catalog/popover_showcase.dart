import 'package:flutter/widgets.dart';

import '../../embed/docs_embed_popover.dart';
import '../config/popover_public_config.dart';
import '../rise_showcase_models.dart';

final Map<String, Widget Function(BuildContext context)> _popoverBuilders = {
  'usage': DocsEmbedPopover.usage,
  'with-arrow': DocsEmbedPopover.withArrow,
  'placement': DocsEmbedPopover.placement,
  'interactive-content': DocsEmbedPopover.interactiveContent,
  'custom-trigger': DocsEmbedPopover.customTrigger,
};

final RiseComponentShowcase risePopoverShowcase = RiseComponentShowcase(
  componentId: kPopoverComponentId,
  title: kPopoverTitle,
  description: kPopoverDescription,
  usages: [
    for (final c in kPopoverUsagePublicConfigs)
      RiseUsageVariant(
        slug: c.slug,
        sectionTitle: c.sectionTitle,
        subtitle: c.subtitle,
        minHeight: c.minHeight,
        builder: _popoverBuilders[c.slug]!,
      ),
  ],
);

Widget? buildPopoverDocsEmbed(BuildContext context, String embedId) {
  const prefix = 'popover-';
  if (!embedId.startsWith(prefix)) return null;
  final slug = embedId.substring(prefix.length);
  final builder = _popoverBuilders[slug];
  return builder?.call(context);
}
