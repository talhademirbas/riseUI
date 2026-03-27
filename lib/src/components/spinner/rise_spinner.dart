import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// Size tokens aligned with HeroUI [spinner.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/spinner.css)
/// (`size-4` … `size-10`).
enum RiseSpinnerSize {
  sm,
  md,
  lg,
  xl,
}

/// Color tokens aligned with HeroUI [Spinner](https://heroui.com/docs/react/components/spinner)
/// ([spinner.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/spinner/spinner.tsx)).
enum RiseSpinnerColor {
  /// Inherits color from [IconTheme] / [DefaultTextStyle] (`spinner--current`).
  current,

  /// `--accent`
  accent,

  success,
  warning,

  /// `--danger`
  danger,
}

/// A loading indicator with HeroUI-style dual-arc artwork and `animate-spin-fast` cadence.
///
/// When [isLoading] is false, renders nothing (optional app convenience).
class RiseSpinner extends StatefulWidget {
  const RiseSpinner({
    super.key,
    this.size = RiseSpinnerSize.md,
    this.color = RiseSpinnerColor.current,
    this.isLoading = true,
    this.strokeWidth = 2.5,
    this.child,
  });

  final RiseSpinnerSize size;

  final RiseSpinnerColor color;

  final bool isLoading;

  /// Stroke thickness at [RiseSpinnerSize.md] (24px); scales with [size].

  final double strokeWidth;

  /// When non-null, replaces the painted spinner (no rotation applied).
  final Widget? child;

  static double _dimension(RiseSpinnerSize s) {
    return switch (s) {
      RiseSpinnerSize.sm => 16,
      RiseSpinnerSize.md => 24,
      RiseSpinnerSize.lg => 32,
      RiseSpinnerSize.xl => 40,
    };
  }

  @override
  State<RiseSpinner> createState() => _RiseSpinnerState();
}

class _RiseSpinnerState extends State<RiseSpinner> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 720),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _syncTicker();
  }

  @override
  void didUpdateWidget(covariant RiseSpinner oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.isLoading) {
      _controller.stop();
      return;
    }
    _syncTicker();
  }

  void _syncTicker() {
    if (!mounted || !widget.isLoading) return;
    if (TickerMode.of(context)) {
      if (!_controller.isAnimating) {
        _controller.repeat();
      }
    } else {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _resolveColor(BuildContext context) {
    return switch (widget.color) {
      RiseSpinnerColor.current =>
        IconTheme.of(context).color ??
            DefaultTextStyle.of(context).style.color ??
            Theme.of(context).colorScheme.onSurface,
      RiseSpinnerColor.accent => context.riseTheme.accent,
      RiseSpinnerColor.success => context.riseTheme.success,
      RiseSpinnerColor.warning => context.riseTheme.warning,
      RiseSpinnerColor.danger => context.riseTheme.danger,
    };
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) return const SizedBox.shrink();

    final d = RiseSpinner._dimension(widget.size);
    final strokePx = (widget.strokeWidth * d) / 24.0;
    final c = _resolveColor(context);

    if (widget.child != null) {
      return Semantics(
        label: 'Loading',
        child: IgnorePointer(
          child: SizedBox(width: d, height: d, child: widget.child),
        ),
      );
    }

    return Semantics(
      label: 'Loading',
      child: IgnorePointer(
        child: SizedBox(
          width: d,
          height: d,
          child: RotationTransition(
            turns: _controller,
            child: CustomPaint(
              painter: _RiseSpinnerPainter(color: c, strokePx: strokePx),
            ),
          ),
        ),
      ),
    );
  }
}

/// Dual-arc ring inspired by HeroUI’s SVG fills (thick strokes, two segments).
class _RiseSpinnerPainter extends CustomPainter {
  _RiseSpinnerPainter({required this.color, required this.strokePx});

  final Color color;
  final double strokePx;

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final c = Offset(cx, cy);
    final r = (size.shortestSide / 2) - strokePx / 2;
    if (r <= 0) return;
    final rect = Rect.fromCircle(center: c, radius: r);

    final main = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokePx
      ..strokeCap = StrokeCap.round;

    final trail = Paint()
      ..color = color.withValues(alpha: 0.52)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokePx
      ..strokeCap = StrokeCap.round;

    // Angles tuned to approximate Hero’s two filled segments at viewBox 24×24.
    canvas.drawArc(rect, -2.42, 2.18, false, main);
    canvas.drawArc(rect, 0.92, 1.22, false, trail);
  }

  @override
  bool shouldRepaint(covariant _RiseSpinnerPainter old) =>
      old.color != color || old.strokePx != strokePx;

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => false;
}
