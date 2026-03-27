import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

class DocsEmbedRadio {
  DocsEmbedRadio._();

  static Widget _wrap(Widget child) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kDocsEmbedMaxWidth),
        child: child,
      ),
    );
  }

  static Widget usage(BuildContext context) => _wrap(const _RadioUsageEmbed());
  static Widget horizontal(BuildContext context) => _wrap(const _RadioHorizontalEmbed());
  static Widget controlled(BuildContext context) => _wrap(const _RadioControlledEmbed());
  static Widget disabled(BuildContext context) => _wrap(const _RadioDisabledEmbed());
  static Widget variants(BuildContext context) => _wrap(const _RadioVariantsEmbed());
  static Widget invalid(BuildContext context) => _wrap(const _RadioInvalidEmbed());
}

const _plans = [
  RiseRadioOption<String>(value: 'starter', label: Text('Starter'), description: Text('For side projects')),
  RiseRadioOption<String>(value: 'pro', label: Text('Pro'), description: Text('Advanced reporting')),
  RiseRadioOption<String>(value: 'teams', label: Text('Teams'), description: Text('Up to 10 teammates')),
];

class _RadioUsageEmbed extends StatefulWidget {
  const _RadioUsageEmbed();

  @override
  State<_RadioUsageEmbed> createState() => _RadioUsageEmbedState();
}

class _RadioUsageEmbedState extends State<_RadioUsageEmbed> {
  String? _value = 'pro';

  @override
  Widget build(BuildContext context) {
    return RiseRadioGroup<String>(
      value: _value,
      onChanged: (v) => setState(() => _value = v),
      label: const Text('Plan selection'),
      description: const Text('Choose the plan that suits you best'),
      options: _plans,
    );
  }
}

class _RadioHorizontalEmbed extends StatefulWidget {
  const _RadioHorizontalEmbed();

  @override
  State<_RadioHorizontalEmbed> createState() => _RadioHorizontalEmbedState();
}

class _RadioHorizontalEmbedState extends State<_RadioHorizontalEmbed> {
  String? _value = 'pro';

  @override
  Widget build(BuildContext context) {
    return RiseRadioGroup<String>(
      value: _value,
      onChanged: (v) => setState(() => _value = v),
      label: const Text('Subscription plan'),
      orientation: RiseRadioGroupOrientation.horizontal,
      options: _plans,
    );
  }
}

class _RadioControlledEmbed extends StatefulWidget {
  const _RadioControlledEmbed();

  @override
  State<_RadioControlledEmbed> createState() => _RadioControlledEmbedState();
}

class _RadioControlledEmbedState extends State<_RadioControlledEmbed> {
  String? _value = 'starter';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseRadioGroup<String>(
          value: _value,
          onChanged: (v) => setState(() => _value = v),
          label: const Text('Controlled'),
          options: _plans,
        ),
        const SizedBox(height: 8),
        Text('Selected plan: ${_value ?? '-'}'),
      ],
    );
  }
}

class _RadioDisabledEmbed extends StatelessWidget {
  const _RadioDisabledEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseRadioGroup<String>(
      value: 'pro',
      onChanged: (_) {},
      isDisabled: true,
      label: const Text('Subscription plan'),
      description: const Text('Plan changes are temporarily paused.'),
      options: _plans,
    );
  }
}

class _RadioVariantsEmbed extends StatelessWidget {
  const _RadioVariantsEmbed();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const RiseRadioGroup<String>(
          value: 'starter',
          onChanged: _noopStringChange,
          label: Text('Primary variant'),
          options: _plans,
          variant: RiseRadioGroupVariant.primary,
        ),
        const SizedBox(height: 12),
        const RiseRadioGroup<String>(
          value: 'starter',
          onChanged: _noopStringChange,
          label: Text('Secondary variant'),
          options: _plans,
          variant: RiseRadioGroupVariant.secondary,
        ),
      ],
    );
  }
}

void _noopStringChange(String? _) {}

class _RadioInvalidEmbed extends StatefulWidget {
  const _RadioInvalidEmbed();

  @override
  State<_RadioInvalidEmbed> createState() => _RadioInvalidEmbedState();
}

class _RadioInvalidEmbedState extends State<_RadioInvalidEmbed> {
  String? _value;

  @override
  Widget build(BuildContext context) {
    final invalid = _value == null;
    return RiseRadioGroup<String>(
      value: _value,
      onChanged: (v) => setState(() => _value = v),
      isRequired: true,
      isInvalid: invalid,
      label: const Text('Payment method'),
      errorMessage: invalid ? const Text('Please choose one option.') : null,
      options: const [
        RiseRadioOption<String>(value: 'card', label: Text('Card')),
        RiseRadioOption<String>(value: 'paypal', label: Text('PayPal')),
      ],
    );
  }
}
