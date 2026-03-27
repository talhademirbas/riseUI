import 'package:flutter/widgets.dart';

import '../../embed/docs_embed_switch.dart';
import '../config/switch_public_config.dart';
import '../rise_showcase_models.dart';

final Map<String, Widget Function(BuildContext context)> _switchBuilders = {
  'usage': DocsEmbedSwitch.usage,
  'disabled': DocsEmbedSwitch.disabled,
  'sizes': DocsEmbedSwitch.sizes,
  'label-position': DocsEmbedSwitch.labelPosition,
  'with-description': DocsEmbedSwitch.withDescription,
  'with-icons': DocsEmbedSwitch.withIcons,
  'group': DocsEmbedSwitch.group,
  'group-horizontal': DocsEmbedSwitch.groupHorizontal,
};

final RiseComponentShowcase riseSwitchShowcase = RiseComponentShowcase(
  componentId: kSwitchComponentId,
  title: kSwitchTitle,
  description: kSwitchDescription,
  usages: [
    for (final c in kSwitchUsagePublicConfigs)
      RiseUsageVariant(
        slug: c.slug,
        sectionTitle: c.sectionTitle,
        subtitle: c.subtitle,
        minHeight: c.minHeight,
        builder: _switchBuilders[c.slug]!,
      ),
  ],
);

Widget? buildSwitchDocsEmbed(BuildContext context, String embedId) {
  const prefix = 'switch-';
  if (!embedId.startsWith(prefix)) return null;
  final slug = embedId.substring(prefix.length);
  final builder = _switchBuilders[slug];
  return builder?.call(context);
}
