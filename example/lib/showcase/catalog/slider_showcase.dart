import 'package:flutter/widgets.dart';

import '../../embed/docs_embed_slider.dart';
import '../config/slider_public_config.dart';
import '../rise_showcase_models.dart';

final Map<String, Widget Function(BuildContext context)> _sliderBuilders = {
  'usage': DocsEmbedSlider.usage,
  'vertical': DocsEmbedSlider.vertical,
  'range': DocsEmbedSlider.range,
  'disabled': DocsEmbedSlider.disabled,
  'custom-format': DocsEmbedSlider.customFormat,
};

final RiseComponentShowcase riseSliderShowcase = RiseComponentShowcase(
  componentId: kSliderComponentId,
  title: kSliderTitle,
  description: kSliderDescription,
  usages: [
    for (final c in kSliderUsagePublicConfigs)
      RiseUsageVariant(
        slug: c.slug,
        sectionTitle: c.sectionTitle,
        subtitle: c.subtitle,
        minHeight: c.minHeight,
        builder: _sliderBuilders[c.slug]!,
      ),
  ],
);

Widget? buildSliderDocsEmbed(BuildContext context, String embedId) {
  const prefix = 'slider-';
  if (!embedId.startsWith(prefix)) return null;
  final slug = embedId.substring(prefix.length);
  final builder = _sliderBuilders[slug];
  return builder?.call(context);
}
