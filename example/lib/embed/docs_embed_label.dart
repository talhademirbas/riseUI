import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

class DocsEmbedLabel {
  DocsEmbedLabel._();

  static Widget _wrap(Widget child) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kDocsEmbedMaxWidth),
        child: child,
      ),
    );
  }

  static Widget usage(BuildContext context) => _wrap(const _LabelUsageEmbed());
  static Widget required(BuildContext context) => _wrap(const _LabelRequiredEmbed());
  static Widget disabled(BuildContext context) => _wrap(const _LabelDisabledEmbed());
  static Widget invalid(BuildContext context) => _wrap(const _LabelInvalidEmbed());
  static Widget withInput(BuildContext context) => _wrap(const _LabelWithInputEmbed());
}

class _LabelUsageEmbed extends StatelessWidget {
  const _LabelUsageEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseLabel(child: Text('Email'));
  }
}

class _LabelRequiredEmbed extends StatelessWidget {
  const _LabelRequiredEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseLabel(
      isRequired: true,
      child: Text('Password'),
    );
  }
}

class _LabelDisabledEmbed extends StatelessWidget {
  const _LabelDisabledEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseLabel(
      isDisabled: true,
      child: Text('Username'),
    );
  }
}

class _LabelInvalidEmbed extends StatelessWidget {
  const _LabelInvalidEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseLabel(
      isInvalid: true,
      child: Text('Email'),
    );
  }
}

class _LabelWithInputEmbed extends StatelessWidget {
  const _LabelWithInputEmbed();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseLabel(
          isRequired: true,
          child: Text('Email address'),
        ),
        SizedBox(height: 6),
        RiseInput(
          hintText: 'name@example.com',
          keyboardType: TextInputType.emailAddress,
          fullWidth: true,
        ),
      ],
    );
  }
}
