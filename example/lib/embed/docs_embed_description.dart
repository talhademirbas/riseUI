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
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseLabel(child: Text('Email')),
        SizedBox(height: 4),
        RiseDescription(
          child: Text("We'll never share your email with anyone else."),
        ),
      ],
    );
  }
}

class _DescriptionWithFormFieldEmbed extends StatelessWidget {
  const _DescriptionWithFormFieldEmbed();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseLabel(child: Text('Password')),
        SizedBox(height: 6),
        TextField(
          decoration: InputDecoration(
            hintText: 'Enter your password',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 6),
        RiseDescription(
          child: Text('Must be at least 8 characters with one uppercase letter.'),
        ),
      ],
    );
  }
}

class _DescriptionWithTextFieldEmbed extends StatelessWidget {
  const _DescriptionWithTextFieldEmbed();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseTextField(
          labelText: 'Project name',
          hintText: 'Rise UI kit',
        ),
        SizedBox(height: 6),
        RiseDescription(
          child: Text('Used in URLs and dashboard headers.'),
        ),
      ],
    );
  }
}
