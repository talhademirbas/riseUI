import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

class DocsEmbedInput {
  DocsEmbedInput._();

  static Widget _wrap(Widget child) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kDocsEmbedMaxWidth),
        child: child,
      ),
    );
  }

  static Widget usage(BuildContext context) => _wrap(const _InputUsageEmbed());
  static Widget inputTypes(BuildContext context) => _wrap(const _InputTypesEmbed());
  static Widget controlled(BuildContext context) => _wrap(const _InputControlledEmbed());
  static Widget fullWidth(BuildContext context) => _wrap(const _InputFullWidthEmbed());
  static Widget variants(BuildContext context) => _wrap(const _InputVariantsEmbed());
}

class _InputUsageEmbed extends StatelessWidget {
  const _InputUsageEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseInput(
      hintText: 'Enter your name',
    );
  }
}

class _InputTypesEmbed extends StatefulWidget {
  const _InputTypesEmbed();

  @override
  State<_InputTypesEmbed> createState() => _InputTypesEmbedState();
}

class _InputTypesEmbedState extends State<_InputTypesEmbed> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const RiseInput(
          keyboardType: TextInputType.emailAddress,
          hintText: 'Email',
        ),
        const SizedBox(height: 12),
        const RiseInput(
          keyboardType: TextInputType.number,
          hintText: 'Age',
        ),
        const SizedBox(height: 12),
        RiseInput(
          obscureText: _obscure,
          hintText: 'Password',
          suffixIcon: IconButton(
            icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
            onPressed: () => setState(() => _obscure = !_obscure),
          ),
        ),
      ],
    );
  }
}

class _InputControlledEmbed extends StatefulWidget {
  const _InputControlledEmbed();

  @override
  State<_InputControlledEmbed> createState() => _InputControlledEmbedState();
}

class _InputControlledEmbedState extends State<_InputControlledEmbed> {
  final _controller = TextEditingController(text: 'https://heroui.com');

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RiseInput(
      controller: _controller,
      onChanged: (_) => setState(() {}),
    );
  }
}

class _InputFullWidthEmbed extends StatelessWidget {
  const _InputFullWidthEmbed();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 400,
      child: RiseInput(
        fullWidth: true,
        hintText: 'Full width input',
      ),
    );
  }
}

class _InputVariantsEmbed extends StatelessWidget {
  const _InputVariantsEmbed();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RiseInput(
          fullWidth: true,
          hintText: 'Primary input',
          variant: RiseInputVariant.primary,
        ),
        SizedBox(height: 10),
        RiseInput(
          fullWidth: true,
          hintText: 'Secondary input',
          variant: RiseInputVariant.secondary,
        ),
      ],
    );
  }
}
