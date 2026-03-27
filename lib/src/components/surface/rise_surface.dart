import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// Prominence levels aligned with HeroUI [Surface](https://heroui.com/docs/react/components/surface)
/// ([surface.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/surface.css),
/// [surface.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/surface/surface.tsx)).
enum RiseSurfaceVariant {
  /// HeroUI `default` — `bg-surface` / `colorScheme.surface`.
  primary,

  /// HeroUI `secondary` — `bg-surface-secondary` / `surfaceContainer`.
  secondary,

  /// HeroUI `tertiary` — `bg-surface-tertiary` / `surfaceContainerHighest`.
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

/// Rounded container with elevation and optional on-surface typography defaults.
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

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final rise = context.riseTheme;
    final Color bg = switch (variant) {
      RiseSurfaceVariant.primary => cs.surface,
      RiseSurfaceVariant.secondary => cs.surfaceContainer,
      RiseSurfaceVariant.tertiary => cs.surfaceContainerHighest,
      RiseSurfaceVariant.transparent => Colors.transparent,
    };

    final List<BoxShadow>? shadows = variant == RiseSurfaceVariant.transparent
        ? null
        : [
            BoxShadow(
              color: Theme.of(context).shadowColor.withValues(alpha: 0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ];

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
