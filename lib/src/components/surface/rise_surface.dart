import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// Prominence levels aligned with HeroUI [Surface](https://heroui.com/docs/react/components/surface)
/// ([surface.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/surface.css)
/// `surface--default` / `secondary` / `tertiary` / `transparent`).
enum RiseSurfaceVariant {
  /// HeroUI `default` — `surface--default` / `bg-surface`.
  default_,

  /// `surface--secondary` / `bg-surface-secondary`.
  secondary,

  /// `surface--tertiary` / `bg-surface-tertiary`.
  tertiary,

  /// `surface--transparent` — no fill (`SurfaceContext` still exposed).
  transparent,
}

/// Exposes the enclosing [RiseSurfaceVariant] to descendants (Hero [SurfaceContext](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/surface/surface.tsx)).
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

/// Semantic shell using [RiseThemeData] surface tokens.
///
/// Hero’s base [surface.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/surface.css)
/// is **fill + foreground only** (no shadow). Composite components that need elevation
/// (e.g. [RiseCard], [RiseListGroup]) pass [showShadow] to apply `--surface-shadow` in light mode.
///
/// Non-[RiseSurfaceVariant.transparent] surfaces wrap [child] with [DefaultTextStyle] /
/// [IconTheme] using on-surface foreground (Hero `text-surface-foreground` resolves to theme foreground).
class RiseSurface extends StatelessWidget {
  const RiseSurface({
    super.key,
    required this.child,
    this.variant = RiseSurfaceVariant.default_,
    this.padding = const EdgeInsets.all(16),
    this.borderRadius = 24,
    this.showShadow = false,
  });

  final Widget child;

  final RiseSurfaceVariant variant;

  final EdgeInsetsGeometry padding;

  /// Corner radius (`rounded-3xl` ≈ 24).
  final double borderRadius;

  /// When true (non-transparent, light theme), applies Hero `--surface-shadow` layers.
  /// Default **false** so standalone [RiseSurface] matches `surface.css` (shadowless).
  final bool showShadow;

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
      RiseSurfaceVariant.default_ => rise.surface,
      RiseSurfaceVariant.secondary => rise.surfaceSecondary,
      RiseSurfaceVariant.tertiary => rise.surfaceTertiary,
      RiseSurfaceVariant.transparent => Colors.transparent,
    };

    final List<BoxShadow>? shadows =
        showShadow && variant != RiseSurfaceVariant.transparent && !isDark ? _surfaceShadowsLight() : null;

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
