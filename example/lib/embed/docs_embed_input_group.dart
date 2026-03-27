import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

class DocsEmbedInputGroup {
  DocsEmbedInputGroup._();

  static Widget _wrap(Widget child) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kDocsEmbedMaxWidth),
        child: child,
      ),
    );
  }

  static Widget usage(BuildContext context) => _wrap(const _InputGroupUsageEmbed());
  static Widget withSuffix(BuildContext context) => _wrap(const _InputGroupWithSuffixEmbed());
  static Widget prefixAndSuffix(BuildContext context) => _wrap(const _InputGroupPrefixSuffixEmbed());
  static Widget passwordToggle(BuildContext context) => _wrap(const _InputGroupPasswordToggleEmbed());
  static Widget variants(BuildContext context) => _wrap(const _InputGroupVariantsEmbed());
  static Widget fullWidth(BuildContext context) => _wrap(const _InputGroupFullWidthEmbed());
}

class _InputGroupUsageEmbed extends StatelessWidget {
  const _InputGroupUsageEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseInputGroup(
      prefix: Icon(Icons.email_outlined, color: context.riseTheme.mutedForeground(0.7)),
      children: const [
        RiseInput(hintText: 'Email address'),
      ],
    );
  }
}

class _InputGroupWithSuffixEmbed extends StatelessWidget {
  const _InputGroupWithSuffixEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseInputGroup(
      suffix: Icon(Icons.alternate_email, color: context.riseTheme.mutedForeground(0.7)),
      children: const [
        RiseInput(hintText: 'Email address'),
      ],
    );
  }
}

class _InputGroupPrefixSuffixEmbed extends StatelessWidget {
  const _InputGroupPrefixSuffixEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseInputGroup(
      prefix: Text('\$'),
      suffix: Text('USD'),
      children: [
        RiseInput(hintText: 'Set a price'),
      ],
    );
  }
}

class _InputGroupPasswordToggleEmbed extends StatefulWidget {
  const _InputGroupPasswordToggleEmbed();

  @override
  State<_InputGroupPasswordToggleEmbed> createState() => _InputGroupPasswordToggleEmbedState();
}

class _InputGroupPasswordToggleEmbedState extends State<_InputGroupPasswordToggleEmbed> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return RiseInputGroup(
      suffix: IconButton(
        onPressed: () => setState(() => _obscure = !_obscure),
        icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
      ),
      children: [
        RiseInput(
          obscureText: _obscure,
          hintText: 'Password',
        ),
      ],
    );
  }
}

class _InputGroupVariantsEmbed extends StatelessWidget {
  const _InputGroupVariantsEmbed();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RiseInputGroup(
          variant: RiseInputGroupVariant.primary,
          prefix: Icon(Icons.email_outlined),
          children: [RiseInput(hintText: 'Primary variant')],
        ),
        SizedBox(height: 10),
        RiseInputGroup(
          variant: RiseInputGroupVariant.secondary,
          prefix: Icon(Icons.email_outlined),
          children: [RiseInput(hintText: 'Secondary variant')],
        ),
      ],
    );
  }
}

class _InputGroupFullWidthEmbed extends StatelessWidget {
  const _InputGroupFullWidthEmbed();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 420,
      child: RiseInputGroup(
        fullWidth: true,
        prefix: Icon(Icons.link_outlined),
        children: [RiseInput(hintText: 'https://example.com')],
      ),
    );
  }
}
