import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// Loading animation presets (HeroUI [Skeleton](https://heroui.com/docs/react/components/skeleton) /
/// [skeleton.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/skeleton.css)).
enum RiseSkeletonAnimation {
  /// Moving highlight gradient (default in HeroUI).
  shimmer,

  /// Opacity pulse (`animate-pulse` feel).
  pulse,

  /// Static block (`skeleton--none`).
  none,
}

class _RiseSkeletonShimmerScope extends InheritedWidget {
  const _RiseSkeletonShimmerScope({
    required this.controller,
    required super.child,
  });

  final AnimationController controller;

  /// Establishes dependency — use from [RiseSkeleton] build so descendants rebuild with the host.
  static AnimationController? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_RiseSkeletonShimmerScope>()?.controller;
  }

  /// No dependency — use from [didChangeDependencies] when deciding whether to create a local controller.
  static AnimationController? maybeReadOf(BuildContext context) {
    return context.getInheritedWidgetOfExactType<_RiseSkeletonShimmerScope>()?.controller;
  }

  @override
  bool updateShouldNotify(covariant _RiseSkeletonShimmerScope oldWidget) {
    return controller != oldWidget.controller;
  }
}

/// Runs a single shared shimmer phase for descendant [RiseSkeleton]s using
/// [RiseSkeletonAnimation.shimmer] (HeroUI “single shimmer” / parent `skeleton--shimmer`).
///
/// Place [RiseSkeleton] children with [RiseSkeletonAnimation.shimmer]; they will use this
/// controller instead of starting independent loops.
class RiseSkeletonSyncShimmer extends StatefulWidget {
  const RiseSkeletonSyncShimmer({super.key, required this.child});

  final Widget child;

  @override
  State<RiseSkeletonSyncShimmer> createState() => _RiseSkeletonSyncShimmerState();
}

class _RiseSkeletonSyncShimmerState extends State<RiseSkeletonSyncShimmer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _RiseSkeletonShimmerScope(
      controller: _controller,
      child: widget.child,
    );
  }
}

/// Placeholder block for loading states ([skeleton.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/skeleton/skeleton.tsx)).
class RiseSkeleton extends StatefulWidget {
  const RiseSkeleton({
    super.key,
    this.width,
    this.height = 14,
    this.borderRadius = 4,
    this.baseColor,
    this.highlightColor,
    this.animationType = RiseSkeletonAnimation.shimmer,
  });

  final double? width;

  final double height;

  /// Corner radius (`rounded-sm` ≈ 4 in HeroUI skeleton base).
  final double borderRadius;

  final Color? baseColor;

  final Color? highlightColor;

  final RiseSkeletonAnimation animationType;

  @override
  State<RiseSkeleton> createState() => _RiseSkeletonState();
}

class _RiseSkeletonState extends State<RiseSkeleton> with SingleTickerProviderStateMixin {
  AnimationController? _pulse;

  AnimationController? _localShimmer;
  bool _ownsLocalShimmer = false;

  Color _base(BuildContext context) {
    final rise = context.riseTheme;
    return widget.baseColor ?? rise.muted.withValues(alpha: 0.7);
  }

  Color _highlight(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return widget.highlightColor ?? cs.surface;
  }

  @override
  void initState() {
    super.initState();
    if (widget.animationType == RiseSkeletonAnimation.pulse) {
      _pulse = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1400),
      )..repeat(reverse: true);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.animationType != RiseSkeletonAnimation.shimmer) return;
    if (_RiseSkeletonShimmerScope.maybeReadOf(context) != null) return;
    if (_localShimmer != null) return;
    _localShimmer = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    _ownsLocalShimmer = true;
  }

  @override
  void dispose() {
    _pulse?.dispose();
    if (_ownsLocalShimmer) {
      _localShimmer?.dispose();
    }
    super.dispose();
  }

  Widget _fill(BuildContext context, {required Color color}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      child: ColoredBox(
        color: color,
        child: SizedBox(
          width: widget.width,
          height: widget.height,
        ),
      ),
    );
  }

  Widget _shimmer(BuildContext context, AnimationController controller) {
    final base = _base(context);
    final hi = _highlight(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          final t = controller.value;
          final start = -1.0 + 2.0 * t;
          return ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (bounds) {
              return LinearGradient(
                begin: Alignment(start, 0.5),
                end: Alignment(start + 1.2, 0.5),
                colors: [
                  base,
                  Color.lerp(base, hi, 0.5)!,
                  base,
                ],
                stops: const [0.32, 0.5, 0.68],
              ).createShader(bounds);
            },
            child: ColoredBox(
              color: base,
              child: SizedBox(
                width: widget.width,
                height: widget.height,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _shimmerBody(BuildContext context) {
    final shared = _RiseSkeletonShimmerScope.maybeOf(context);
    final ctrl = shared ?? _localShimmer;
    if (ctrl == null) {
      return _fill(context, color: _base(context));
    }
    return _shimmer(context, ctrl);
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: switch (widget.animationType) {
        RiseSkeletonAnimation.none => _fill(context, color: _base(context)),
        RiseSkeletonAnimation.pulse => AnimatedBuilder(
            animation: _pulse!,
            builder: (context, _) {
              final o = 0.42 + 0.58 * Curves.easeInOut.transform(_pulse!.value);
              return _fill(context, color: _base(context).withValues(alpha: o));
            },
          ),
        RiseSkeletonAnimation.shimmer => _shimmerBody(context),
      },
    );
  }
}

/// Vertical stack of [RiseSkeleton] lines with consistent spacing.
class RiseSkeletonGroup extends StatelessWidget {
  const RiseSkeletonGroup({
    super.key,
    required this.children,
    this.spacing = 10,
  });

  final List<Widget> children;

  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < children.length; i++) ...[
          if (i > 0) SizedBox(height: spacing),
          children[i],
        ],
      ],
    );
  }
}
