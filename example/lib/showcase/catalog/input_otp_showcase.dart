import 'package:flutter/widgets.dart';

import '../../embed/docs_embed_input_otp.dart';
import '../config/input_otp_public_config.dart';
import '../rise_showcase_models.dart';

final Map<String, Widget Function(BuildContext context)> _inputOtpBuilders = {
  'usage': DocsEmbedInputOtp.usage,
  'four-digits': DocsEmbedInputOtp.fourDigits,
  'disabled': DocsEmbedInputOtp.disabled,
  'with-pattern': DocsEmbedInputOtp.withPattern,
  'controlled': DocsEmbedInputOtp.controlled,
  'variants': DocsEmbedInputOtp.variants,
};

final RiseComponentShowcase riseInputOtpShowcase = RiseComponentShowcase(
  componentId: kInputOtpComponentId,
  title: kInputOtpTitle,
  description: kInputOtpDescription,
  usages: [
    for (final c in kInputOtpUsagePublicConfigs)
      RiseUsageVariant(
        slug: c.slug,
        sectionTitle: c.sectionTitle,
        subtitle: c.subtitle,
        minHeight: c.minHeight,
        builder: _inputOtpBuilders[c.slug]!,
      ),
  ],
);

Widget? buildInputOtpDocsEmbed(BuildContext context, String embedId) {
  const prefix = 'input-otp-';
  if (!embedId.startsWith(prefix)) return null;
  final slug = embedId.substring(prefix.length);
  final builder = _inputOtpBuilders[slug];
  return builder?.call(context);
}
