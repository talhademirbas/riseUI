import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';
import '../surface/rise_surface.dart';

/// Prominence levels aligned with HeroUI [Card](https://heroui.com/docs/react/components/card)
/// ([card.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/card.css)).
enum RiseCardVariant {
  /// `card--transparent` — `border-none bg-transparent shadow-none` (nested cards).
  transparent,

  /// Hero `default` — `card--default` / `bg-surface`.
  default_,

  /// `card--secondary` / `bg-surface-secondary`.
  secondary,

  /// `card--tertiary` / `bg-surface-tertiary`.
  tertiary,
}

RiseSurfaceVariant _surfaceForCard(RiseCardVariant variant) {
  return switch (variant) {
    RiseCardVariant.transparent => RiseSurfaceVariant.transparent,
    RiseCardVariant.default_ => RiseSurfaceVariant.primary,
    RiseCardVariant.secondary => RiseSurfaceVariant.secondary,
    RiseCardVariant.tertiary => RiseSurfaceVariant.tertiary,
  };
}

/// Flexible container for grouped content ([card.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/card/card.tsx)).
///
/// Uses `rounded-3xl`, `p-4`, column `gap-3` (12px), `shadow-surface` when not transparent
/// ([card.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/card.css)).
/// Prefer the compound widgets ([RiseCardHeader], [RiseCardTitle], …) for anatomy
/// matching `Card.Header` / `Card.Title` / etc.
class RiseCard extends StatelessWidget {
  /// Spacing between header / content / footer sections (`.card` `gap-3`).
  static const double sectionGap = 12;

  /// Inner content stack spacing (`.card__content` `gap-1`).
  static const double contentGap = 4;

  const RiseCard({
    super.key,
    required this.child,
    this.header,
    this.footer,
    this.variant = RiseCardVariant.default_,
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

/// `card__header` — `flex flex-col` ([card.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/card.css)).
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

/// `card__title` — `text-sm font-medium text-foreground` (renders as `h3` in Hero).
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

/// `card__content` — `flex-1 flex-col gap-1` (use [RiseCard.contentGap] between stacked blocks).
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

/// `card__footer` — `flex flex-row items-center` for trailing actions.
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(child: child),
          ],
        ),
      ),
    );
  }
}
