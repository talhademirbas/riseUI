import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

/// Checkbox demos for docs iframe (`?embed=checkbox-*`).
///
/// Parity: HeroUI v3
/// [checkbox.stories.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/checkbox/checkbox.stories.tsx)
/// and [checkbox.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/checkbox.css).
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
  static Widget customIndicator(BuildContext context) => _wrap(const _CustomIndicator());
  static Widget renderProps(BuildContext context) => _wrap(const _RenderProps());
  static Widget sizes(BuildContext context) => _wrap(const _Sizes());
  static Widget features(BuildContext context) => _wrap(const _Features());
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
    final muted = Theme.of(context).textTheme.bodySmall?.copyWith(
          color: context.riseTheme.mutedForeground(0.85),
        );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseCheckbox(
          value: _v,
          onChanged: (v) => setState(() => _v = v ?? false),
          label: const Text('Email notifications'),
        ),
        const SizedBox(height: 8),
        Text('Status: ${_v ? 'Enabled' : 'Disabled'}', style: muted),
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
      description: const Text('Shows indeterminate state'),
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
      label: const Text('Accept terms and conditions'),
      description: const Text('I agree to the terms and privacy policy'),
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
      description: Text(
        _v ? 'You can continue.' : 'You must accept the terms to continue',
      ),
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
    final muted = Theme.of(context).textTheme.labelSmall?.copyWith(
          color: context.riseTheme.mutedForeground(0.75),
        );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseLabel.text('Primary variant', style: muted),
        const SizedBox(height: 8),
        RiseCheckbox(
          value: _a,
          onChanged: (v) => setState(() => _a = v ?? false),
          variant: RiseCheckboxVariant.primary,
          label: const Text('Primary checkbox'),
          description: const Text('Standard styling with default background'),
        ),
        const SizedBox(height: 20),
        RiseLabel.text('Secondary variant', style: muted),
        const SizedBox(height: 8),
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
      onChanged: null,
      isDisabled: true,
      label: const Text('Feature'),
      description: const Text('This feature is coming soon'),
    );
  }
}

class _CustomIndicator extends StatefulWidget {
  const _CustomIndicator();
  @override
  State<_CustomIndicator> createState() => _CustomIndicatorState();
}

class _CustomIndicatorState extends State<_CustomIndicator> {
  bool _heart = true;
  bool _plus = false;
  bool? _ind;

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    Widget? heartIcon(BuildContext c, bool? v, bool ind) {
      if (v == true) {
        return Icon(Icons.favorite, size: 14, color: rise.accentForeground);
      }
      return null;
    }

    Widget? plusIcon(BuildContext c, bool? v, bool ind) {
      if (v == true) {
        return Icon(Icons.add, size: 14, color: rise.accentForeground);
      }
      return null;
    }

    Widget? indIcon(BuildContext c, bool? v, bool ind) {
      if (ind) {
        return Icon(Icons.horizontal_rule, size: 14, color: rise.accentForeground);
      }
      return null;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseCheckbox(
          value: _heart,
          onChanged: (v) => setState(() => _heart = v ?? false),
          label: const Text('Heart'),
          indicatorBuilder: heartIcon,
        ),
        const SizedBox(height: 12),
        RiseCheckbox(
          value: _plus,
          onChanged: (v) => setState(() => _plus = v ?? false),
          label: const Text('Plus'),
          indicatorBuilder: plusIcon,
        ),
        const SizedBox(height: 12),
        RiseCheckbox(
          tristate: true,
          value: _ind,
          onChanged: (v) => setState(() => _ind = v),
          label: const Text('Indeterminate'),
          indicatorBuilder: indIcon,
        ),
      ],
    );
  }
}

class _RenderProps extends StatefulWidget {
  const _RenderProps();
  @override
  State<_RenderProps> createState() => _RenderPropsState();
}

class _RenderPropsState extends State<_RenderProps> {
  bool _v = false;

  @override
  Widget build(BuildContext context) {
    return RiseCheckbox(
      value: _v,
      onChanged: (v) => setState(() => _v = v ?? false),
      label: Text(_v ? 'Terms accepted' : 'Accept terms'),
      description: Text(
        _v ? 'Thank you for accepting' : 'Please read and accept the terms',
      ),
    );
  }
}

class _Sizes extends StatefulWidget {
  const _Sizes();
  @override
  State<_Sizes> createState() => _SizesState();
}

class _SizesState extends State<_Sizes> {
  bool _sm = true;
  bool _md = true;
  bool _lg = true;
  bool _xl = true;

  @override
  Widget build(BuildContext context) {
    final muted = Theme.of(context).textTheme.labelSmall?.copyWith(
          color: context.riseTheme.mutedForeground(0.75),
        );
    Widget row(String title, RiseCheckboxSize size, bool v, ValueChanged<bool> onChanged) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RiseLabel.text(title, style: muted),
            const SizedBox(height: 6),
            RiseCheckbox(
              size: size,
              value: v,
              onChanged: (x) => onChanged(x ?? false),
              label: const Text('Rounded checkbox'),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseLabel.text('Rounded checkboxes', style: muted),
        const SizedBox(height: 12),
        row('Small', RiseCheckboxSize.sm, _sm, (x) => setState(() => _sm = x)),
        row('Default', RiseCheckboxSize.md, _md, (x) => setState(() => _md = x)),
        row('Large', RiseCheckboxSize.lg, _lg, (x) => setState(() => _lg = x)),
        row('Extra large', RiseCheckboxSize.xl, _xl, (x) => setState(() => _xl = x)),
      ],
    );
  }
}

class _Features extends StatefulWidget {
  const _Features();
  @override
  State<_Features> createState() => _FeaturesState();
}

class _FeaturesState extends State<_Features> {
  final Set<String> _sel = {'email'};

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    Widget row(String id, String title, String desc, IconData icon) {
      final on = _sel.contains(id);
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: RiseCheckbox(
          variant: RiseCheckboxVariant.secondary,
          value: on,
          onChanged: (v) => setState(() {
            if (v ?? false) {
              _sel.add(id);
            } else {
              _sel.remove(id);
            }
          }),
          label: Text(title),
          description: Text(desc),
          indicatorBuilder: (c, val, ind) {
            if (val == true) {
              return Icon(icon, size: 13, color: rise.accentForeground);
            }
            return null;
          },
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Notification preferences',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4),
        Text(
          'Choose how you want to receive updates',
          style: TextStyle(
            fontSize: 14,
            color: rise.mutedForeground(0.75),
          ),
        ),
        const SizedBox(height: 16),
        row(
          'email',
          'Email Notifications',
          'Receive updates via email',
          Icons.mail_outline,
        ),
        row(
          'sms',
          'SMS Alerts',
          'Get instant SMS notifications',
          Icons.sms_outlined,
        ),
        row(
          'push',
          'Push Notifications',
          'Browser and mobile push alerts',
          Icons.notifications_outlined,
        ),
      ],
    );
  }
}
