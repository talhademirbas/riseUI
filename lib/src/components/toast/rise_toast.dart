import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';
import '../button/rise_button.dart';
import '../close_button/rise_close_button.dart';
import '../spinner/rise_spinner.dart';

/// HeroUI [toast constants](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/toast/constants.ts).
const Duration kRiseToastDefaultTimeout = Duration(milliseconds: 4000);
const double kRiseToastDefaultGap = 12;
const int kRiseToastDefaultMaxVisible = 3;
const double kRiseToastDefaultScaleFactor = 0.05;
const double kRiseToastDefaultWidth = 460;

/// HeroUI view-transition toasts: `toast-slide-*-in` / `out` use **350ms** in [toast.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/toast.css).
const Duration kRiseToastEnterExitDuration = Duration(milliseconds: 350);

/// HeroUI toast region placement (`bottom`, `top`, `*-start` / `*-end`).
enum RiseToastPlacement {
  top,
  topStart,
  topEnd,
  bottom,
  bottomStart,
  bottomEnd,
}

enum RiseToastVariant {
  default_,
  accent,
  success,
  warning,
  danger,
}

/// HeroUI `actionProps` — tertiary/sm in stories; [buttonVariant] for semantic fills.
@immutable
class RiseToastAction {
  const RiseToastAction({
    required this.label,
    required this.onPressed,
    this.buttonVariant = RiseButtonVariant.tertiary,
  });

  final String label;
  final VoidCallback onPressed;
  final RiseButtonVariant buttonVariant;
}

/// Snapshot of a visible toast (HeroUI `ToastContentValue`).
@immutable
class RiseToastEntry {
  const RiseToastEntry({
    required this.id,
    required this.title,
    required this.variant,
    required this.placement,
    required this.duration,
    this.description,
    this.indicator,
    this.showDefaultIndicator = true,
    this.isLoading = false,
    this.action,
  });

  final String id;
  final String title;
  final String? description;
  final RiseToastVariant variant;
  final RiseToastPlacement placement;
  final Duration duration;
  final Widget? indicator;
  final bool showDefaultIndicator;
  final bool isLoading;
  final RiseToastAction? action;
}

/// Holds queued toasts. Typically driven via [RiseToast.show].
final class RiseToastController extends ChangeNotifier {
  RiseToastController({
    this.maxVisible = kRiseToastDefaultMaxVisible,
    this.gap = kRiseToastDefaultGap,
    this.scaleFactor = kRiseToastDefaultScaleFactor,
    this.toastWidth = kRiseToastDefaultWidth,
  });

  final int maxVisible;
  final double gap;
  final double scaleFactor;
  final double toastWidth;

  final List<RiseToastEntry> _entries = [];
  final Map<String, Timer> _timers = {};
  final Map<String, void Function()> _exitAnimations = {};
  int _seq = 0;

  List<RiseToastEntry> get entries => List.unmodifiable(_entries);

  /// Registers the callback invoked when [dismiss] runs with [animated] true.
  /// The callback should play an exit animation, then call [finishDismiss].
  void registerExitAnimation(String id, void Function() runExitAnimation) {
    _exitAnimations[id] = runExitAnimation;
  }

  void unregisterExitAnimation(String id) {
    _exitAnimations.remove(id);
  }

  /// Removes the toast after the exit animation completes (pair with [registerExitAnimation]).
  void finishDismiss(String id) {
    unregisterExitAnimation(id);
    _hardRemove(id);
  }

  String show({
    required String title,
    String? description,
    RiseToastVariant variant = RiseToastVariant.default_,
    RiseToastPlacement placement = RiseToastPlacement.bottom,
    Duration? duration,
    Widget? indicator,
    bool showDefaultIndicator = true,
    bool isLoading = false,
    RiseToastAction? action,
  }) {
    final id = '${_seq++}';
    final d = duration ?? kRiseToastDefaultTimeout;
    while (_entries.where((e) => e.placement == placement).length >= maxVisible) {
      final first = _entries.firstWhere((e) => e.placement == placement);
      dismiss(first.id);
    }
    final entry = RiseToastEntry(
      id: id,
      title: title,
      description: description,
      variant: variant,
      placement: placement,
      duration: d,
      indicator: indicator,
      showDefaultIndicator: showDefaultIndicator,
      isLoading: isLoading,
      action: action,
    );
    _entries.add(entry);
    notifyListeners();
    if (d > Duration.zero) {
      _timers[id] = Timer(d, () => dismiss(id));
    }
    return id;
  }

  /// Removes a toast. When [animated] is true, runs the registered exit animation if any.
  void dismiss(String id, {bool animated = true}) {
    final i = _entries.indexWhere((e) => e.id == id);
    if (i < 0) return;
    if (animated) {
      final runExit = _exitAnimations[id];
      if (runExit != null) {
        runExit();
        return;
      }
    }
    _hardRemove(id);
  }

  void _hardRemove(String id) {
    final i = _entries.indexWhere((e) => e.id == id);
    if (i < 0) return;
    _exitAnimations.remove(id);
    _timers.remove(id)?.cancel();
    _entries.removeAt(i);
    notifyListeners();
  }

  void clear() {
    for (final t in _timers.values) {
      t.cancel();
    }
    _timers.clear();
    _exitAnimations.clear();
    _entries.clear();
    notifyListeners();
  }
}

final RiseToastController _riseToastController = RiseToastController();

/// Global toast controller used by [RiseToast.wrap] / [RiseToast.show].
RiseToastController get riseToastController => _riseToastController;

/// Surface toasts aligned with HeroUI v3
/// ([toast.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/toast/toast.tsx),
/// [toast.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/toast.css)).
abstract final class RiseToast {
  RiseToast._();

  /// Wrap the [MaterialApp] child so toasts render above navigation.
  ///
  /// ```dart
  /// MaterialApp(
  ///   builder: (context, child) => RiseToast.wrap(child),
  ///   ...
  /// )
  /// ```
  static Widget wrap(Widget? child) {
    return _RiseToastHost(child: child ?? const SizedBox.shrink());
  }

  /// Shows a toast using [riseToastController].
  static String show(
    BuildContext context, {
    required String title,
    String? description,
    RiseToastVariant variant = RiseToastVariant.default_,
    RiseToastPlacement placement = RiseToastPlacement.bottom,
    Duration? duration,
    Widget? indicator,
    bool showDefaultIndicator = true,
    bool isLoading = false,
    RiseToastAction? action,
  }) {
    return riseToastController.show(
      title: title,
      description: description,
      variant: variant,
      placement: placement,
      duration: duration,
      indicator: indicator,
      showDefaultIndicator: showDefaultIndicator,
      isLoading: isLoading,
      action: action,
    );
  }

  static String info(
    BuildContext context,
    String title, {
    String? description,
    RiseToastPlacement placement = RiseToastPlacement.bottom,
    Duration? duration,
    Widget? indicator,
    bool showDefaultIndicator = true,
    RiseToastAction? action,
  }) {
    return show(
      context,
      title: title,
      description: description,
      variant: RiseToastVariant.accent,
      placement: placement,
      duration: duration,
      indicator: indicator,
      showDefaultIndicator: showDefaultIndicator,
      action: action,
    );
  }

  static String success(
    BuildContext context,
    String title, {
    String? description,
    RiseToastPlacement placement = RiseToastPlacement.bottom,
    Duration? duration,
    Widget? indicator,
    bool showDefaultIndicator = true,
    RiseToastAction? action,
  }) {
    return show(
      context,
      title: title,
      description: description,
      variant: RiseToastVariant.success,
      placement: placement,
      duration: duration,
      indicator: indicator,
      showDefaultIndicator: showDefaultIndicator,
      action: action,
    );
  }

  static String warning(
    BuildContext context,
    String title, {
    String? description,
    RiseToastPlacement placement = RiseToastPlacement.bottom,
    Duration? duration,
    Widget? indicator,
    bool showDefaultIndicator = true,
    RiseToastAction? action,
  }) {
    return show(
      context,
      title: title,
      description: description,
      variant: RiseToastVariant.warning,
      placement: placement,
      duration: duration,
      indicator: indicator,
      showDefaultIndicator: showDefaultIndicator,
      action: action,
    );
  }

  static String danger(
    BuildContext context,
    String title, {
    String? description,
    RiseToastPlacement placement = RiseToastPlacement.bottom,
    Duration? duration,
    Widget? indicator,
    bool showDefaultIndicator = true,
    RiseToastAction? action,
  }) {
    return show(
      context,
      title: title,
      description: description,
      variant: RiseToastVariant.danger,
      placement: placement,
      duration: duration,
      indicator: indicator,
      showDefaultIndicator: showDefaultIndicator,
      action: action,
    );
  }

  static void dismiss(String id, {bool animated = true}) =>
      riseToastController.dismiss(id, animated: animated);

  static void clear() => riseToastController.clear();
}

class _RiseToastHost extends StatelessWidget {
  const _RiseToastHost({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _riseToastController,
      builder: (context, _) {
        return Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            child,
            if (_riseToastController.entries.isNotEmpty)
              _RiseGlobalToastOverlay(controller: _riseToastController),
          ],
        );
      },
    );
  }
}

class _RiseGlobalToastOverlay extends StatelessWidget {
  const _RiseGlobalToastOverlay({required this.controller});

  final RiseToastController controller;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.withNoTextScaling(
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          for (final p in RiseToastPlacement.values)
            _RisePlacementColumn(placement: p, controller: controller),
        ],
      ),
    );
  }
}

class _RisePlacementColumn extends StatefulWidget {
  const _RisePlacementColumn({
    required this.placement,
    required this.controller,
  });

  final RiseToastPlacement placement;
  final RiseToastController controller;

  static Alignment _alignmentFor(RiseToastPlacement p) {
    return switch (p) {
      RiseToastPlacement.top => Alignment.topCenter,
      RiseToastPlacement.topStart => Alignment.topLeft,
      RiseToastPlacement.topEnd => Alignment.topRight,
      RiseToastPlacement.bottom => Alignment.bottomCenter,
      RiseToastPlacement.bottomStart => Alignment.bottomLeft,
      RiseToastPlacement.bottomEnd => Alignment.bottomRight,
    };
  }

  static EdgeInsets _paddingFor(RiseToastPlacement p, MediaQueryData mq) {
    const e = 16.0;
    final safe = mq.padding;
    final view = mq.viewInsets;
    return switch (p) {
      RiseToastPlacement.top ||
      RiseToastPlacement.topStart ||
      RiseToastPlacement.topEnd =>
        EdgeInsets.fromLTRB(e, safe.top + e, e, 0),
      RiseToastPlacement.bottom ||
      RiseToastPlacement.bottomStart ||
      RiseToastPlacement.bottomEnd =>
        EdgeInsets.fromLTRB(e, 0, e, safe.bottom + e + view.bottom),
    };
  }

  static bool _isBottom(RiseToastPlacement p) {
    return p == RiseToastPlacement.bottom ||
        p == RiseToastPlacement.bottomStart ||
        p == RiseToastPlacement.bottomEnd;
  }

  @override
  State<_RisePlacementColumn> createState() => _RisePlacementColumnState();
}

class _RisePlacementColumnState extends State<_RisePlacementColumn> {
  final GlobalKey _frontMeasureKey = GlobalKey();
  double? _frontHeight;

  RiseToastController get _controller => widget.controller;

  @override
  Widget build(BuildContext context) {
    final items = _controller.entries.where((e) => e.placement == widget.placement).toList();
    if (items.isEmpty) return const SizedBox.shrink();

    final mq = MediaQuery.of(context);
    final isBottom = _RisePlacementColumn._isBottom(widget.placement);
    final ordered = isBottom ? items : items.reversed.toList();
    final maxW = math.min(_controller.toastWidth, mq.size.width - 32);
    final gap = _controller.gap;
    final scaleK = _controller.scaleFactor;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ctx = _frontMeasureKey.currentContext;
      final box = ctx?.findRenderObject() as RenderBox?;
      final h = box?.size.height;
      if (!mounted || h == null || !h.isFinite) return;
      if (_frontHeight == null || (h - _frontHeight!).abs() > 0.5) {
        setState(() => _frontHeight = h);
      }
    });

    final frontH = _frontHeight;
    final n = ordered.length;
    final idxFront = n - 1;
    final stackViewportH = (frontH ?? 132) + (n > 1 ? (n - 1) * gap * 2 : 0);

    return Align(
      alignment: _RisePlacementColumn._alignmentFor(widget.placement),
      child: Padding(
        padding: _RisePlacementColumn._paddingFor(widget.placement, mq),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxW),
          child: SizedBox(
            width: maxW,
            height: stackViewportH,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: isBottom ? Alignment.bottomCenter : Alignment.topCenter,
              children: [
                for (var k = 0; k < n; k++)
                  Align(
                    alignment: isBottom ? Alignment.bottomCenter : Alignment.topCenter,
                    child: _RiseToastAnimatedShell(
                      key: ValueKey<String>(ordered[k].id),
                      entryId: ordered[k].id,
                      controller: _controller,
                      isPlacementBottom: isBottom,
                      idxFromFront: idxFront - k,
                      translateY: (isBottom ? -1.0 : 1.0) * gap * (idxFront - k),
                      scale: 1.0 - scaleK * (idxFront - k),
                      clipToFrontHeight:
                          (idxFront - k) > 0 && frontH != null && frontH > 0 ? frontH : null,
                      measureFrontKey: k == idxFront ? _frontMeasureKey : null,
                      maxWidth: maxW,
                      card: _RiseToastCard(
                        entry: ordered[k],
                        onDismiss: () => _controller.dismiss(ordered[k].id),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Enter / exit: HeroUI [toast.css] `toast-slide-*` (**350ms**) + opacity.
class _RiseToastAnimatedShell extends StatefulWidget {
  const _RiseToastAnimatedShell({
    super.key,
    required this.entryId,
    required this.controller,
    required this.isPlacementBottom,
    required this.idxFromFront,
    required this.translateY,
    required this.scale,
    required this.clipToFrontHeight,
    required this.measureFrontKey,
    required this.maxWidth,
    required this.card,
  });

  final String entryId;
  final RiseToastController controller;
  final bool isPlacementBottom;
  final int idxFromFront;
  final double translateY;
  final double scale;
  final double? clipToFrontHeight;
  final GlobalKey? measureFrontKey;
  final double maxWidth;
  final Widget card;

  @override
  State<_RiseToastAnimatedShell> createState() => _RiseToastAnimatedShellState();
}

class _RiseToastAnimatedShellState extends State<_RiseToastAnimatedShell>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c;
  late final CurvedAnimation _curve;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(
      vsync: this,
      duration: kRiseToastEnterExitDuration,
    );
    _curve = CurvedAnimation(
      parent: _c,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    );
    widget.controller.registerExitAnimation(widget.entryId, _playExit);
    _c.forward();
  }

  @override
  void dispose() {
    widget.controller.unregisterExitAnimation(widget.entryId);
    _curve.dispose();
    _c.dispose();
    super.dispose();
  }

  void _playExit() {
    if (!mounted) return;
    if (_c.status == AnimationStatus.dismissed || _c.value == 0) {
      widget.controller.finishDismiss(widget.entryId);
      return;
    }
    _c.reverse().whenComplete(() {
      if (mounted) {
        widget.controller.finishDismiss(widget.entryId);
      }
    });
  }

  Widget _stackLayers(Widget toast) {
    final clipH = widget.clipToFrontHeight;
    final bottom = widget.isPlacementBottom;
    final align = bottom ? Alignment.bottomCenter : Alignment.topCenter;

    Widget core = toast;
    if (clipH != null) {
      core = SizedBox(
        height: clipH,
        child: ClipRect(
          child: Align(
            alignment: align,
            heightFactor: 1,
            child: OverflowBox(
              alignment: align,
              maxHeight: double.infinity,
              child: toast,
            ),
          ),
        ),
      );
    }

    core = Transform.translate(
      offset: Offset(0, widget.translateY),
      child: Transform.scale(
        scale: widget.scale,
        alignment: align,
        child: core,
      ),
    );

    return IgnorePointer(
      ignoring: widget.idxFromFront > 0,
      child: core,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _curve,
      builder: (context, child) {
        final t = _curve.value;
        final y = widget.isPlacementBottom ? (1.0 - t) : -(1.0 - t);
        return FractionalTranslation(
          translation: Offset(0, y),
          transformHitTests: true,
          child: Opacity(
            opacity: t.clamp(0.0, 1.0),
            child: child,
          ),
        );
      },
      child: KeyedSubtree(
        key: widget.measureFrontKey ?? ValueKey<String>('toast-${widget.entryId}'),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: widget.maxWidth),
          child: _stackLayers(widget.card),
        ),
      ),
    );
  }
}

class _RiseToastCard extends StatelessWidget {
  const _RiseToastCard({
    required this.entry,
    required this.onDismiss,
  });

  final RiseToastEntry entry;
  final VoidCallback onDismiss;

  static IconData _defaultIcon(RiseToastVariant v) {
    return switch (v) {
      RiseToastVariant.default_ => Icons.person_outline,
      RiseToastVariant.accent => Icons.info_outline,
      RiseToastVariant.success => Icons.check_circle_outline,
      RiseToastVariant.warning => Icons.warning_amber_rounded,
      RiseToastVariant.danger => Icons.error_outline,
    };
  }

  static RiseSpinnerColor _spinnerColor(RiseToastVariant v) {
    return switch (v) {
      RiseToastVariant.default_ => RiseSpinnerColor.accent,
      RiseToastVariant.accent => RiseSpinnerColor.accent,
      RiseToastVariant.success => RiseSpinnerColor.success,
      RiseToastVariant.warning => RiseSpinnerColor.warning,
      RiseToastVariant.danger => RiseSpinnerColor.danger,
    };
  }

  Color _titleColor(RiseThemeData rise) {
    return switch (entry.variant) {
      RiseToastVariant.default_ => rise.defaultForeground,
      RiseToastVariant.accent => rise.accentSoftForeground,
      RiseToastVariant.success => rise.success,
      RiseToastVariant.warning => rise.warning,
      RiseToastVariant.danger => rise.dangerSoftForeground,
    };
  }

  Color _indicatorColor(RiseThemeData rise) {
    return _titleColor(rise);
  }

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final titleColor = _titleColor(rise);
    final muted = rise.mutedForeground(0.9);

    final showIndicatorSlot =
        entry.showDefaultIndicator || entry.indicator != null || entry.isLoading;
    final Widget? indicatorChild = entry.isLoading
        ? RiseSpinner(
            size: RiseSpinnerSize.sm,
            color: _spinnerColor(entry.variant),
          )
        : entry.indicator ??
            (entry.showDefaultIndicator
                ? Icon(
                    _defaultIcon(entry.variant),
                    size: 16,
                    color: _indicatorColor(rise),
                  )
                : null);

    return Material(
      color: Colors.transparent,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: rise.surface,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: rise.defaultForeground.withValues(alpha: 0.12),
              blurRadius: 32,
              offset: const Offset(0, 12),
              spreadRadius: -8,
            ),
            BoxShadow(
              color: rise.defaultForeground.withValues(alpha: 0.06),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 40, 12),
              child: LayoutBuilder(
                builder: (context, c) {
                  final wide = c.maxWidth >= 440;
                  final textBlock = Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        entry.title,
                        style: TextStyle(
                          fontSize: 14,
                          height: 20 / 14,
                          fontWeight: FontWeight.w500,
                          color: titleColor,
                        ),
                      ),
                      if (entry.description != null && entry.description!.isNotEmpty) ...[
                        const SizedBox(height: 2),
                        Text(
                          entry.description!,
                          style: TextStyle(
                            fontSize: 14,
                            height: 20 / 14,
                            color: muted,
                          ),
                        ),
                      ],
                      if (!wide && entry.action != null) ...[
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: RiseButton(
                            label: entry.action!.label,
                            onPressed: entry.action!.onPressed,
                            variant: entry.action!.buttonVariant,
                            size: RiseButtonSize.sm,
                          ),
                        ),
                      ],
                    ],
                  );

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (showIndicatorSlot && indicatorChild != null) ...[
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: SizedBox(
                            width: 16,
                            height: 16,
                            child: Center(child: indicatorChild),
                          ),
                        ),
                        const SizedBox(width: 6),
                      ],
                      Expanded(child: textBlock),
                      if (wide && entry.action != null) ...[
                        const SizedBox(width: 8),
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: RiseButton(
                            label: entry.action!.label,
                            onPressed: entry.action!.onPressed,
                            variant: entry.action!.buttonVariant,
                            size: RiseButtonSize.sm,
                          ),
                        ),
                      ],
                    ],
                  );
                },
              ),
            ),
            Positioned(
              top: 4,
              right: 4,
              child: RiseCloseButton(
                onPressed: onDismiss,
                iconProps: RiseCloseButtonIconProps(
                  size: 18,
                  color: rise.defaultForeground.withValues(alpha: 0.45),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
