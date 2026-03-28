import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

/// Switch demos for docs iframe (`?embed=switch-*`).
///
/// Parity: HeroUI v3
/// [switch.stories.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/switch/switch.stories.tsx)
/// and [switch.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/switch.css).
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

  static Widget controlled(BuildContext context) => _wrap(const _SwitchControlledEmbed());

  static Widget withoutLabel(BuildContext context) => _wrap(const _SwitchWithoutLabelEmbed());

  static Widget sizes(BuildContext context) => _wrap(const _SwitchSizesEmbed());

  static Widget labelPosition(BuildContext context) => _wrap(const _SwitchLabelPositionEmbed());

  static Widget withDescription(BuildContext context) => _wrap(const _SwitchWithDescriptionEmbed());

  static Widget withCustomStyles(BuildContext context) => _wrap(const _SwitchWithCustomStylesEmbed());

  static Widget withIcons(BuildContext context) => _wrap(const _SwitchWithIconsEmbed());

  static Widget renderProps(BuildContext context) => _wrap(const _SwitchRenderPropsEmbed());

  static Widget group(BuildContext context) => _wrap(const _SwitchGroupEmbed());

  static Widget groupHorizontal(BuildContext context) => _wrap(const _SwitchGroupHorizontalEmbed());
}

class _SwitchUsageEmbed extends StatelessWidget {
  const _SwitchUsageEmbed();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _StatefulSwitchRow(
          initial: false,
          key: const ValueKey<String>('off'),
        ),
        const SizedBox(height: 16),
        _StatefulSwitchRow(
          initial: true,
          key: const ValueKey<String>('on'),
        ),
      ],
    );
  }
}

class _StatefulSwitchRow extends StatefulWidget {
  const _StatefulSwitchRow({super.key, required this.initial});

  final bool initial;

  @override
  State<_StatefulSwitchRow> createState() => _StatefulSwitchRowState();
}

class _StatefulSwitchRowState extends State<_StatefulSwitchRow> {
  late bool _on = widget.initial;

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RiseSwitch(
          value: false,
          onChanged: null,
          isDisabled: true,
          label: const Text('Enable notifications'),
        ),
        const SizedBox(height: 16),
        RiseSwitch(
          value: true,
          onChanged: null,
          isDisabled: true,
          label: const Text('Enable notifications'),
        ),
      ],
    );
  }
}

class _SwitchControlledEmbed extends StatefulWidget {
  const _SwitchControlledEmbed();

  @override
  State<_SwitchControlledEmbed> createState() => _SwitchControlledEmbedState();
}

class _SwitchControlledEmbedState extends State<_SwitchControlledEmbed> {
  bool _on = false;

  @override
  Widget build(BuildContext context) {
    final muted = Theme.of(context).textTheme.bodySmall?.copyWith(
          color: context.riseTheme.mutedForeground(0.85),
        );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseSwitch(
          value: _on,
          onChanged: (v) => setState(() => _on = v),
          label: const Text('Enable notifications'),
        ),
        const SizedBox(height: 8),
        Text(
          'Switch is ${_on ? "on" : "off"}',
          style: muted,
        ),
      ],
    );
  }
}

class _SwitchWithoutLabelEmbed extends StatefulWidget {
  const _SwitchWithoutLabelEmbed();

  @override
  State<_SwitchWithoutLabelEmbed> createState() => _SwitchWithoutLabelEmbedState();
}

class _SwitchWithoutLabelEmbedState extends State<_SwitchWithoutLabelEmbed> {
  bool _on = false;

  @override
  Widget build(BuildContext context) {
    return RiseSwitch(
      value: _on,
      onChanged: (v) => setState(() => _on = v),
      semanticLabel: 'Enable notifications',
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
    final muted = Theme.of(context).textTheme.labelSmall?.copyWith(
          color: context.riseTheme.mutedForeground(0.75),
        );
    Widget row(String title, RiseSwitchSize size, bool v, ValueChanged<bool> onChanged) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RiseLabel.text(title, style: muted),
            const SizedBox(height: 8),
            RiseSwitch(
              size: size,
              value: v,
              onChanged: onChanged,
              label: const Text('Enable notifications'),
            ),
          ],
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
          label: const Text('Enable notifications'),
        ),
        const SizedBox(height: 16),
        RiseSwitch(
          value: _before,
          onChanged: (v) => setState(() => _before = v),
          labelPosition: RiseSwitchLabelPosition.before,
          label: const Text('Enable notifications'),
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

class _SwitchWithCustomStylesEmbed extends StatefulWidget {
  const _SwitchWithCustomStylesEmbed();

  @override
  State<_SwitchWithCustomStylesEmbed> createState() => _SwitchWithCustomStylesEmbedState();
}

class _SwitchWithCustomStylesEmbedState extends State<_SwitchWithCustomStylesEmbed> {
  bool _a = true;
  bool _b = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RiseSwitch(
          value: _a,
          onChanged: (v) => setState(() => _a = v),
          accentColor: Colors.blue,
          label: const Text('Accent (blue)'),
        ),
        const SizedBox(height: 16),
        RiseSwitch(
          value: _b,
          onChanged: (v) => setState(() => _b = v),
          accentColor: Colors.green.shade600,
          label: const Text('Accent (green)'),
        ),
      ],
    );
  }
}

class _SwitchWithIconsEmbed extends StatefulWidget {
  const _SwitchWithIconsEmbed();

  @override
  State<_SwitchWithIconsEmbed> createState() => _SwitchWithIconsEmbedState();
}

class _SwitchWithIconsEmbedState extends State<_SwitchWithIconsEmbed> {
  bool _volume = true;
  bool _mic = false;
  bool _power = true;
  bool _dark = false;
  bool _bell = true;

  @override
  Widget build(BuildContext context) {
    final muted = Theme.of(context).textTheme.labelSmall?.copyWith(
          color: context.riseTheme.mutedForeground(0.75),
        );
    Widget row(String caption, RiseSwitch s) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RiseLabel.text(caption, style: muted),
            const SizedBox(height: 6),
            s,
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        row(
          'Volume',
          RiseSwitch(
            value: _volume,
            onChanged: (v) => setState(() => _volume = v),
            accentColor: Colors.blue,
            thumbIconSelected: Icons.volume_up,
            thumbIconUnselected: Icons.volume_off,
            label: const Text('Sound'),
          ),
        ),
        row(
          'Microphone',
          RiseSwitch(
            value: _mic,
            onChanged: (v) => setState(() => _mic = v),
            accentColor: Colors.red,
            thumbIconSelected: Icons.mic,
            thumbIconUnselected: Icons.mic_off,
            label: const Text('Input'),
          ),
        ),
        row(
          'Power',
          RiseSwitch(
            value: _power,
            onChanged: (v) => setState(() => _power = v),
            accentColor: Colors.green.shade600,
            thumbIconSelected: Icons.check,
            thumbIconUnselected: Icons.power_settings_new,
            label: const Text('Device'),
          ),
        ),
        row(
          'Theme',
          RiseSwitch(
            value: _dark,
            onChanged: (v) => setState(() => _dark = v),
            thumbIconSelected: Icons.light_mode,
            thumbIconUnselected: Icons.dark_mode,
            label: const Text('Appearance'),
          ),
        ),
        row(
          'Alerts',
          RiseSwitch(
            value: _bell,
            onChanged: (v) => setState(() => _bell = v),
            accentColor: Colors.purple,
            thumbIconSelected: Icons.notifications_active_outlined,
            thumbIconUnselected: Icons.notifications_off_outlined,
            label: const Text('Notifications'),
          ),
        ),
      ],
    );
  }
}

class _SwitchRenderPropsEmbed extends StatefulWidget {
  const _SwitchRenderPropsEmbed();

  @override
  State<_SwitchRenderPropsEmbed> createState() => _SwitchRenderPropsEmbedState();
}

class _SwitchRenderPropsEmbedState extends State<_SwitchRenderPropsEmbed> {
  bool _on = false;

  @override
  Widget build(BuildContext context) {
    return RiseSwitch(
      value: _on,
      onChanged: (v) => setState(() => _on = v),
      label: Text(_on ? 'Enabled' : 'Disabled'),
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
