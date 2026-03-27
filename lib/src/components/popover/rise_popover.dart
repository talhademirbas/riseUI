import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// Placement presets aligned with HeroUI Popover placement options.
enum RisePopoverPlacement {
  top,
  bottom,
  left,
  right,
}

/// Anchors [child] and shows [overlay] in an [OverlayPortal]
/// (HeroUI [Popover](https://heroui.com/docs/react/components/popover)).
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
  });

  final OverlayPortalController controller;

  final Widget overlay;

  final Widget child;

  final RisePopoverPlacement placement;

  final Offset offset;

  final bool showArrow;

  final double minWidth;

  final double maxWidth;

  Alignment get _followerAnchor => switch (placement) {
        RisePopoverPlacement.top => Alignment.bottomCenter,
        RisePopoverPlacement.bottom => Alignment.topCenter,
        RisePopoverPlacement.left => Alignment.centerRight,
        RisePopoverPlacement.right => Alignment.centerLeft,
      };

  Alignment get _targetAnchor => switch (placement) {
        RisePopoverPlacement.top => Alignment.topCenter,
        RisePopoverPlacement.bottom => Alignment.bottomCenter,
        RisePopoverPlacement.left => Alignment.centerLeft,
        RisePopoverPlacement.right => Alignment.centerRight,
      };

  Widget _buildArrow(BuildContext context) {
    final rise = context.riseTheme;
    final cs = Theme.of(context).colorScheme;
    final quarterTurn = switch (placement) {
      RisePopoverPlacement.top => 2,
      RisePopoverPlacement.bottom => 0,
      RisePopoverPlacement.left => 3,
      RisePopoverPlacement.right => 1,
    };
    return RotatedBox(
      quarterTurns: quarterTurn,
      child: CustomPaint(
        size: const Size(16, 8),
        painter: _RisePopoverArrowPainter(
          fill: cs.surface,
          border: rise.border.withValues(alpha: 0.4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final link = LayerLink();

    return CompositedTransformTarget(
      link: link,
      child: OverlayPortal(
        controller: controller,
        overlayChildBuilder: (ctx) {
          final panel = Material(
            elevation: 8,
            color: Theme.of(ctx).colorScheme.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
              side: BorderSide(color: rise.border.withValues(alpha: 0.4)),
            ),
            clipBehavior: Clip.antiAlias,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: minWidth, maxWidth: maxWidth),
              child: overlay,
            ),
          );

          final popup = showArrow
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: switch (placement) {
                    RisePopoverPlacement.top => [
                        panel,
                        _buildArrow(ctx),
                      ],
                    RisePopoverPlacement.bottom => [
                        _buildArrow(ctx),
                        panel,
                      ],
                    RisePopoverPlacement.left || RisePopoverPlacement.right => [
                        panel,
                      ],
                  },
                )
              : panel;

          return CompositedTransformFollower(
            link: link,
            showWhenUnlinked: false,
            followerAnchor: _followerAnchor,
            targetAnchor: _targetAnchor,
            offset: offset,
            child: popup,
          );
        },
        child: child,
      ),
    );
  }
}

class _RisePopoverArrowPainter extends CustomPainter {
  const _RisePopoverArrowPainter({required this.fill, required this.border});

  final Color fill;
  final Color border;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(size.width, 0)
      ..close();

    final fillPaint = Paint()..color = fill;
    canvas.drawPath(path, fillPaint);

    final borderPaint = Paint()
      ..color = border
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant _RisePopoverArrowPainter oldDelegate) {
    return oldDelegate.fill != fill || oldDelegate.border != border;
  }
}
