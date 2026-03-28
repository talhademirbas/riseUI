import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// Hero [scroll-shadow.styles.ts](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/src/components/scroll-shadow/scroll-shadow.styles.ts)
/// (`fade` / `blur` in Storybook — CSS currently ships `fade` only).
enum RiseScrollShadowEffect {
  /// Opacity-style edge fades (default).
  fade,

  /// Softer edges via blurred gradient overlays (Storybook “Blur” label).
  blur,
}

/// Matches HeroUI [ScrollShadowVisibility](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/scroll-shadow/scroll-shadow.tsx).
enum RiseScrollShadowVisibility {
  /// Detect scroll position from the child [Scrollable] ([use-scroll-shadow.ts](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/scroll-shadow/use-scroll-shadow.ts)).
  auto,

  /// Vertical: top and bottom fades. Horizontal: left and right.
  both,

  /// Vertical leading fade only (Hero `top` / `data-top-scroll`).
  top,

  /// Vertical trailing fade only (`bottom` / `data-bottom-scroll`).
  bottom,

  /// Horizontal leading fade (`left`).
  left,

  /// Horizontal trailing fade (`right`).
  right,

  /// No edge fades (`data-*` cleared in controlled mode).
  none,
}

/// Edge fade hints for overflowing scrollables — aligned with HeroUI [ScrollShadow](https://heroui.com/docs/react/components/scroll-shadow)
/// and [scroll-shadow.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/scroll-shadow.css)
/// (`--scroll-shadow-size`, vertical / horizontal, `hide-scrollbar`).
class RiseScrollShadow extends StatefulWidget {
  const RiseScrollShadow({
    super.key,
    required this.child,
    this.axis = Axis.vertical,
    this.size = 40,
    this.offset = 0,
    this.hideScrollBar = false,
    this.isEnabled = true,
    this.visibility = RiseScrollShadowVisibility.auto,
    this.onVisibilityChange,
    this.shadowColor,
    this.effect = RiseScrollShadowEffect.fade,
  });

  final Widget child;

  /// [Axis.vertical] → Hero `orientation="vertical"`; [Axis.horizontal] → `horizontal`.
  final Axis axis;

  /// Fade extent in logical pixels (Hero `size`, default `40`).
  final double size;

  /// Pixels of scroll past an edge before showing that edge’s fade (Hero `offset`, default `0`).
  final double offset;

  /// Hero `hideScrollBar` — hides the Material scrollbar thumb for descendant scrollables.
  final bool hideScrollBar;

  /// Hero `isEnabled` — when false, no fades are shown and auto detection is off.
  final bool isEnabled;

  /// Hero `visibility` — `auto` tracks the child; other values force fades (controlled mode).
  final RiseScrollShadowVisibility visibility;

  /// Hero `onVisibilityChange` — only fired when [visibility] is [RiseScrollShadowVisibility.auto] and [isEnabled] is true.
  final ValueChanged<RiseScrollShadowVisibility>? onVisibilityChange;

  /// Tint for the fade; defaults to [RiseThemeData.defaultForeground] at low opacity.
  final Color? shadowColor;

  /// Edge fade style — `fade` or soft `blur` overlays (Hero Storybook `Variants`).
  final RiseScrollShadowEffect effect;

  @override
  State<RiseScrollShadow> createState() => _RiseScrollShadowState();
}

class _RiseScrollShadowState extends State<RiseScrollShadow> {
  bool _showLeading = false;
  bool _showTrailing = false;
  RiseScrollShadowVisibility? _lastEmitted;

  void _applyMetrics(ScrollMetrics m) {
    if (!m.hasContentDimensions) return;

    if (!widget.isEnabled) {
      _setVisibilityFlags(false, false);
      return;
    }

    if (widget.visibility != RiseScrollShadowVisibility.auto) {
      final pair = _controlledShadows();
      _setVisibilityFlags(pair.$1, pair.$2);
      return;
    }

    final o = widget.offset;
    final pixels = m.pixels;
    final minExt = m.minScrollExtent;
    final maxExt = m.maxScrollExtent;
    final extent = m.viewportDimension;

    final hasLeading = pixels > minExt + o;
    final hasTrailing = pixels + extent + o < maxExt;

    bool leading;
    bool trailing;
    if (hasLeading && hasTrailing) {
      leading = true;
      trailing = true;
    } else {
      leading = hasLeading;
      trailing = hasTrailing;
    }

    _setVisibilityFlags(leading, trailing);
    _emitAutoVisibility(hasLeading, hasTrailing);
  }

  (bool, bool) _controlledShadows() => switch (widget.visibility) {
        RiseScrollShadowVisibility.auto => (false, false),
        RiseScrollShadowVisibility.both => (true, true),
        RiseScrollShadowVisibility.none => (false, false),
        RiseScrollShadowVisibility.top =>
          widget.axis == Axis.vertical ? (true, false) : (false, false),
        RiseScrollShadowVisibility.bottom =>
          widget.axis == Axis.vertical ? (false, true) : (false, false),
        RiseScrollShadowVisibility.left =>
          widget.axis == Axis.horizontal ? (true, false) : (false, false),
        RiseScrollShadowVisibility.right =>
          widget.axis == Axis.horizontal ? (false, true) : (false, false),
      };

  void _setVisibilityFlags(bool leading, bool trailing) {
    if (leading != _showLeading || trailing != _showTrailing) {
      setState(() {
        _showLeading = leading;
        _showTrailing = trailing;
      });
    }
  }

  void _emitAutoVisibility(bool hasLeading, bool hasTrailing) {
    if (widget.visibility != RiseScrollShadowVisibility.auto ||
        !widget.isEnabled ||
        widget.onVisibilityChange == null) {
      return;
    }

    final RiseScrollShadowVisibility next;
    if (widget.axis == Axis.vertical) {
      if (hasLeading && hasTrailing) {
        next = RiseScrollShadowVisibility.both;
      } else if (hasLeading) {
        next = RiseScrollShadowVisibility.top;
      } else if (hasTrailing) {
        next = RiseScrollShadowVisibility.bottom;
      } else {
        next = RiseScrollShadowVisibility.none;
      }
    } else {
      if (hasLeading && hasTrailing) {
        next = RiseScrollShadowVisibility.both;
      } else if (hasLeading) {
        next = RiseScrollShadowVisibility.left;
      } else if (hasTrailing) {
        next = RiseScrollShadowVisibility.right;
      } else {
        next = RiseScrollShadowVisibility.none;
      }
    }

    if (_lastEmitted != next) {
      _lastEmitted = next;
      widget.onVisibilityChange!(next);
    }
  }

  bool _onScroll(ScrollNotification n) {
    _applyMetrics(n.metrics);
    return false;
  }

  bool _onMetrics(ScrollMetricsNotification n) {
    _applyMetrics(n.metrics);
    return false;
  }

  @override
  void didUpdateWidget(RiseScrollShadow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.visibility != widget.visibility ||
        oldWidget.axis != widget.axis ||
        oldWidget.isEnabled != widget.isEnabled ||
        oldWidget.effect != widget.effect) {
      _lastEmitted = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final controlled = widget.visibility != RiseScrollShadowVisibility.auto
        ? _controlledShadows()
        : null;
    final effectiveLeading =
        !widget.isEnabled ? false : (controlled != null ? controlled.$1 : _showLeading);
    final effectiveTrailing =
        !widget.isEnabled ? false : (controlled != null ? controlled.$2 : _showTrailing);

    final rise = context.riseTheme;
    final base = widget.shadowColor ?? rise.defaultForeground;
    final fade = base.withValues(alpha: 0.14);
    final extent = widget.size;

    final Gradient leadingVertical = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [fade, Colors.transparent],
    );
    final Gradient trailingVertical = LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [fade, Colors.transparent],
    );
    final Gradient leadingHorizontal = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [fade, Colors.transparent],
    );
    final Gradient trailingHorizontal = LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      colors: [fade, Colors.transparent],
    );

    Widget scrollChild = widget.child;
    if (widget.hideScrollBar) {
      scrollChild = ScrollConfiguration(
        behavior: const _HideScrollbarScrollBehavior(),
        child: Theme(
          data: Theme.of(context).copyWith(
            scrollbarTheme: ScrollbarThemeData(
              thumbVisibility: WidgetStateProperty.all(false),
              trackVisibility: WidgetStateProperty.all(false),
            ),
          ),
          child: scrollChild,
        ),
      );
    }

    Widget edgeOverlay(Gradient gradient) {
      Widget box = DecoratedBox(decoration: BoxDecoration(gradient: gradient));
      if (widget.effect == RiseScrollShadowEffect.blur) {
        box = ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: box,
        );
      }
      return IgnorePointer(child: box);
    }

    return NotificationListener<ScrollMetricsNotification>(
      onNotification: _onMetrics,
      child: NotificationListener<ScrollNotification>(
        onNotification: _onScroll,
        child: Stack(
          fit: StackFit.passthrough,
          clipBehavior: Clip.hardEdge,
          children: [
            scrollChild,
            if (widget.axis == Axis.vertical) ...[
              if (effectiveLeading)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: extent,
                  child: edgeOverlay(leadingVertical),
                ),
              if (effectiveTrailing)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: extent,
                  child: edgeOverlay(trailingVertical),
                ),
            ] else ...[
              if (effectiveLeading)
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  width: extent,
                  child: edgeOverlay(leadingHorizontal),
                ),
              if (effectiveTrailing)
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  width: extent,
                  child: edgeOverlay(trailingHorizontal),
                ),
            ],
          ],
        ),
      ),
    );
  }
}

/// WebKit-style `scrollbar-hide` — [scroll-shadow.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/scroll-shadow.css) `.scroll-shadow--hide-scrollbar`.
class _HideScrollbarScrollBehavior extends ScrollBehavior {
  const _HideScrollbarScrollBehavior();

  @override
  Widget buildScrollbar(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
