import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// Placement presets ([popover.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/popover/popover.tsx)
/// / React Aria — maps to `data-placement` rotations in
/// [popover.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/popover.css)).
enum RisePopoverPlacement {
  top,
  bottom,
  left,
  right,
}

List<BoxShadow> _overlayBoxShadows(bool isDark) {
  if (isDark) {
    return const [
      BoxShadow(color: Color(0x66000000), offset: Offset(0, 8), blurRadius: 28),
    ];
  }
  return const [
    BoxShadow(color: Color(0x18000000), offset: Offset(0, 4), blurRadius: 28),
    BoxShadow(color: Color(0x0A000000), offset: Offset(0, 2), blurRadius: 8),
  ];
}

/// Anchors [child] and shows [overlay] in an [OverlayPortal]
/// (HeroUI [Popover](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/popover/popover.tsx),
/// [popover.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/popover.css)).
///
/// Uses [OverlayPortal.overlayChildLayoutBuilder] so the anchor transform is correct during
/// layout (avoid [CompositedTransformFollower] here — it only applies in compositing and
/// breaks [OverlayPortal] layout, often producing a full-width strip mistaken for a sheet).
///
/// Shell: `rounded-3xl`, `bg-overlay`, overlay shadow, `text-sm`, default `p-4` dialog padding.
///
/// Popover position is clamped to [MediaQuery.padding] so left/right (and other) placements
/// stay on screen when possible.
///
/// Control visibility with [OverlayPortalController.show] and [OverlayPortalController.hide].
class RisePopover extends StatelessWidget {
  const RisePopover({
    super.key,
    required this.controller,
    required this.overlay,
    required this.child,
    this.placement = RisePopoverPlacement.bottom,
    this.offset = const Offset(0, 8),
    this.showArrow = false,
    this.minWidth = 160,
    this.maxWidth = 320,
    this.borderRadius = 24,
    this.dialogPadding = const EdgeInsets.all(16),
  });

  final OverlayPortalController controller;

  final Widget overlay;

  final Widget child;

  final RisePopoverPlacement placement;

  final Offset offset;

  final bool showArrow;

  final double minWidth;

  final double maxWidth;

  final double borderRadius;

  final EdgeInsetsGeometry dialogPadding;

  /// Hero arrow: `rotate(180deg)` bottom, `-90deg` left, `90deg` right; top unchanged.
  double get _arrowTurnRadians => switch (placement) {
        RisePopoverPlacement.top => 0,
        RisePopoverPlacement.bottom => math.pi,
        RisePopoverPlacement.left => -math.pi / 2,
        RisePopoverPlacement.right => math.pi / 2,
      };

  static const double _arrowExtent = 12;

  Widget _buildArrow(BuildContext context) {
    final rise = context.riseTheme;
    return Transform.rotate(
      angle: _arrowTurnRadians,
      child: CustomPaint(
        size: const Size(_arrowExtent, _arrowExtent),
        painter: _RisePopoverArrowPainter(fill: rise.overlay),
      ),
    );
  }

  Widget _buildPanel(BuildContext context, Widget body) {
    final rise = context.riseTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final radius = BorderRadius.circular(borderRadius);
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: minWidth, maxWidth: maxWidth),
      child: Container(
        decoration: BoxDecoration(
          color: rise.overlay,
          borderRadius: radius,
          boxShadow: _overlayBoxShadows(isDark),
        ),
        child: ClipRRect(
          borderRadius: radius,
          child: DefaultTextStyle.merge(
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      height: 20 / 14,
                      color: rise.defaultForeground,
                    ) ??
                TextStyle(
                  fontSize: 14,
                  height: 20 / 14,
                  color: rise.defaultForeground,
                ),
            child: IconTheme.merge(
              data: IconThemeData(color: rise.defaultForeground),
              child: Padding(
                padding: dialogPadding,
                child: body,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPopup(BuildContext context, Widget panel) {
    if (!showArrow) return panel;
    final arrow = _buildArrow(context);
    return switch (placement) {
      RisePopoverPlacement.top => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [panel, arrow],
        ),
      RisePopoverPlacement.bottom => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [arrow, panel],
        ),
      RisePopoverPlacement.left => Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [panel, arrow],
        ),
      RisePopoverPlacement.right => Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [arrow, panel],
        ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return OverlayPortal.overlayChildLayoutBuilder(
      controller: controller,
      overlayLocation: OverlayChildLocation.rootOverlay,
      overlayChildBuilder: (overlayContext, info) {
        final mq = MediaQuery.of(overlayContext);
        final safePadding = mq.padding;
        final topLeft = MatrixUtils.transformPoint(info.childPaintTransform, Offset.zero);
        final bottomRight = MatrixUtils.transformPoint(
          info.childPaintTransform,
          Offset(info.childSize.width, info.childSize.height),
        );
        final anchorRect = Rect.fromPoints(topLeft, bottomRight);
        final panel = _buildPanel(overlayContext, overlay);
        final popup = _buildPopup(overlayContext, panel);

        return SizedBox(
          width: info.overlaySize.width,
          height: info.overlaySize.height,
          child: CustomSingleChildLayout(
            delegate: _RisePopoverLayoutDelegate(
              anchorRect: anchorRect,
              placement: placement,
              offset: offset,
              showArrow: showArrow,
              safePadding: safePadding,
              overlaySize: info.overlaySize,
            ),
            child: popup,
          ),
        );
      },
      child: child,
    );
  }
}

class _RisePopoverLayoutDelegate extends SingleChildLayoutDelegate {
  _RisePopoverLayoutDelegate({
    required this.anchorRect,
    required this.placement,
    required this.offset,
    required this.showArrow,
    required this.safePadding,
    required this.overlaySize,
  });

  final Rect anchorRect;
  final RisePopoverPlacement placement;
  final Offset offset;
  final bool showArrow;
  final EdgeInsets safePadding;
  final Size overlaySize;

  double get _arrowGap => showArrow ? RisePopover._arrowExtent : 0;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints(
      maxWidth: math.max(0, constraints.maxWidth - safePadding.horizontal),
      maxHeight: math.max(0, constraints.maxHeight - safePadding.vertical),
    );
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    double x;
    double y;
    switch (placement) {
      case RisePopoverPlacement.bottom:
        x = anchorRect.center.dx - childSize.width / 2 + offset.dx;
        y = anchorRect.bottom + offset.dy + _arrowGap;
        break;
      case RisePopoverPlacement.top:
        x = anchorRect.center.dx - childSize.width / 2 + offset.dx;
        y = anchorRect.top - childSize.height - offset.dy - _arrowGap;
        break;
      case RisePopoverPlacement.right:
        x = anchorRect.right + offset.dx + _arrowGap;
        y = anchorRect.center.dy - childSize.height / 2 + offset.dy;
        break;
      case RisePopoverPlacement.left:
        x = anchorRect.left - childSize.width - offset.dx - _arrowGap;
        y = anchorRect.center.dy - childSize.height / 2 + offset.dy;
        break;
    }

    final leftBound = safePadding.left;
    final topBound = safePadding.top;
    final rightBound = overlaySize.width - safePadding.right - childSize.width;
    final bottomBound = overlaySize.height - safePadding.bottom - childSize.height;

    return Offset(
      x.clamp(leftBound, math.max(leftBound, rightBound)),
      y.clamp(topBound, math.max(topBound, bottomBound)),
    );
  }

  @override
  bool shouldRelayout(covariant _RisePopoverLayoutDelegate oldDelegate) {
    return anchorRect != oldDelegate.anchorRect ||
        placement != oldDelegate.placement ||
        offset != oldDelegate.offset ||
        showArrow != oldDelegate.showArrow ||
        safePadding != oldDelegate.safePadding ||
        overlaySize != oldDelegate.overlaySize;
  }
}

class _RisePopoverArrowPainter extends CustomPainter {
  const _RisePopoverArrowPainter({required this.fill});

  final Color fill;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..quadraticBezierTo(6, 9, 12, 0)
      ..close();
    canvas.drawPath(path, Paint()..color = fill);
  }

  @override
  bool shouldRepaint(covariant _RisePopoverArrowPainter oldDelegate) {
    return oldDelegate.fill != fill;
  }
}
