import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

class DocsEmbedTextArea {
  DocsEmbedTextArea._();

  static Widget _wrap(Widget child) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kDocsEmbedMaxWidth),
        child: child,
      ),
    );
  }

  static Widget usage(BuildContext context) => _wrap(const _TextAreaUsageEmbed());
  static Widget controlled(BuildContext context) => _wrap(const _TextAreaControlledEmbed());
  static Widget rows(BuildContext context) => _wrap(const _TextAreaRowsEmbed());
  static Widget fullWidth(BuildContext context) => _wrap(const _TextAreaFullWidthEmbed());
  static Widget variants(BuildContext context) => _wrap(const _TextAreaVariantsEmbed());
}

class _TextAreaUsageEmbed extends StatelessWidget {
  const _TextAreaUsageEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseTextArea(
      placeholder: 'Type your message…',
      rows: 3,
      maxLines: 8,
    );
  }
}

class _TextAreaControlledEmbed extends StatefulWidget {
  const _TextAreaControlledEmbed();

  @override
  State<_TextAreaControlledEmbed> createState() => _TextAreaControlledEmbedState();
}

class _TextAreaControlledEmbedState extends State<_TextAreaControlledEmbed> {
  final _controller = TextEditingController();
  static const _max = 280;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseTextArea(
          controller: _controller,
          rows: 3,
          maxLines: 6,
          maxLength: _max,
          onChanged: (_) => setState(() {}),
        ),
        const SizedBox(height: 8),
        Text('Characters: ${_controller.text.length} / $_max'),
      ],
    );
  }
}

class _TextAreaRowsEmbed extends StatelessWidget {
  const _TextAreaRowsEmbed();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseTextArea(
          labelText: 'Short feedback',
          hintText: 'A few lines…',
          rows: 2,
          maxLines: 4,
        ),
        SizedBox(height: 12),
        RiseTextArea(
          labelText: 'Detailed notes',
          hintText: 'More room to write…',
          rows: 5,
          maxLines: 10,
        ),
      ],
    );
  }
}

class _TextAreaFullWidthEmbed extends StatelessWidget {
  const _TextAreaFullWidthEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseTextArea(
      fullWidth: true,
      placeholder: 'Full width textarea',
      rows: 4,
      maxLines: 8,
    );
  }
}

class _TextAreaVariantsEmbed extends StatelessWidget {
  const _TextAreaVariantsEmbed();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseTextArea(
          fullWidth: true,
          variant: RiseTextAreaVariant.primary,
          placeholder: 'Primary textarea',
          rows: 3,
          maxLines: 6,
        ),
        SizedBox(height: 10),
        RiseTextArea(
          fullWidth: true,
          variant: RiseTextAreaVariant.secondary,
          placeholder: 'Secondary textarea',
          rows: 3,
          maxLines: 6,
        ),
      ],
    );
  }
}
