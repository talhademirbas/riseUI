/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_switch.dart`. */

export const switchUsageCode = `RiseSwitch(
  value: on,
  onChanged: (v) => setState(() => on = v),
  label: const Text('Enable notifications'),
)`;

export const switchDisabledCode = `RiseSwitch(
  value: true,
  onChanged: (_) {},
  isDisabled: true,
  label: const Text('Enable notifications'),
)`;

export const switchSizesCode = `RiseSwitch(
  size: RiseSwitchSize.sm,
  value: on,
  onChanged: (v) => setState(() => on = v),
  label: const Text('Small'),
)`;

export const switchLabelPositionCode = `RiseSwitch(
  labelPosition: RiseSwitchLabelPosition.before,
  value: on,
  onChanged: (v) => setState(() => on = v),
  label: const Text('Label before'),
)`;

export const switchWithDescriptionCode = `RiseSwitch(
  value: on,
  onChanged: (v) => setState(() => on = v),
  label: const Text('Public profile'),
  description: const Text('Allow others to see your profile information'),
)`;

export const switchWithIconsCode = `RiseSwitch(
  value: on,
  onChanged: (v) => setState(() => on = v),
  label: const Text('Alerts'),
  thumbIconSelected: Icons.notifications_active_outlined,
  thumbIconUnselected: Icons.notifications_off_outlined,
)`;

export const switchGroupCode = `RiseSwitchGroup(
  children: [
    RiseSwitch(
      value: a,
      onChanged: (v) => setState(() => a = v),
      label: const Text('Allow notifications'),
    ),
    RiseSwitch(
      value: b,
      onChanged: (v) => setState(() => b = v),
      label: const Text('Marketing emails'),
    ),
  ],
)`;

export const switchGroupHorizontalCode = `RiseSwitchGroup(
  orientation: Axis.horizontal,
  spacing: 24,
  children: [
    SizedBox(
      width: 200,
      child: RiseSwitch(
        value: a,
        onChanged: (v) => setState(() => a = v),
        label: const Text('Notifications'),
      ),
    ),
  ],
)`;
