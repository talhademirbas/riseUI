import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// Visual variant aligned with HeroUI InputGroup (`primary` / `secondary`)
/// ([input-group.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/input-group.css)).
enum RiseInputGroupVariant {
  /// Default: field fill + `shadow-field`.
  primary,

  /// `shadow-none`, `--color-default` fill.
  secondary,
}

/// Scope for [RiseInput] children inside [RiseInputGroup] — borderless “slot” input
/// ([input-group.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/input-group/input-group.tsx)).
@immutable
class RiseInputGroupScope extends InheritedWidget {
  const RiseInputGroupScope({
    super.key,
    required this.variant,
    required this.hasPrefix,
    required this.hasSuffix,
    required this.enabled,
    required this.isInvalid,
    required this.registerPrimaryFocus,
    required this.onChildFocusChanged,
    required super.child,
  });

  final RiseInputGroupVariant variant;

  final bool hasPrefix;

  final bool hasSuffix;

  final bool enabled;

  final bool isInvalid;

  /// First [FocusNode] from a child [RiseInput] — used for tap-to-focus (Hero `Group` click).
  final void Function(FocusNode node) registerPrimaryFocus;

  final ValueChanged<bool> onChildFocusChanged;

  static RiseInputGroupScope? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<RiseInputGroupScope>();
  }

  @override
  bool updateShouldNotify(RiseInputGroupScope oldWidget) {
    return variant != oldWidget.variant ||
        hasPrefix != oldWidget.hasPrefix ||
        hasSuffix != oldWidget.hasSuffix ||
        enabled != oldWidget.enabled ||
        isInvalid != oldWidget.isInvalid;
  }
}

/// Distinguishes first/middle/last slot for `.input-group__input` padding (`pl-0` / `pr-0`).
@immutable
class RiseInputGroupIndexScope extends InheritedWidget {
  const RiseInputGroupIndexScope({
    super.key,
    required this.index,
    required this.count,
    required super.child,
  });

  final int index;
  final int count;

  bool get isFirst => index == 0;

  bool get isLast => index == count - 1;

  static RiseInputGroupIndexScope? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<RiseInputGroupIndexScope>();
  }

  @override
  bool updateShouldNotify(RiseInputGroupIndexScope oldWidget) {
    return index != oldWidget.index || count != oldWidget.count;
  }
}

/// Grouped controls with shared chrome and prefix/suffix slots (HeroUI
/// [InputGroup](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/input-group/input-group.tsx)).
///
/// Place [RiseInput] in [children]; the group draws one border/shadow; inputs render borderless
/// like `InputGroup.Input` + [input-group.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/input-group.css).
class RiseInputGroup extends StatefulWidget {
  const RiseInputGroup({
    super.key,
    required this.children,
    this.prefix,
    this.suffix,
    this.leading,
    this.trailing,
    this.variant = RiseInputGroupVariant.primary,
    this.fullWidth = false,
    this.borderRadius = 14,
    this.enabled = true,
    this.isInvalid = false,
  })  : assert(prefix == null || leading == null, 'Use either prefix or leading, not both.'),
        assert(suffix == null || trailing == null, 'Use either suffix or trailing, not both.');

  final List<Widget> children;

  final Widget? prefix;

  final Widget? suffix;

  final Widget? leading;

  final Widget? trailing;

  final RiseInputGroupVariant variant;

  final bool fullWidth;

  final double borderRadius;

  final bool enabled;

  final bool isInvalid;

  static const double _kMinHeight = 48;

  @override
  State<RiseInputGroup> createState() => _RiseInputGroupState();
}

class _RiseInputGroupState extends State<RiseInputGroup> {
  FocusNode? _registeredFocus;
  bool _focusWithin = false;
  bool _hovering = false;

  void _registerPrimaryFocus(FocusNode node) {
    if (_registeredFocus != null) return;
    _registeredFocus = node;
    setState(() {});
  }

  void _onChildFocusChanged(bool hasFocus) {
    if (hasFocus != _focusWithin) {
      setState(() => _focusWithin = hasFocus);
    }
  }

  /// Same shell fills as [RiseListGroup] / [RiseSurface] (`bg-surface` / `bg-surface-secondary`).
  Color _baseFill(RiseThemeData rise, ThemeData theme) {
    return widget.variant == RiseInputGroupVariant.primary
        ? rise.surface
        : rise.surfaceSecondary;
  }

  Color _resolveFill(RiseThemeData rise, ThemeData theme) {
    final base = _baseFill(rise, theme);
    if (!widget.enabled) {
      return base.withValues(alpha: 0.65);
    }
    // Focus / invalid: border only — background stays stable (matches standalone [RiseInput]).
    if (_hovering && !_focusWithin) {
      if (widget.variant == RiseInputGroupVariant.primary) {
        return Color.lerp(base, rise.muted, 0.22)!;
      }
      return rise.resolveDefaultHover();
    }
    return base;
  }

  Color _borderColor(RiseThemeData rise) {
    if (!widget.enabled) {
      return rise.border.withValues(alpha: rise.disabledOpacity);
    }
    if (widget.isInvalid) {
      return rise.danger;
    }
    if (_focusWithin) {
      return rise.accent;
    }
    return rise.border;
  }

  double _borderWidth() {
    if (!widget.enabled) return 1;
    if (widget.isInvalid) {
      return _focusWithin ? 2 : 1.5;
    }
    if (_focusWithin) return 2;
    return 1;
  }

  Widget _affix(
    BuildContext context, {
    required Widget child,
  }) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);
    // No inner vertical rules — single outer border from the group (Hero separators
    // often read as a “box inside the field” in Flutter; spacing only).
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Center(
        child: DefaultTextStyle.merge(
          style: theme.textTheme.bodyMedium?.copyWith(
                color: rise.mutedForeground(0.75),
                fontSize: 14,
              ) ??
              TextStyle(color: rise.mutedForeground(0.75), fontSize: 14),
          child: IconTheme.merge(
            data: IconThemeData(size: 18, color: rise.mutedForeground(0.7)),
            child: child,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);
    final resolvedPrefix = widget.prefix ?? widget.leading;
    final resolvedSuffix = widget.suffix ?? widget.trailing;
    final hasP = resolvedPrefix != null;
    final hasS = resolvedSuffix != null;
    final n = widget.children.length;

    final rowChildren = <Widget>[];
    if (hasP) {
      rowChildren.add(
        SizedBox(
          height: RiseInputGroup._kMinHeight,
          child: _affix(context, child: resolvedPrefix),
        ),
      );
    }
    for (var i = 0; i < widget.children.length; i++) {
      if (i > 0) {
        rowChildren.add(const SizedBox(width: 8));
      }
      rowChildren.add(
        Expanded(
          child: RiseInputGroupIndexScope(
            index: i,
            count: n,
            child: widget.children[i],
          ),
        ),
      );
    }
    if (hasS) {
      rowChildren.add(
        SizedBox(
          height: RiseInputGroup._kMinHeight,
          child: _affix(context, child: resolvedSuffix),
        ),
      );
    }

    final fill = _resolveFill(rise, theme);
    final borderSide = BorderSide(color: _borderColor(rise), width: _borderWidth());
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      side: borderSide,
    );

    Widget core = MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: Material(
        color: fill,
        elevation: widget.variant == RiseInputGroupVariant.primary ? 1 : 0,
        shadowColor: widget.variant == RiseInputGroupVariant.primary
            ? Colors.black.withValues(alpha: 0.08)
            : Colors.transparent,
        surfaceTintColor: Colors.transparent,
        shape: shape,
        clipBehavior: Clip.antiAlias,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: widget.enabled ? () => _registeredFocus?.requestFocus() : null,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: RiseInputGroup._kMinHeight),
            child: Row(
              // `stretch` + unbounded parent height passes infinite cross-axis constraints
              // to non-flex children (e.g. in ListView) — use `center` + explicit affix heights.
              crossAxisAlignment: CrossAxisAlignment.center,
              children: rowChildren,
            ),
          ),
        ),
      ),
    );

    core = RiseInputGroupScope(
      variant: widget.variant,
      hasPrefix: hasP,
      hasSuffix: hasS,
      enabled: widget.enabled,
      isInvalid: widget.isInvalid,
      registerPrimaryFocus: _registerPrimaryFocus,
      onChildFocusChanged: _onChildFocusChanged,
      child: IgnorePointer(
        ignoring: !widget.enabled,
        child: Opacity(
          opacity: widget.enabled ? 1 : rise.disabledOpacity,
          child: core,
        ),
      ),
    );

    core = Theme(
      data: theme.copyWith(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
      ),
      child: core,
    );

    if (widget.fullWidth) {
      return SizedBox(width: double.infinity, child: core);
    }
    return core;
  }
}
