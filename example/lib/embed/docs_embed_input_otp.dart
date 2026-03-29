import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

class DocsEmbedInputOtp {
  DocsEmbedInputOtp._();

  static Widget _wrap(Widget child) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kDocsEmbedMaxWidth),
        child: child,
      ),
    );
  }

  static Widget usage(BuildContext context) => _wrap(const _InputOtpUsageEmbed());
  static Widget fourDigits(BuildContext context) => _wrap(const _InputOtpFourDigitsEmbed());
  static Widget disabled(BuildContext context) => _wrap(const _InputOtpDisabledEmbed());
  static Widget withPattern(BuildContext context) => _wrap(const _InputOtpWithPatternEmbed());
  static Widget controlled(BuildContext context) => _wrap(const _InputOtpControlledEmbed());
  static Widget variants(BuildContext context) => _wrap(const _InputOtpVariantsEmbed());
  static Widget withValidation(BuildContext context) => _wrap(const _InputOtpWithValidationEmbed());
  static Widget onComplete(BuildContext context) => _wrap(const _InputOtpOnCompleteEmbed());
  static Widget formExample(BuildContext context) => _wrap(const _InputOtpFormExampleEmbed());
}

/// Hero InputOTP stories: Default layout — verify copy + 3|3 + actions.
class _InputOtpUsageEmbed extends StatelessWidget {
  const _InputOtpUsageEmbed();

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RiseLabel.text(
          'Verify account',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: rise.defaultForeground,
          ),
        ),
        const SizedBox(height: 6),
        RiseDescription.text(
          "We've sent a code to a****@gmail.com",
          style: TextStyle(color: rise.mutedForeground(0.8)),
        ),
        const SizedBox(height: 16),
        Center(
          child: RiseInputOtp(
            length: 6,
            separatorBuilder: (_) => const RiseInputOtpSeparator(),
            onChanged: (_) {},
            onCompleted: (_) {},
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 4,
          children: [
            Text(
              "Didn't receive a code?",
              style: TextStyle(fontSize: 13, color: rise.mutedForeground(0.75)),
            ),
            RiseLinkButton(
              label: 'Resend',
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}

class _InputOtpFourDigitsEmbed extends StatelessWidget {
  const _InputOtpFourDigitsEmbed();

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseLabel.text(
          'Enter PIN',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: rise.defaultForeground,
          ),
        ),
        const SizedBox(height: 12),
        RiseInputOtp(
          length: 4,
          onCompleted: (_) {},
        ),
      ],
    );
  }
}

class _InputOtpDisabledEmbed extends StatelessWidget {
  const _InputOtpDisabledEmbed();

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseLabel.text(
          'Verify account',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: rise.mutedForeground(0.5),
          ),
          isDisabled: true,
        ),
        const SizedBox(height: 6),
        RiseDescription.text(
          'Code verification is currently disabled',
          style: TextStyle(color: rise.mutedForeground(0.5)),
        ),
        const SizedBox(height: 12),
        const RiseInputOtp(
          length: 6,
          isDisabled: true,
        ),
      ],
    );
  }
}

class _InputOtpWithPatternEmbed extends StatelessWidget {
  const _InputOtpWithPatternEmbed();

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseLabel.text(
          'Enter code (letters only)',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: rise.defaultForeground,
          ),
        ),
        const SizedBox(height: 4),
        RiseDescription.text(
          'Only alphabetic characters are allowed',
          style: TextStyle(color: rise.mutedForeground(0.75)),
        ),
        const SizedBox(height: 12),
        RiseInputOtp(
          length: 6,
          pattern: RegExp(r'[a-zA-Z]'),
          onCompleted: (_) {},
        ),
      ],
    );
  }
}

class _InputOtpControlledEmbed extends StatefulWidget {
  const _InputOtpControlledEmbed();

  @override
  State<_InputOtpControlledEmbed> createState() => _InputOtpControlledEmbedState();
}

class _InputOtpControlledEmbedState extends State<_InputOtpControlledEmbed> {
  String _value = '';

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseLabel.text(
          'Verify account',
          style: TextStyle(fontWeight: FontWeight.w600, color: rise.defaultForeground),
        ),
        const SizedBox(height: 12),
        RiseInputOtp(
          length: 6,
          onChanged: (v) => setState(() => _value = v),
          onCompleted: (v) => setState(() => _value = v),
        ),
        const SizedBox(height: 12),
        Text(
          _value.isNotEmpty
              ? 'Value: $_value (${_value.length}/6)'
              : 'Enter a 6-digit code',
          style: TextStyle(
            fontSize: 13,
            color: _value.isNotEmpty ? rise.mutedForeground(0.85) : rise.mutedForeground(0.65),
          ),
        ),
      ],
    );
  }
}

class _InputOtpVariantsEmbed extends StatelessWidget {
  const _InputOtpVariantsEmbed();

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Primary variant',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: rise.mutedForeground(0.75),
          ),
        ),
        const SizedBox(height: 8),
        const RiseInputOtp(length: 6, variant: RiseInputOtpVariant.primary),
        const SizedBox(height: 20),
        Text(
          'Secondary variant',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: rise.mutedForeground(0.75),
          ),
        ),
        const SizedBox(height: 8),
        const RiseInputOtp(length: 6, variant: RiseInputOtpVariant.secondary),
      ],
    );
  }
}

class _InputOtpWithValidationEmbed extends StatefulWidget {
  const _InputOtpWithValidationEmbed();

  @override
  State<_InputOtpWithValidationEmbed> createState() => _InputOtpWithValidationEmbedState();
}

class _InputOtpWithValidationEmbedState extends State<_InputOtpWithValidationEmbed> {
  String _value = '';
  bool _invalid = false;

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RiseLabel.text(
          'Verify account',
          style: TextStyle(fontWeight: FontWeight.w600, color: rise.defaultForeground),
        ),
        const SizedBox(height: 4),
        RiseDescription.text(
          'Hint: The code is 123456',
          style: TextStyle(color: rise.mutedForeground(0.75)),
        ),
        const SizedBox(height: 12),
        Center(
          child: RiseInputOtp(
            length: 6,
            isInvalid: _invalid,
            onChanged: (v) {
              setState(() {
                _value = v;
                _invalid = false;
              });
            },
            onCompleted: (_) {},
          ),
        ),
        const SizedBox(height: 8),
        RiseFieldError.text(
          'Invalid code. Please try again.',
          visible: _invalid,
        ),
        const SizedBox(height: 12),
        RiseButton(
          label: 'Submit',
          onPressed: () {
            setState(() {
              _invalid = _value != '123456';
            });
          },
        ),
      ],
    );
  }
}

class _InputOtpOnCompleteEmbed extends StatefulWidget {
  const _InputOtpOnCompleteEmbed();

  @override
  State<_InputOtpOnCompleteEmbed> createState() => _InputOtpOnCompleteEmbedState();
}

class _InputOtpOnCompleteEmbedState extends State<_InputOtpOnCompleteEmbed> {
  bool _submitting = false;

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RiseLabel.text(
          'Verify account',
          style: TextStyle(fontWeight: FontWeight.w600, color: rise.defaultForeground),
        ),
        const SizedBox(height: 12),
        Center(
          child: RiseInputOtp(
            length: 6,
            onCompleted: (_) {
              setState(() => _submitting = true);
              Future<void>.delayed(const Duration(milliseconds: 800), () {
                if (mounted) setState(() => _submitting = false);
              });
            },
          ),
        ),
        const SizedBox(height: 16),
        RiseButton(
          label: _submitting ? 'Verifying…' : 'Verify code',
          isDisabled: _submitting,
          onPressed: _submitting ? null : () {},
        ),
      ],
    );
  }
}

class _InputOtpFormExampleEmbed extends StatefulWidget {
  const _InputOtpFormExampleEmbed();

  @override
  State<_InputOtpFormExampleEmbed> createState() => _InputOtpFormExampleEmbedState();
}

class _InputOtpFormExampleEmbedState extends State<_InputOtpFormExampleEmbed> {
  String _value = '';
  String _error = '';
  bool _submitting = false;

  void _submit() {
    if (_value.length != 6) {
      setState(() => _error = 'Please enter all 6 digits');
      return;
    }
    final code = _value;
    setState(() {
      _error = '';
      _submitting = true;
    });
    Future<void>.delayed(const Duration(milliseconds: 900), () {
      if (!mounted) return;
      setState(() {
        _submitting = false;
        if (code == '123456') {
          _value = '';
        } else {
          _error = 'Invalid code. Please try again.';
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RiseLabel.text(
          'Two-factor authentication',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: rise.defaultForeground,
          ),
        ),
        const SizedBox(height: 6),
        RiseDescription.text(
          'Enter the 6-digit code from your authenticator app',
          style: TextStyle(color: rise.mutedForeground(0.8)),
        ),
        const SizedBox(height: 16),
        Center(
          child: RiseInputOtp(
            length: 6,
            onChanged: (v) => setState(() {
              _value = v;
              _error = '';
            }),
            onCompleted: (_) => _submit(),
          ),
        ),
        const SizedBox(height: 8),
        if (_error.isNotEmpty)
          RiseFieldError.text(
            _error,
            visible: true,
          ),
        const SizedBox(height: 12),
        RiseButton(
          label: _submitting ? 'Verifying…' : 'Verify',
          isDisabled: _submitting,
          onPressed: _submitting ? null : _submit,
        ),
        const SizedBox(height: 12),
        Center(
          child: RiseLinkButton(
            label: 'Use backup code',
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
