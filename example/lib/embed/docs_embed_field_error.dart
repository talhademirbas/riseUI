import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

class DocsEmbedFieldError {
  DocsEmbedFieldError._();

  static Widget _wrap(Widget child) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kDocsEmbedMaxWidth),
        child: child,
      ),
    );
  }

  static Widget usage(BuildContext context) => _wrap(const _FieldErrorUsageEmbed());
  static Widget visibility(BuildContext context) => _wrap(const _FieldErrorVisibilityEmbed());
  static Widget basicValidation(BuildContext context) => _wrap(const _FieldErrorBasicValidationEmbed());
  static Widget dynamicMessage(BuildContext context) => _wrap(const _FieldErrorDynamicMessageEmbed());
  static Widget multipleMessages(BuildContext context) => _wrap(const _FieldErrorMultipleMessagesEmbed());
}

class _FieldErrorUsageEmbed extends StatelessWidget {
  const _FieldErrorUsageEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseFieldError(
      visible: true,
      child: Text('Username must be at least 3 characters'),
    );
  }
}

class _FieldErrorVisibilityEmbed extends StatefulWidget {
  const _FieldErrorVisibilityEmbed();

  @override
  State<_FieldErrorVisibilityEmbed> createState() => _FieldErrorVisibilityEmbedState();
}

class _FieldErrorVisibilityEmbedState extends State<_FieldErrorVisibilityEmbed> {
  var _showError = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Switch(
              value: _showError,
              onChanged: (v) => setState(() => _showError = v),
            ),
            const Text('Show error'),
          ],
        ),
        const SizedBox(height: 8),
        RiseFieldError(
          visible: _showError,
          child: const Text('This field has a validation error.'),
        ),
      ],
    );
  }
}

class _FieldErrorBasicValidationEmbed extends StatefulWidget {
  const _FieldErrorBasicValidationEmbed();

  @override
  State<_FieldErrorBasicValidationEmbed> createState() => _FieldErrorBasicValidationEmbedState();
}

class _FieldErrorBasicValidationEmbedState extends State<_FieldErrorBasicValidationEmbed> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final value = _controller.text;
    final isInvalid = value.isNotEmpty && value.length < 3;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _controller,
          onChanged: (_) => setState(() {}),
          decoration: const InputDecoration(
            labelText: 'Username',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 6),
        RiseFieldError(
          visible: isInvalid,
          child: const Text('Username must be at least 3 characters'),
        ),
      ],
    );
  }
}

class _FieldErrorDynamicMessageEmbed extends StatefulWidget {
  const _FieldErrorDynamicMessageEmbed();

  @override
  State<_FieldErrorDynamicMessageEmbed> createState() => _FieldErrorDynamicMessageEmbedState();
}

class _FieldErrorDynamicMessageEmbedState extends State<_FieldErrorDynamicMessageEmbed> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final password = _controller.text;
    final errors = <String>[
      if (password.length < 8) 'Must be at least 8 characters',
      if (!RegExp(r'[A-Z]').hasMatch(password)) 'Must include one uppercase letter',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _controller,
          onChanged: (_) => setState(() {}),
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 6),
        RiseFieldError(
          visible: errors.isNotEmpty,
          child: Text(errors.join(', ')),
        ),
      ],
    );
  }
}

class _FieldErrorMultipleMessagesEmbed extends StatefulWidget {
  const _FieldErrorMultipleMessagesEmbed();

  @override
  State<_FieldErrorMultipleMessagesEmbed> createState() => _FieldErrorMultipleMessagesEmbedState();
}

class _FieldErrorMultipleMessagesEmbedState extends State<_FieldErrorMultipleMessagesEmbed> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final username = _controller.text;
    final errors = <String>[
      if (username.length < 3) 'Use at least 3 characters.',
      if (username.contains(' ')) 'Spaces are not allowed.',
      if (RegExp(r'[^a-zA-Z0-9_]').hasMatch(username)) 'Only letters, numbers, and underscore.',
    ];
    final show = username.isNotEmpty && errors.isNotEmpty;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _controller,
          onChanged: (_) => setState(() {}),
          decoration: const InputDecoration(
            labelText: 'Username',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 6),
        RiseFieldError(
          visible: show,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [for (final e in errors) Text('- $e')],
          ),
        ),
      ],
    );
  }
}
