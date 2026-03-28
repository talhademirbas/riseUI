import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// Track size (HeroUI `size`: `sm` | `md` | `lg` — see `switch.css`).
enum RiseSwitchSize {
  sm,
  md,
  lg,
}

/// Label placement relative to the control (HeroUI label before / after patterns).
enum RiseSwitchLabelPosition {
  /// Label and optional description column at the start; control at the end.
  before,

  /// Control at the start; label column at the end (common HeroUI row).
  after,
}

/// Boolean toggle with optional label/description and sizes — aligned with
/// [HeroUI Switch](https://heroui.com/docs/react/components/switch), [switch.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/switch/switch.tsx),
/// and `switch.css`.
class RiseSwitch extends StatelessWidget {
  const RiseSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.isDisabled = false,
    this.size = RiseSwitchSize.md,
    this.labelPosition = RiseSwitchLabelPosition.after,
    this.label,
    this.description,
    this.semanticLabel,
    this.thumbIconSelected,
    this.thumbIconUnselected,
    this.accentColor,
  });

  final bool value;

  final ValueChanged<bool>? onChanged;

  /// HeroUI `isDisabled`.
  final bool isDisabled;

  final RiseSwitchSize size;

  final RiseSwitchLabelPosition labelPosition;

  /// Primary label (HeroUI `<Label />` inside `Switch.Content`).
  final Widget? label;

  /// Secondary line under the label (HeroUI `<Description />`).
  final Widget? description;

  /// Accessibility when [label] is null (HeroUI `aria-label`).
  final String? semanticLabel;

  /// Optional icon in the thumb when on (HeroUI `Switch.Icon`).
  final IconData? thumbIconSelected;

  /// Optional icon in the thumb when off.
  final IconData? thumbIconUnselected;

  /// Checked track color — overrides [RiseThemeData.accent] (HeroUI `WithIcons` / custom styles).
  final Color? accentColor;

  /// Scales the Material [Switch] toward [switch.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/switch.css) track sizes (sm/md/lg).
  static double _scale(RiseSwitchSize s) {
    return switch (s) {
      RiseSwitchSize.sm => 0.78,
      RiseSwitchSize.md => 1.0,
      RiseSwitchSize.lg => 1.22,
    };
  }

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);
    final effectiveOnChanged = isDisabled ? null : onChanged;

    Widget control = SwitchTheme(
      data: _themeData(rise, accentColor: accentColor),
      child: Switch(
        value: value,
        onChanged: effectiveOnChanged,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        thumbIcon: _thumbIconProperty(rise, accentColor: accentColor),
      ),
    );

    control = Transform.scale(
      scale: _scale(size),
      alignment: Alignment.center,
      child: control,
    );

    if (label == null && description == null) {
      final leaf = semanticLabel != null
          ? Semantics(
              label: semanticLabel,
              toggled: value,
              child: control,
            )
          : control;
      return leaf;
    }

    assert(
      label != null || description == null,
      'RiseSwitch: use a label when providing a description.',
    );

    // Hero `switch__label`: text-base font-medium text-foreground
    final labelStyle = theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w500,
          color: rise.defaultForeground,
        ) ??
        theme.textTheme.bodyLarge?.copyWith(
          color: rise.defaultForeground,
          fontWeight: FontWeight.w500,
        );

    final labelColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null)
          DefaultTextStyle(
            style: labelStyle ?? const TextStyle(),
            child: label!,
          ),
        // Hero `switch__content`: flex-col gap-0 — keep description tight to the label.
        if (description != null)
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: DefaultTextStyle(
              style: theme.textTheme.bodyMedium?.copyWith(
                    color: rise.mutedForeground(0.65),
                    height: 1.45,
                  ) ??
                  TextStyle(color: rise.mutedForeground(0.65), height: 1.45),
              child: description!,
            ),
          ),
      ],
    );

    // Hero `.switch`: gap-3 between control and label column
    const gap = 12.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final bounded = constraints.maxWidth.isFinite;

        Widget content = labelColumn;
        final toggle = effectiveOnChanged;
        if (toggle != null) {
          content = GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => toggle(!value),
            child: content,
          );
        }

        // Label before: keep label + control adjacent (no Expanded — avoids a wide empty gap).
        if (labelPosition == RiseSwitchLabelPosition.before) {
          return MergeSemantics(
            child: Semantics(
              label: semanticLabel,
              toggled: value,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    content,
                    const SizedBox(width: gap),
                    control,
                  ],
                ),
              ),
            ),
          );
        }

        // Label after: control first; label fills remaining width when bounded.
        final rowChildren = bounded
            ? <Widget>[
                control,
                const SizedBox(width: gap),
                Expanded(child: content),
              ]
            : <Widget>[
                control,
                const SizedBox(width: gap),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 280),
                  child: content,
                ),
              ];

        return MergeSemantics(
          child: Semantics(
            label: semanticLabel,
            toggled: value,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: rowChildren,
            ),
          ),
        );
      },
    );
  }

  WidgetStateProperty<Icon?>? _thumbIconProperty(RiseThemeData rise, {Color? accentColor}) {
    if (thumbIconSelected == null && thumbIconUnselected == null) {
      return null;
    }
    final onAccent = accentColor ?? rise.accent;
    return WidgetStateProperty.resolveWith<Icon?>((states) {
      final selected = states.contains(WidgetState.selected);
      if (selected && thumbIconSelected != null) {
        return Icon(thumbIconSelected, size: 14, color: onAccent);
      }
      if (!selected && thumbIconUnselected != null) {
        return Icon(thumbIconUnselected, size: 14, color: rise.mutedForeground(0.8));
      }
      return null;
    });
  }

  static SwitchThemeData _themeData(RiseThemeData rise, {Color? accentColor}) {
    final disabled = rise.disabledOpacity;
    final accent = accentColor ?? rise.accent;
    final thumbWhenOn =
        accentColor != null ? Colors.white : rise.accentForeground;
    return SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return rise.defaultForeground.withValues(alpha: 0.35);
        }
        if (states.contains(WidgetState.selected)) {
          return thumbWhenOn;
        }
        return rise.background;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return rise.muted.withValues(alpha: disabled);
        }
        if (states.contains(WidgetState.selected)) {
          return accent;
        }
        return rise.muted;
      }),
      trackOutlineColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return rise.border.withValues(alpha: 0.25);
        }
        return rise.border.withValues(alpha: 0.35);
      }),
      trackOutlineWidth: WidgetStateProperty.all(0),
      overlayColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return Colors.transparent;
        }
        return rise.accent.withValues(alpha: 0.12);
      }),
    );
  }
}

/// Groups multiple [RiseSwitch] rows (HeroUI [SwitchGroup](https://heroui.com/docs/react/components/switch) + `switch-group` layout).
class RiseSwitchGroup extends StatelessWidget {
  const RiseSwitchGroup({
    super.key,
    required this.children,
    this.orientation = Axis.vertical,
    this.spacing = 12,
  });

  final List<Widget> children;

  /// `vertical` (default) or `horizontal` scrollable row.
  final Axis orientation;

  final double spacing;

  @override
  Widget build(BuildContext context) {
    if (orientation == Axis.horizontal) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _withSpacing(children, spacing, horizontal: true),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: _withSpacing(children, spacing, horizontal: false),
    );
  }

  static List<Widget> _withSpacing(List<Widget> children, double gap, {required bool horizontal}) {
    if (children.isEmpty) return children;
    final out = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      if (i > 0) {
        out.add(horizontal ? SizedBox(width: gap) : SizedBox(height: gap));
      }
      out.add(children[i]);
    }
    return out;
  }
}
