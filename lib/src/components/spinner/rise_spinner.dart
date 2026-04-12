import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

import '../../theme/rise_theme.dart';

/// Size tokens ([spinner.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/spinner.css)
/// `spinner--sm` … `spinner--xl` → `size-4` … `size-10`).
enum RiseSpinnerSize { sm, md, lg, xl }

/// Color tokens ([spinner.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/spinner.css)).
enum RiseSpinnerColor {
  /// `spinner--current` — inherits from [IconTheme] / [DefaultTextStyle].
  current,

  /// `spinner--accent`
  accent,

  /// `spinner--success`
  success,

  /// `spinner--warning`
  warning,

  /// `spinner--danger`
  danger,
}

// HeroUI [SpinnerPrimitive](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/spinner/spinner.tsx)
// viewBox="0 0 24 24", gradients (def-1 / def-2) approximated with per-path LinearGradient + objectBoundingBox stops.
const _kSpinnerPath1 =
    'M8.749.021a1.5 1.5 0 0 1 .497 2.958A7.5 7.5 0 0 0 3 10.375a7.5 7.5 0 0 0 7.5 7.5v3c-5.799 0-10.5-4.7-10.5-10.5C0 5.23 3.726.865 8.749.021';
const _kSpinnerPath2 =
    'M15.392 2.673a1.5 1.5 0 0 1 2.119-.115A10.48 10.48 0 0 1 21 10.375c0 5.8-4.701 10.5-10.5 10.5v-3a7.5 7.5 0 0 0 5.007-13.084a1.5 1.5 0 0 1-.115-2.118';

/// `animate-spin-fast` cadence — between default `spin` (1s) and HeroUI fast preset (~0.75s).
const Duration kRiseSpinnerRotationDuration = Duration(milliseconds: 750);

/// Loading indicator using the same filled paths and gradient stops as HeroUI’s SVG spinner
/// ([spinner.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/spinner/spinner.tsx)).
///
/// Wrapper behavior: `.spinner` (`pointer-events-none`, centered origin, continuous rotation).
///
/// When [isLoading] is false, renders nothing (optional app convenience).
class RiseSpinner extends StatefulWidget {
  const RiseSpinner({
    super.key,
    this.size = RiseSpinnerSize.md,
    this.color = RiseSpinnerColor.current,
    this.isLoading = true,
    this.child,
  });

  final RiseSpinnerSize size;

  final RiseSpinnerColor color;

  final bool isLoading;

  /// When non-null, replaces the vector artwork (still rotated; no gradients applied).
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
    _controller = AnimationController(vsync: this, duration: kRiseSpinnerRotationDuration);
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
    if (TickerMode.valuesOf(context).enabled) {
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
    final c = _resolveColor(context);

    return Semantics(
      label: 'Loading',
      child: IgnorePointer(
        child: SizedBox(
          width: d,
          height: d,
          child: RotationTransition(
            turns: _controller,
            child: widget.child ?? CustomPaint(painter: _RiseHeroSpinnerPainter(color: c)),
          ),
        ),
      ),
    );
  }
}

/// Paints the two Hero spinner arcs with SVG-aligned linear gradients.
class _RiseHeroSpinnerPainter extends CustomPainter {
  _RiseHeroSpinnerPainter({required this.color});

  final Color color;

  static final Path _raw1 = parseSvgPathData(_kSpinnerPath1);
  static final Path _raw2 = parseSvgPathData(_kSpinnerPath2);

  static const double _ox = 1.5;
  static const double _oy = 1.625;

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.shortestSide / 24.0;
    canvas.save();
    canvas.translate(size.width / 2 - 12 * s, size.height / 2 - 12 * s);
    canvas.scale(s);

    final p1 = Path()..addPath(_raw1, const Offset(_ox, _oy));
    final b1 = p1.getBounds();
    final g1 = LinearGradient(
      begin: Alignment(0, -1 + 2 * 0.05271),
      end: Alignment(0, -1 + 2 * 0.91793),
      colors: [color, color.withValues(alpha: 0.55)],
    ).createShader(b1);
    canvas.drawPath(p1, Paint()..shader = g1);

    final p2 = Path()..addPath(_raw2, const Offset(_ox, _oy));
    final b2 = p2.getBounds();
    final g2 = LinearGradient(
      begin: Alignment(0, -1 + 2 * 0.1524),
      end: Alignment(0, -1 + 2 * 0.8715),
      colors: [color.withValues(alpha: 0), color.withValues(alpha: 0.55)],
    ).createShader(b2);
    canvas.drawPath(p2, Paint()..shader = g2);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _RiseHeroSpinnerPainter old) => old.color != color;
}
