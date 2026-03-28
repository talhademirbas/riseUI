import 'package:flutter/widgets.dart';

import '../../embed/docs_embed_tabs.dart';
import '../config/tabs_public_config.dart';
import '../rise_showcase_models.dart';

final Map<String, Widget Function(BuildContext context)> _tabsBuilders = {
  'usage': DocsEmbedTabs.usage,
  'vertical': DocsEmbedTabs.vertical,
  'disabled': DocsEmbedTabs.disabled,
  'custom-styles': DocsEmbedTabs.customStyles,
  'secondary': DocsEmbedTabs.secondary,
  'secondary-vertical': DocsEmbedTabs.secondaryVertical,
  'scrollable': DocsEmbedTabs.scrollable,
};

final RiseComponentShowcase riseTabsShowcase = RiseComponentShowcase(
  componentId: kTabsComponentId,
  title: kTabsTitle,
  description: kTabsDescription,
  usages: [
    for (final c in kTabsUsagePublicConfigs)
      RiseUsageVariant(
        slug: c.slug,
        sectionTitle: c.sectionTitle,
        subtitle: c.subtitle,
        minHeight: c.minHeight,
        builder: _tabsBuilders[c.slug]!,
      ),
  ],
);

Widget? buildTabsDocsEmbed(BuildContext context, String embedId) {
  const prefix = 'tabs-';
  if (!embedId.startsWith(prefix)) return null;
  final slug = embedId.substring(prefix.length);
  final builder = _tabsBuilders[slug];
  return builder?.call(context);
}
