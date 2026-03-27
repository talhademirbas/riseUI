import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// Prominence levels aligned with HeroUI [Surface](https://heroui.com/docs/react/components/surface)
/// (`--surface`, `--surface-secondary`, `--surface-tertiary`, `transparent`).
enum RiseSurfaceVariant {
  /// HeroUI `default` — `--surface`.
  primary,

  /// HeroUI `secondary` — `--surface-secondary`.
  secondary,

  /// HeroUI `tertiary` — `--surface-tertiary`.
  tertiary,

  /// HeroUI `transparent` — no fill or shadow (`SurfaceContext` still exposed).
  transparent,
}

/// Exposes the enclosing [RiseSurfaceVariant] to descendants (Hero `SurfaceContext`).
class RiseSurfaceScope extends InheritedWidget {
  const RiseSurfaceScope({
    super.key,
    required this.variant,
    required super.child,
  });

  final RiseSurfaceVariant variant;

  static RiseSurfaceVariant? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<RiseSurfaceScope>()?.variant;
  }

  /// Non-rebuilding read (e.g. in [State.initState]).
  static RiseSurfaceVariant? maybeReadOf(BuildContext context) {
    return context.getInheritedWidgetOfExactType<RiseSurfaceScope>()?.variant;
  }

  @override
  bool updateShouldNotify(RiseSurfaceScope oldWidget) {
    return variant != oldWidget.variant;
  }
}

/// Rounded container using [RiseThemeData] surface tokens and Hero `--surface-shadow` (light only).
///
/// Non-[RiseSurfaceVariant.transparent] surfaces wrap [child] with
/// [DefaultTextStyle] / [IconTheme] using [RiseThemeData.defaultForeground].
class RiseSurface extends StatelessWidget {
  const RiseSurface({
    super.key,
    required this.child,
    this.variant = RiseSurfaceVariant.primary,
    this.padding = const EdgeInsets.all(16),
    this.borderRadius = 24,
  });

  final Widget child;

  final RiseSurfaceVariant variant;

  final EdgeInsetsGeometry padding;

  /// Corner radius (`rounded-3xl` ≈ 24; Hero examples often use `rounded-2xl` — override as needed).
  final double borderRadius;

  /// Approximates `--surface-shadow` first layers from [variables.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/themes/default/variables.css).
  static List<BoxShadow> _surfaceShadowsLight() {
    return const [
      BoxShadow(color: Color(0x0A000000), offset: Offset(0, 2), blurRadius: 4),
      BoxShadow(color: Color(0x0F000000), offset: Offset(0, 1), blurRadius: 2),
      BoxShadow(color: Color(0x0F000000), offset: Offset(0, 0), blurRadius: 0, spreadRadius: 1),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final Color bg = switch (variant) {
      RiseSurfaceVariant.primary => rise.surface,
      RiseSurfaceVariant.secondary => rise.surfaceSecondary,
      RiseSurfaceVariant.tertiary => rise.surfaceTertiary,
      RiseSurfaceVariant.transparent => Colors.transparent,
    };

    final List<BoxShadow>? shadows = variant == RiseSurfaceVariant.transparent || isDark
        ? null
        : _surfaceShadowsLight();

    Widget inner = Padding(
      padding: padding,
      child: child,
    );

    if (variant != RiseSurfaceVariant.transparent) {
      inner = DefaultTextStyle.merge(
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: rise.defaultForeground,
                  fontSize: 14,
                  height: 20 / 14,
                ) ??
            TextStyle(color: rise.defaultForeground, fontSize: 14, height: 20 / 14),
        child: IconTheme.merge(
          data: IconThemeData(color: rise.defaultForeground),
          child: inner,
        ),
      );
    }

    return RiseSurfaceScope(
      variant: variant,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: shadows,
        ),
        child: inner,
      ),
    );
  }
}
