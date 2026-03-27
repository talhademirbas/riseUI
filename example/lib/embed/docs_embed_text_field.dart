import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

class DocsEmbedTextField {
  DocsEmbedTextField._();

  static Widget _wrap(Widget child) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kDocsEmbedMaxWidth),
        child: child,
      ),
    );
  }

  static Widget usage(BuildContext context) => _wrap(const _TextFieldUsageEmbed());
  static Widget withDescription(BuildContext context) => _wrap(const _TextFieldWithDescriptionEmbed());
  static Widget required(BuildContext context) => _wrap(const _TextFieldRequiredEmbed());
  static Widget validation(BuildContext context) => _wrap(const _TextFieldValidationEmbed());
  static Widget controlled(BuildContext context) => _wrap(const _TextFieldControlledEmbed());
  static Widget errorMessage(BuildContext context) => _wrap(const _TextFieldErrorMessageEmbed());
  static Widget disabled(BuildContext context) => _wrap(const _TextFieldDisabledEmbed());
  static Widget multiline(BuildContext context) => _wrap(const _TextFieldMultilineEmbed());
  static Widget inputTypes(BuildContext context) => _wrap(const _TextFieldInputTypesEmbed());
  static Widget fullWidth(BuildContext context) => _wrap(const _TextFieldFullWidthEmbed());
  static Widget inSurface(BuildContext context) => _wrap(const _TextFieldInSurfaceEmbed());
  static Widget variants(BuildContext context) => _wrap(const _TextFieldVariantsEmbed());
}

class _TextFieldUsageEmbed extends StatelessWidget {
  const _TextFieldUsageEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseTextField(
      keyboardType: TextInputType.emailAddress,
      labelText: 'Email',
      placeholder: 'Enter your email',
    );
  }
}

class _TextFieldWithDescriptionEmbed extends StatelessWidget {
  const _TextFieldWithDescriptionEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseTextField(
      labelText: 'Username',
      placeholder: 'juliam_example',
      helperText: 'Choose a unique username for your account.',
    );
  }
}

class _TextFieldRequiredEmbed extends StatelessWidget {
  const _TextFieldRequiredEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseTextField(
      isRequired: true,
      labelText: 'Full name',
      helperText: 'This field is required.',
    );
  }
}

class _TextFieldValidationEmbed extends StatefulWidget {
  const _TextFieldValidationEmbed();

  @override
  State<_TextFieldValidationEmbed> createState() => _TextFieldValidationEmbedState();
}

class _TextFieldValidationEmbedState extends State<_TextFieldValidationEmbed> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = _controller.text;
    final invalid = text.isNotEmpty && text.length < 20;
    return RiseTextField(
      controller: _controller,
      labelText: 'Bio',
      minLines: 2,
      maxLines: 4,
      isInvalid: invalid,
      errorText: invalid ? 'Minimum 20 characters required.' : null,
      helperText: invalid ? null : 'Minimum 20 characters (${text.length}/20).',
      onChanged: (_) => setState(() {}),
    );
  }
}

class _TextFieldControlledEmbed extends StatefulWidget {
  const _TextFieldControlledEmbed();

  @override
  State<_TextFieldControlledEmbed> createState() => _TextFieldControlledEmbedState();
}

class _TextFieldControlledEmbedState extends State<_TextFieldControlledEmbed> {
  final _name = TextEditingController();
  final _bio = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _bio.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final rise = context.riseTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseTextField(
          controller: _name,
          labelText: 'Display name',
          onChanged: (_) => setState(() {}),
        ),
        const SizedBox(height: 6),
        Text(
          'Characters: ${_name.text.length}',
          style: theme.textTheme.bodySmall?.copyWith(color: rise.mutedForeground(0.7)),
        ),
        const SizedBox(height: 16),
        RiseTextField(
          controller: _bio,
          labelText: 'Bio',
          minLines: 2,
          maxLines: 5,
          maxLength: 200,
          onChanged: (_) => setState(() {}),
        ),
        const SizedBox(height: 6),
        Text(
          'Characters: ${_bio.text.length} / 200',
          style: theme.textTheme.bodySmall?.copyWith(color: rise.mutedForeground(0.7)),
        ),
      ],
    );
  }
}

class _TextFieldErrorMessageEmbed extends StatelessWidget {
  const _TextFieldErrorMessageEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseTextField(
      keyboardType: TextInputType.emailAddress,
      labelText: 'Email',
      placeholder: 'you@example.com',
      isInvalid: true,
      errorText: 'Please enter a valid email address.',
    );
  }
}

class _TextFieldDisabledEmbed extends StatelessWidget {
  const _TextFieldDisabledEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseTextField(
      labelText: 'Account ID',
      hintText: 'acct_01H…',
      helperText: 'This field cannot be edited.',
      enabled: false,
    );
  }
}

class _TextFieldMultilineEmbed extends StatelessWidget {
  const _TextFieldMultilineEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseTextField(
      labelText: 'Message',
      placeholder: 'How can we help?',
      helperText: 'Maximum 500 characters.',
      minLines: 3,
      maxLines: 6,
      maxLength: 500,
    );
  }
}

class _TextFieldInputTypesEmbed extends StatelessWidget {
  const _TextFieldInputTypesEmbed();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const RiseTextField(
          labelText: 'Password',
          obscureText: true,
          placeholder: '••••••••',
        ),
        const SizedBox(height: 12),
        RiseTextField(
          labelText: 'Age',
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          placeholder: '25',
        ),
        const SizedBox(height: 12),
        const RiseTextField(
          labelText: 'Email',
          keyboardType: TextInputType.emailAddress,
          placeholder: 'name@domain.com',
        ),
      ],
    );
  }
}

class _TextFieldFullWidthEmbed extends StatelessWidget {
  const _TextFieldFullWidthEmbed();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseTextField(
          fullWidth: true,
          labelText: 'Your name',
          placeholder: 'Ada Lovelace',
        ),
        SizedBox(height: 12),
        RiseTextField(
          fullWidth: true,
          labelText: 'Password',
          obscureText: true,
          helperText: 'Password must be longer than 8 characters.',
          placeholder: '••••••••',
        ),
      ],
    );
  }
}

class _TextFieldInSurfaceEmbed extends StatelessWidget {
  const _TextFieldInSurfaceEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseSurface(
      variant: RiseSurfaceVariant.secondary,
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RiseTextField(
            fullWidth: true,
            variant: RiseTextFieldVariant.secondary,
            labelText: 'Your name',
            helperText: "We'll never share this with anyone else.",
            placeholder: 'Jane Doe',
          ),
          SizedBox(height: 12),
          RiseTextField(
            fullWidth: true,
            variant: RiseTextFieldVariant.secondary,
            labelText: 'Email',
            keyboardType: TextInputType.emailAddress,
            placeholder: 'you@example.com',
          ),
          SizedBox(height: 12),
          RiseTextField(
            fullWidth: true,
            variant: RiseTextFieldVariant.secondary,
            labelText: 'Bio',
            helperText: 'Minimum 4 rows.',
            minLines: 4,
            maxLines: 8,
            placeholder: 'Tell us about yourself…',
          ),
        ],
      ),
    );
  }
}

class _TextFieldVariantsEmbed extends StatelessWidget {
  const _TextFieldVariantsEmbed();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseTextField(
          fullWidth: true,
          variant: RiseTextFieldVariant.primary,
          labelText: 'Primary',
          placeholder: 'Surface container fill',
        ),
        SizedBox(height: 10),
        RiseTextField(
          fullWidth: true,
          variant: RiseTextFieldVariant.secondary,
          labelText: 'Secondary',
          placeholder: 'Muted fill — use on surfaces',
        ),
      ],
    );
  }
}
