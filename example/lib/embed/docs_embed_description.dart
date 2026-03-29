import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

/// Description demos for docs iframe (`?embed=description-*`).
///
/// Parity: HeroUI v3
/// [description.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/description/description.tsx)
/// and [description.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/description.css)
/// (`text-xs text-muted text-wrap`).
class DocsEmbedDescription {
  DocsEmbedDescription._();

  static Widget _wrap(Widget child) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kDocsEmbedMaxWidth),
        child: child,
      ),
    );
  }

  static Widget usage(BuildContext context) => _wrap(const _DescriptionUsageEmbed());

  static Widget withFormField(BuildContext context) => _wrap(const _DescriptionWithFormFieldEmbed());

  static Widget withTextField(BuildContext context) => _wrap(const _DescriptionWithTextFieldEmbed());

  static Widget longWrap(BuildContext context) => _wrap(const _DescriptionLongWrapEmbed());
}

class _DescriptionUsageEmbed extends StatelessWidget {
  const _DescriptionUsageEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseDescription(
      child: Text(
        'This text uses the default description style: 12px, muted color, and wraps naturally within the layout.',
      ),
    );
  }
}

class _DescriptionWithFormFieldEmbed extends StatelessWidget {
  const _DescriptionWithFormFieldEmbed();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseLabel.text('Nickname'),
        const SizedBox(height: 4),
        const RiseDescription(
          child: Text('Visible to other users on your profile.'),
        ),
        const SizedBox(height: 8),
        const RiseInput(hintText: 'friendly-fox'),
      ],
    );
  }
}

class _DescriptionWithTextFieldEmbed extends StatelessWidget {
  const _DescriptionWithTextFieldEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseTextField(
      labelText: 'Bio',
      placeholder: 'Tell us about yourself',
      helperText: 'A short paragraph is enough.',
    );
  }
}

/// Narrow width to demonstrate `wrap-break-word` / soft wrap (Hero `text-wrap`).
class _DescriptionLongWrapEmbed extends StatelessWidget {
  const _DescriptionLongWrapEmbed();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: RiseDescription.text(
        'https://example.com/very/long/path/that/should/wrap/within/the/container/without/overflow/',
      ),
    );
  }
}
