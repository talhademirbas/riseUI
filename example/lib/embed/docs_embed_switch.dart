import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

/// Switch demos for docs iframe (`?embed=switch-*`).
class DocsEmbedSwitch {
  DocsEmbedSwitch._();

  static Widget _wrap(Widget child) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kDocsEmbedMaxWidth),
        child: child,
      ),
    );
  }

  static Widget usage(BuildContext context) => _wrap(const _SwitchUsageEmbed());

  static Widget disabled(BuildContext context) => _wrap(const _SwitchDisabledEmbed());

  static Widget sizes(BuildContext context) => _wrap(const _SwitchSizesEmbed());

  static Widget labelPosition(BuildContext context) => _wrap(const _SwitchLabelPositionEmbed());

  static Widget withDescription(BuildContext context) => _wrap(const _SwitchWithDescriptionEmbed());

  static Widget withIcons(BuildContext context) => _wrap(const _SwitchWithIconsEmbed());

  static Widget group(BuildContext context) => _wrap(const _SwitchGroupEmbed());

  static Widget groupHorizontal(BuildContext context) => _wrap(const _SwitchGroupHorizontalEmbed());
}

class _SwitchUsageEmbed extends StatefulWidget {
  const _SwitchUsageEmbed();

  @override
  State<_SwitchUsageEmbed> createState() => _SwitchUsageEmbedState();
}

class _SwitchUsageEmbedState extends State<_SwitchUsageEmbed> {
  bool _on = true;

  @override
  Widget build(BuildContext context) {
    return RiseSwitch(
      value: _on,
      onChanged: (v) => setState(() => _on = v),
      label: const Text('Enable notifications'),
    );
  }
}

class _SwitchDisabledEmbed extends StatelessWidget {
  const _SwitchDisabledEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseSwitch(
      value: true,
      onChanged: (_) {},
      isDisabled: true,
      label: const Text('Enable notifications'),
    );
  }
}

class _SwitchSizesEmbed extends StatefulWidget {
  const _SwitchSizesEmbed();

  @override
  State<_SwitchSizesEmbed> createState() => _SwitchSizesEmbedState();
}

class _SwitchSizesEmbedState extends State<_SwitchSizesEmbed> {
  bool _a = true;
  bool _b = true;
  bool _c = true;

  @override
  Widget build(BuildContext context) {
    Widget row(String title, RiseSwitchSize size, bool v, ValueChanged<bool> onChanged) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: RiseSwitch(
          size: size,
          value: v,
          onChanged: onChanged,
          label: Text(title),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        row('Small', RiseSwitchSize.sm, _a, (v) => setState(() => _a = v)),
        row('Medium', RiseSwitchSize.md, _b, (v) => setState(() => _b = v)),
        row('Large', RiseSwitchSize.lg, _c, (v) => setState(() => _c = v)),
      ],
    );
  }
}

class _SwitchLabelPositionEmbed extends StatefulWidget {
  const _SwitchLabelPositionEmbed();

  @override
  State<_SwitchLabelPositionEmbed> createState() => _SwitchLabelPositionEmbedState();
}

class _SwitchLabelPositionEmbedState extends State<_SwitchLabelPositionEmbed> {
  bool _after = true;
  bool _before = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RiseSwitch(
          value: _after,
          onChanged: (v) => setState(() => _after = v),
          labelPosition: RiseSwitchLabelPosition.after,
          label: const Text('Label after'),
        ),
        const SizedBox(height: 16),
        RiseSwitch(
          value: _before,
          onChanged: (v) => setState(() => _before = v),
          labelPosition: RiseSwitchLabelPosition.before,
          label: const Text('Label before'),
        ),
      ],
    );
  }
}

class _SwitchWithDescriptionEmbed extends StatefulWidget {
  const _SwitchWithDescriptionEmbed();

  @override
  State<_SwitchWithDescriptionEmbed> createState() => _SwitchWithDescriptionEmbedState();
}

class _SwitchWithDescriptionEmbedState extends State<_SwitchWithDescriptionEmbed> {
  bool _on = true;

  @override
  Widget build(BuildContext context) {
    return RiseSwitch(
      value: _on,
      onChanged: (v) => setState(() => _on = v),
      label: const Text('Public profile'),
      description: const Text('Allow others to see your profile information'),
    );
  }
}

class _SwitchWithIconsEmbed extends StatefulWidget {
  const _SwitchWithIconsEmbed();

  @override
  State<_SwitchWithIconsEmbed> createState() => _SwitchWithIconsEmbedState();
}

class _SwitchWithIconsEmbedState extends State<_SwitchWithIconsEmbed> {
  bool _on = true;

  @override
  Widget build(BuildContext context) {
    return RiseSwitch(
      value: _on,
      onChanged: (v) => setState(() => _on = v),
      label: const Text('Alerts'),
      thumbIconSelected: Icons.notifications_active_outlined,
      thumbIconUnselected: Icons.notifications_off_outlined,
    );
  }
}

class _SwitchGroupEmbed extends StatefulWidget {
  const _SwitchGroupEmbed();

  @override
  State<_SwitchGroupEmbed> createState() => _SwitchGroupEmbedState();
}

class _SwitchGroupEmbedState extends State<_SwitchGroupEmbed> {
  bool _a = true;
  bool _b = false;
  bool _c = false;

  @override
  Widget build(BuildContext context) {
    return RiseSwitchGroup(
      children: [
        RiseSwitch(
          value: _a,
          onChanged: (v) => setState(() => _a = v),
          label: const Text('Allow notifications'),
        ),
        RiseSwitch(
          value: _b,
          onChanged: (v) => setState(() => _b = v),
          label: const Text('Marketing emails'),
        ),
        RiseSwitch(
          value: _c,
          onChanged: (v) => setState(() => _c = v),
          label: const Text('Social media updates'),
        ),
      ],
    );
  }
}

class _SwitchGroupHorizontalEmbed extends StatefulWidget {
  const _SwitchGroupHorizontalEmbed();

  @override
  State<_SwitchGroupHorizontalEmbed> createState() => _SwitchGroupHorizontalEmbedState();
}

class _SwitchGroupHorizontalEmbedState extends State<_SwitchGroupHorizontalEmbed> {
  bool _a = true;
  bool _b = false;
  bool _c = false;

  @override
  Widget build(BuildContext context) {
    return RiseSwitchGroup(
      orientation: Axis.horizontal,
      spacing: 24,
      children: [
        SizedBox(
          width: 200,
          child: RiseSwitch(
            value: _a,
            onChanged: (v) => setState(() => _a = v),
            label: const Text('Notifications'),
          ),
        ),
        SizedBox(
          width: 180,
          child: RiseSwitch(
            value: _b,
            onChanged: (v) => setState(() => _b = v),
            label: const Text('Marketing'),
          ),
        ),
        SizedBox(
          width: 160,
          child: RiseSwitch(
            value: _c,
            onChanged: (v) => setState(() => _c = v),
            label: const Text('Social'),
          ),
        ),
      ],
    );
  }
}
