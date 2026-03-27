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
}

class _InputOtpUsageEmbed extends StatefulWidget {
  const _InputOtpUsageEmbed();

  @override
  State<_InputOtpUsageEmbed> createState() => _InputOtpUsageEmbedState();
}

class _InputOtpUsageEmbedState extends State<_InputOtpUsageEmbed> {
  String _code = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseInputOtp(
          length: 6,
          onChanged: (v) => setState(() => _code = v),
          onCompleted: (v) => setState(() => _code = v),
        ),
        const SizedBox(height: 8),
        Text('Code: $_code'),
      ],
    );
  }
}

class _InputOtpFourDigitsEmbed extends StatelessWidget {
  const _InputOtpFourDigitsEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseInputOtp(
      length: 4,
      onCompleted: (_) {},
    );
  }
}

class _InputOtpDisabledEmbed extends StatelessWidget {
  const _InputOtpDisabledEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseInputOtp(
      length: 6,
      isDisabled: true,
      onCompleted: (_) {},
    );
  }
}

class _InputOtpWithPatternEmbed extends StatelessWidget {
  const _InputOtpWithPatternEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseInputOtp(
      length: 6,
      pattern: RegExp(r'[a-zA-Z]'),
      onCompleted: (_) {},
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseInputOtp(
          length: 6,
          onChanged: (v) => setState(() => _value = v),
          onCompleted: (v) => setState(() => _value = v),
        ),
        const SizedBox(height: 8),
        Text('Value: $_value'),
      ],
    );
  }
}

class _InputOtpVariantsEmbed extends StatelessWidget {
  const _InputOtpVariantsEmbed();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseInputOtp(length: 6, variant: RiseInputOtpVariant.primary),
        SizedBox(height: 12),
        RiseInputOtp(length: 6, variant: RiseInputOtpVariant.secondary),
      ],
    );
  }
}
