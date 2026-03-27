import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

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
}

class _DescriptionUsageEmbed extends StatelessWidget {
  const _DescriptionUsageEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseDescription(
      child: Text('Choose a username you will use across the product.'),
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
