import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';
import '../surface/rise_surface.dart';

/// Prominence levels aligned with HeroUI [Card](https://heroui.com/docs/react/components/card)
/// ([card.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/card.css)).
enum RiseCardVariant {
  /// `card--transparent` — no fill or shadow (nested cards).
  transparent,

  /// `card--default` / `bg-surface`.
  standard,

  /// `card--secondary` / `bg-surface-secondary`.
  secondary,

  /// `card--tertiary` / `bg-surface-tertiary`.
  tertiary,
}

RiseSurfaceVariant _surfaceForCard(RiseCardVariant variant) {
  return switch (variant) {
    RiseCardVariant.transparent => RiseSurfaceVariant.transparent,
    RiseCardVariant.standard => RiseSurfaceVariant.primary,
    RiseCardVariant.secondary => RiseSurfaceVariant.secondary,
    RiseCardVariant.tertiary => RiseSurfaceVariant.tertiary,
  };
}

/// Flexible container for grouped content ([card.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/card/card.tsx)).
///
/// Uses `rounded-3xl`, padding, column `gap-3` (12px), and Hero surface variants.
/// Prefer the compound widgets ([RiseCardHeader], [RiseCardTitle], …) for anatomy
/// matching `Card.Header` / `Card.Title` / etc.
class RiseCard extends StatelessWidget {
  /// Vertical spacing between [RiseCardHeader], [RiseCardContent], and [RiseCardFooter]
  /// when composing manually inside [child] (HeroUI `gap-3`).
  static const double sectionGap = 12;

  const RiseCard({
    super.key,
    required this.child,
    this.header,
    this.footer,
    this.variant = RiseCardVariant.standard,
    this.padding = const EdgeInsets.all(16),
    this.borderRadius = 24,
    this.clipBehavior = Clip.antiAlias,
  });

  final Widget child;

  /// Optional header above [child] (legacy slot). For Hero anatomy use [RiseCardHeader] inside [child].
  final Widget? header;

  /// Optional footer below [child] (legacy slot).
  final Widget? footer;

  final RiseCardVariant variant;

  /// Default `p-4` (16).
  final EdgeInsetsGeometry padding;

  /// `rounded-3xl` (24).
  final double borderRadius;

  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    Widget body = child;
    if (header != null || footer != null) {
      body = Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (header != null) ...[
            header!,
            const SizedBox(height: sectionGap),
          ],
          child,
          if (footer != null) ...[
            const SizedBox(height: sectionGap),
            footer!,
          ],
        ],
      );
    }

    final inner = variant == RiseCardVariant.transparent
        ? body
        : _CardOnSurfaceScope(child: body);

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      clipBehavior: clipBehavior,
      child: RiseSurface(
        variant: _surfaceForCard(variant),
        padding: padding,
        borderRadius: borderRadius,
        child: inner,
      ),
    );
  }
}

/// Provides foreground/muted defaults similar to Hero `SurfaceContext` for non-transparent cards.
class _CardOnSurfaceScope extends StatelessWidget {
  const _CardOnSurfaceScope({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final baseStyle = Theme.of(context).textTheme.bodyMedium ?? const TextStyle();
    return IconTheme.merge(
      data: IconThemeData(color: rise.defaultForeground),
      child: DefaultTextStyle.merge(
        style: baseStyle.copyWith(
          color: rise.defaultForeground,
          fontSize: 14,
          height: 20 / 14,
        ),
        child: child,
      ),
    );
  }
}

/// `card__header` — column header region.
class RiseCardHeader extends StatelessWidget {
  const RiseCardHeader({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [child],
    );
  }
}

/// `card__title` — `text-sm` / `font-medium` / foreground (maps to `h3` in Hero).
class RiseCardTitle extends StatelessWidget {
  const RiseCardTitle({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    return Semantics(
      header: true,
      child: DefaultTextStyle(
        style: TextStyle(
          fontSize: 14,
          height: 24 / 14,
          fontWeight: FontWeight.w500,
          color: rise.defaultForeground,
        ),
        child: child,
      ),
    );
  }
}

/// `card__description` — muted supporting copy.
class RiseCardDescription extends StatelessWidget {
  const RiseCardDescription({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        fontSize: 14,
        height: 20 / 14,
        color: context.riseTheme.mutedForeground(),
      ),
      child: child,
    );
  }
}

/// `card__content` — main body (`flex-1` column semantics for layout children).
class RiseCardContent extends StatelessWidget {
  const RiseCardContent({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [child],
    );
  }
}

/// `card__footer` — trailing actions (typically a [Row] of buttons).
class RiseCardFooter extends StatelessWidget {
  const RiseCardFooter({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    return IconTheme.merge(
      data: IconThemeData(color: rise.defaultForeground),
      child: DefaultTextStyle.merge(
        style: TextStyle(color: rise.defaultForeground, fontSize: 14, height: 20 / 14),
        child: child,
      ),
    );
  }
}
