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
  static Widget uncontrolled(BuildContext context) => _wrap(const _RadioUncontrolledEmbed());
  static Widget validation(BuildContext context) => _wrap(const _RadioValidationEmbed());
  static Widget disabled(BuildContext context) => _wrap(const _RadioDisabledEmbed());
  static Widget variants(BuildContext context) => _wrap(const _RadioVariantsEmbed());
  static Widget invalid(BuildContext context) => _wrap(const _RadioInvalidEmbed());
  static Widget onSurface(BuildContext context) => _wrap(const _RadioOnSurfaceEmbed());
}

const _plans = [
  RiseRadioOption<String>(
    value: 'starter',
    label: Text('Basic Plan'),
    description: Text('Includes 100 messages per month'),
  ),
  RiseRadioOption<String>(
    value: 'premium',
    label: Text('Premium Plan'),
    description: Text('Includes 200 messages per month'),
  ),
  RiseRadioOption<String>(
    value: 'business',
    label: Text('Business Plan'),
    description: Text('Unlimited messages'),
  ),
];

const _subscriptionPlans = [
  RiseRadioOption<String>(
    value: 'starter',
    label: Text('Starter'),
    description: Text('For side projects and small teams'),
  ),
  RiseRadioOption<String>(
    value: 'pro',
    label: Text('Pro'),
    description: Text('Advanced reporting and analytics'),
  ),
  RiseRadioOption<String>(
    value: 'teams',
    label: Text('Teams'),
    description: Text('Share access with up to 10 teammates'),
  ),
];

class _RadioUsageEmbed extends StatefulWidget {
  const _RadioUsageEmbed();

  @override
  State<_RadioUsageEmbed> createState() => _RadioUsageEmbedState();
}

class _RadioUsageEmbedState extends State<_RadioUsageEmbed> {
  String? _value = 'premium';

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
      options: _subscriptionPlans,
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
    final rise = context.riseTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseRadioGroup<String>(
          value: _value,
          onChanged: (v) => setState(() => _value = v),
          label: const Text('Subscription plan'),
          options: _subscriptionPlans,
        ),
        const SizedBox(height: 12),
        Text(
          'Selected plan: ${_value ?? '-'}',
          style: TextStyle(fontSize: 13, color: rise.mutedForeground(0.85)),
        ),
      ],
    );
  }
}

class _RadioUncontrolledEmbed extends StatefulWidget {
  const _RadioUncontrolledEmbed();

  @override
  State<_RadioUncontrolledEmbed> createState() => _RadioUncontrolledEmbedState();
}

class _RadioUncontrolledEmbedState extends State<_RadioUncontrolledEmbed> {
  String? _value = 'pro';

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseRadioGroup<String>(
          value: _value,
          onChanged: (v) => setState(() => _value = v),
          label: const Text('Subscription plan'),
          options: _subscriptionPlans,
        ),
        const SizedBox(height: 12),
        Text(
          'Last chosen plan: ${_value ?? '-'}',
          style: TextStyle(fontSize: 13, color: rise.mutedForeground(0.85)),
        ),
      ],
    );
  }
}

class _RadioValidationEmbed extends StatefulWidget {
  const _RadioValidationEmbed();

  @override
  State<_RadioValidationEmbed> createState() => _RadioValidationEmbedState();
}

class _RadioValidationEmbedState extends State<_RadioValidationEmbed> {
  String? _value;
  bool _showError = false;

  @override
  Widget build(BuildContext context) {
    final invalid = _showError && _value == null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseRadioGroup<String>(
          value: _value,
          onChanged: (v) => setState(() {
            _value = v;
            _showError = false;
          }),
          isRequired: true,
          isInvalid: invalid,
          label: const Text('Subscription plan'),
          options: _subscriptionPlans,
          errorMessage: invalid ? const Text('Please select a plan.') : null,
        ),
        const SizedBox(height: 12),
        RiseButton(
          label: 'Submit',
          onPressed: () {
            setState(() {
              if (_value == null) {
                _showError = true;
              }
            });
          },
        ),
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
      description: const Text('Plan changes are temporarily paused while we roll out updates.'),
      options: _subscriptionPlans,
    );
  }
}

class _RadioVariantsEmbed extends StatelessWidget {
  const _RadioVariantsEmbed();

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    const opts = [
      RiseRadioOption<String>(
        value: 'a',
        label: Text('Option 1'),
        description: Text('Standard styling with default background'),
      ),
      RiseRadioOption<String>(
        value: 'b',
        label: Text('Option 2'),
        description: Text('Another option with primary styling'),
      ),
    ];
    const opts2 = [
      RiseRadioOption<String>(
        value: 'a',
        label: Text('Option 1'),
        description: Text('Lower emphasis variant for use in surfaces'),
      ),
      RiseRadioOption<String>(
        value: 'b',
        label: Text('Option 2'),
        description: Text('Another option with secondary styling'),
      ),
    ];
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
        RiseRadioGroup<String>(
          value: 'a',
          onChanged: _noopStringChange,
          options: opts,
          variant: RiseRadioGroupVariant.primary,
        ),
        const SizedBox(height: 24),
        Text(
          'Secondary variant',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: rise.mutedForeground(0.75),
          ),
        ),
        const SizedBox(height: 8),
        RiseRadioGroup<String>(
          value: 'a',
          onChanged: _noopStringChange,
          options: opts2,
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

class _RadioOnSurfaceEmbed extends StatefulWidget {
  const _RadioOnSurfaceEmbed();

  @override
  State<_RadioOnSurfaceEmbed> createState() => _RadioOnSurfaceEmbedState();
}

class _RadioOnSurfaceEmbedState extends State<_RadioOnSurfaceEmbed> {
  String? _value = 'premium';

  @override
  Widget build(BuildContext context) {
    return RiseSurface(
      variant: RiseSurfaceVariant.default_,
      padding: const EdgeInsets.all(24),
      borderRadius: 24,
      showShadow: true,
      child: RiseRadioGroup<String>(
        value: _value,
        onChanged: (v) => setState(() => _value = v),
        label: const Text('Plan selection'),
        description: const Text('Choose the plan that suits you best'),
        variant: RiseRadioGroupVariant.secondary,
        options: _plans,
      ),
    );
  }
}
