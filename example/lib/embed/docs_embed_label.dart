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
  static Widget withDescription(BuildContext context) => _wrap(const _LabelWithDescriptionEmbed());
  static Widget requiredInvalid(BuildContext context) => _wrap(const _LabelRequiredInvalidEmbed());
  static Widget customIndicator(BuildContext context) => _wrap(const _LabelCustomIndicatorEmbed());
  static Widget controlField(BuildContext context) => _wrap(const _LabelControlFieldEmbed());
}

/// Hero-style default: `.label` `text-sm font-medium`.
class _LabelUsageEmbed extends StatelessWidget {
  const _LabelUsageEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseLabel.text('Display name');
  }
}

class _LabelRequiredEmbed extends StatelessWidget {
  const _LabelRequiredEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseLabel.text(
      'Email',
      isRequired: true,
    );
  }
}

class _LabelDisabledEmbed extends StatelessWidget {
  const _LabelDisabledEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseLabel.text(
      'Account ID',
      isDisabled: true,
    );
  }
}

class _LabelInvalidEmbed extends StatelessWidget {
  const _LabelInvalidEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseLabel.text(
      'Password',
      isInvalid: true,
    );
  }
}

class _LabelWithInputEmbed extends StatelessWidget {
  const _LabelWithInputEmbed();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseLabel.text('Username'),
        const SizedBox(height: 6),
        const RiseInput(hintText: 'jane.doe'),
      ],
    );
  }
}

class _LabelWithDescriptionEmbed extends StatelessWidget {
  const _LabelWithDescriptionEmbed();

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseLabel.text('Birthday'),
        const SizedBox(height: 4),
        RiseDescription.text(
          'We use this for age-appropriate defaults.',
          style: TextStyle(color: rise.mutedForeground(0.8)),
        ),
      ],
    );
  }
}

/// `.label--required.label--invalid`: danger text + required asterisk.
class _LabelRequiredInvalidEmbed extends StatelessWidget {
  const _LabelRequiredInvalidEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseLabel.text(
      'Legal name',
      isRequired: true,
      isInvalid: true,
    );
  }
}

/// Custom `requiredIndicator` instead of default `*`.
class _LabelCustomIndicatorEmbed extends StatelessWidget {
  const _LabelCustomIndicatorEmbed();

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    return RiseLabel(
      isRequired: true,
      requiredIndicator: Padding(
        padding: const EdgeInsets.only(left: 2),
        child: Text(
          '(req)',
          style: TextStyle(
            fontSize: 12,
            height: 20 / 12,
            fontWeight: FontWeight.w500,
            color: rise.danger,
          ),
        ),
      ),
      semanticsLabel: 'Invoice number',
      child: const Text('Invoice number'),
    );
  }
}

class _LabelControlFieldEmbed extends StatelessWidget {
  const _LabelControlFieldEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseControlField(
      label: RiseLabel.text(
        'Company',
        isRequired: true,
      ),
      description: const Text('This appears on invoices.'),
      control: const RiseInput(
        hintText: 'Acme Inc.',
      ),
    );
  }
}
