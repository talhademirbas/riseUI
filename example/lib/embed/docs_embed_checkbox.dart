import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

class DocsEmbedCheckbox {
  DocsEmbedCheckbox._();

  static Widget _wrap(Widget child) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kDocsEmbedMaxWidth),
        child: child,
      ),
    );
  }

  static Widget usage(BuildContext context) => _wrap(const _Usage());
  static Widget controlled(BuildContext context) => _wrap(const _Controlled());
  static Widget indeterminate(BuildContext context) => _wrap(const _Indeterminate());
  static Widget withDescription(BuildContext context) => _wrap(const _WithDescription());
  static Widget invalid(BuildContext context) => _wrap(const _Invalid());
  static Widget variants(BuildContext context) => _wrap(const _Variants());
  static Widget disabled(BuildContext context) => _wrap(const _Disabled());
}

class _Usage extends StatefulWidget {
  const _Usage();
  @override
  State<_Usage> createState() => _UsageState();
}

class _UsageState extends State<_Usage> {
  bool _v = false;

  @override
  Widget build(BuildContext context) {
    return RiseCheckbox(
      value: _v,
      onChanged: (v) => setState(() => _v = v ?? false),
      label: const Text('Accept terms and conditions'),
    );
  }
}

class _Controlled extends StatefulWidget {
  const _Controlled();
  @override
  State<_Controlled> createState() => _ControlledState();
}

class _ControlledState extends State<_Controlled> {
  bool _v = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseCheckbox(
          value: _v,
          onChanged: (v) => setState(() => _v = v ?? false),
          label: const Text('Email notifications'),
        ),
        const SizedBox(height: 8),
        Text('Status: ${_v ? 'Enabled' : 'Disabled'}'),
      ],
    );
  }
}

class _Indeterminate extends StatefulWidget {
  const _Indeterminate();
  @override
  State<_Indeterminate> createState() => _IndeterminateState();
}

class _IndeterminateState extends State<_Indeterminate> {
  bool? _v;

  @override
  Widget build(BuildContext context) {
    return RiseCheckbox(
      tristate: true,
      value: _v,
      onChanged: (v) => setState(() => _v = v),
      label: const Text('Select all'),
      description: const Text('Shows indeterminate state (dash icon)'),
    );
  }
}

class _WithDescription extends StatefulWidget {
  const _WithDescription();
  @override
  State<_WithDescription> createState() => _WithDescriptionState();
}

class _WithDescriptionState extends State<_WithDescription> {
  bool _v = true;

  @override
  Widget build(BuildContext context) {
    return RiseCheckbox(
      value: _v,
      onChanged: (v) => setState(() => _v = v ?? false),
      label: const Text('Email notifications'),
      description: const Text('Get notified when someone mentions you in a comment'),
    );
  }
}

class _Invalid extends StatefulWidget {
  const _Invalid();
  @override
  State<_Invalid> createState() => _InvalidState();
}

class _InvalidState extends State<_Invalid> {
  bool _v = false;

  @override
  Widget build(BuildContext context) {
    return RiseCheckbox(
      value: _v,
      onChanged: (v) => setState(() => _v = v ?? false),
      isInvalid: !_v,
      label: const Text('I agree to the terms'),
      description: Text(_v ? 'Thank you.' : 'You must accept the terms to continue'),
    );
  }
}

class _Variants extends StatefulWidget {
  const _Variants();
  @override
  State<_Variants> createState() => _VariantsState();
}

class _VariantsState extends State<_Variants> {
  bool _a = true;
  bool _b = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseCheckbox(
          value: _a,
          onChanged: (v) => setState(() => _a = v ?? false),
          variant: RiseCheckboxVariant.primary,
          label: const Text('Primary checkbox'),
          description: const Text('Standard styling with default background'),
        ),
        const SizedBox(height: 12),
        RiseCheckbox(
          value: _b,
          onChanged: (v) => setState(() => _b = v ?? false),
          variant: RiseCheckboxVariant.secondary,
          label: const Text('Secondary checkbox'),
          description: const Text('Lower emphasis variant for use in surfaces'),
        ),
      ],
    );
  }
}

class _Disabled extends StatelessWidget {
  const _Disabled();

  @override
  Widget build(BuildContext context) {
    return RiseCheckbox(
      value: false,
      onChanged: (_) {},
      isDisabled: true,
      label: const Text('Premium feature'),
      description: const Text('This feature is coming soon'),
    );
  }
}
