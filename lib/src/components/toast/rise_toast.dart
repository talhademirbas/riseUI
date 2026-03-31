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

/// Duration for stack-position reflow (translate/scale when index changes).
const Duration _kStackReflowDuration = Duration(milliseconds: 220);

/// Reserved height for the stack SizedBox so the container never collapses between
/// add/remove transitions. Generous enough for a toast with a description.
const double _kStackReservedHeight = 200.0;

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

class _PendingToast {
  const _PendingToast({required this.entry, required this.duration});

  final RiseToastEntry entry;
  final Duration duration;
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
  final Map<RiseToastPlacement, _PendingToast> _pendingByPlacement = {};
  final Map<RiseToastPlacement, bool> _dismissInFlightByPlacement = {
    for (final p in RiseToastPlacement.values) p: false,
  };
  final Map<RiseToastPlacement, int> _placementCounts = {
    for (final p in RiseToastPlacement.values) p: 0,
  };
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
    // Guard: if already removed (e.g. called twice), do nothing.
    final placement = _placementForId(id);
    if (placement == null) return;
    unregisterExitAnimation(id);
    _hardRemove(id);
    _dismissInFlightByPlacement[placement] = false;
    _advancePlacementFlow(placement);
  }

  int _countForPlacement(RiseToastPlacement placement) => _placementCounts[placement] ?? 0;

  String? _oldestIdForPlacement(RiseToastPlacement placement) {
    final i = _entries.indexWhere((entry) => entry.placement == placement);
    return i >= 0 ? _entries[i].id : null;
  }

  static void _cancelTimer(Timer timer) => timer.cancel();

  RiseToastPlacement? _placementForId(String id) {
    final i = _entries.indexWhere((e) => e.id == id);
    return i >= 0 ? _entries[i].placement : null;
  }

  void _insertEntry(RiseToastEntry entry, Duration duration) {
    _entries.add(entry);
    _placementCounts[entry.placement] = _countForPlacement(entry.placement) + 1;
    if (duration > Duration.zero) {
      _timers[entry.id] = Timer(duration, () => dismiss(entry.id));
    }
    notifyListeners();
  }

  void _advancePlacementFlow(RiseToastPlacement placement) {
    if (_dismissInFlightByPlacement[placement] == true) return;
    if (_countForPlacement(placement) < maxVisible) {
      final pending = _pendingByPlacement.remove(placement);
      if (pending != null) {
        _insertEntry(pending.entry, pending.duration);
      }
      return;
    }
    final oldestId = _oldestIdForPlacement(placement);
    if (oldestId == null) return;
    _dismissInFlightByPlacement[placement] = true;
    dismiss(oldestId, animated: true);
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
    if (_countForPlacement(placement) >= maxVisible) {
      // Keep only the latest request as pending for this placement.
      _pendingByPlacement[placement] = _PendingToast(entry: entry, duration: d);
      _advancePlacementFlow(placement);
    } else {
      _insertEntry(entry, d);
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
    // No exit animation registered — go through finishDismiss so the
    // in-flight flag is always reset and the placement flow always advances.
    finishDismiss(id);
  }

  void _hardRemove(String id, {bool notify = true}) {
    final i = _entries.indexWhere((e) => e.id == id);
    if (i < 0) return;
    final placement = _entries[i].placement;
    _exitAnimations.remove(id);
    _timers.remove(id)?.cancel();
    _entries.removeAt(i);
    final prevCount = _countForPlacement(placement);
    _placementCounts[placement] = prevCount > 0 ? prevCount - 1 : 0;
    if (notify) {
      notifyListeners();
    }
  }

  void clear() {
    _timers.values.forEach(_cancelTimer);
    _timers.clear();
    _exitAnimations.clear();
    _pendingByPlacement.clear();
    _dismissInFlightByPlacement.updateAll((_, _) => false);
    _entries.clear();
    _placementCounts.updateAll((_, _) => 0);
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
    // child is intentionally outside ListenableBuilder so the app tree
    // never rebuilds when toasts change.
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        child,
        ListenableBuilder(
          listenable: _riseToastController,
          child: const SizedBox.shrink(),
          builder: (context, _) {
            if (_riseToastController.entries.isEmpty) {
              return const SizedBox.shrink();
            }
            return _RiseGlobalToastOverlay(controller: _riseToastController);
          },
        ),
      ],
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

class _RisePlacementColumn extends StatelessWidget {
  const _RisePlacementColumn({
    required this.placement,
    required this.controller,
  });

  final RiseToastPlacement placement;
  final RiseToastController controller;

  static Alignment _alignmentFor(RiseToastPlacement p) => switch (p) {
        RiseToastPlacement.top => Alignment.topCenter,
        RiseToastPlacement.topStart => Alignment.topLeft,
        RiseToastPlacement.topEnd => Alignment.topRight,
        RiseToastPlacement.bottom => Alignment.bottomCenter,
        RiseToastPlacement.bottomStart => Alignment.bottomLeft,
        RiseToastPlacement.bottomEnd => Alignment.bottomRight,
      };

  static EdgeInsets _paddingFor(RiseToastPlacement p, MediaQueryData mq) {
    const e = 16.0;
    final safe = mq.padding;
    return switch (p) {
      RiseToastPlacement.top ||
      RiseToastPlacement.topStart ||
      RiseToastPlacement.topEnd =>
        EdgeInsets.fromLTRB(e, safe.top + e, e, 0),
      RiseToastPlacement.bottom ||
      RiseToastPlacement.bottomStart ||
      RiseToastPlacement.bottomEnd =>
        EdgeInsets.fromLTRB(e, 0, e, safe.bottom + e),
    };
  }

  static bool _isBottom(RiseToastPlacement p) =>
      p == RiseToastPlacement.bottom ||
      p == RiseToastPlacement.bottomStart ||
      p == RiseToastPlacement.bottomEnd;

  @override
  Widget build(BuildContext context) {
    final items = controller.entries.where((e) => e.placement == placement).toList();
    if (items.isEmpty) return const SizedBox.shrink();

    final mq = MediaQuery.of(context);
    final isBottom = _isBottom(placement);
    // Newest first: ordered[0] is front.
    final ordered = items.reversed.toList();
    final maxW = math.min(controller.toastWidth, mq.size.width - 32);
    final gap = controller.gap;
    final scaleK = controller.scaleFactor;
    final edgeAlign = isBottom ? Alignment.bottomCenter : Alignment.topCenter;

    return Align(
      alignment: _alignmentFor(placement),
      child: Padding(
        padding: _paddingFor(placement, mq),
        child: SizedBox(
          width: maxW,
          // Reserved height keeps the container stable regardless of
          // how many toasts are currently visible or animating.
          height: _kStackReservedHeight,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: edgeAlign,
            children: [
              // Paint oldest (highest k) first so newest renders on top.
              // The key lives on Align (the direct Stack child) so Flutter
              // matches by identity, not position, when the list shrinks/grows.
              for (var k = ordered.length - 1; k >= 0; k--)
                Align(
                  key: ValueKey<String>(ordered[k].id),
                  alignment: edgeAlign,
                  child: _RiseToastAnimatedShell(
                    entryId: ordered[k].id,
                    controller: controller,
                    isPlacementBottom: isBottom,
                    idxFromFront: k,
                    translateY: (isBottom ? -1.0 : 1.0) * gap * k,
                    scale: 1.0 - scaleK * k,
                    card: RepaintBoundary(
                      child: _RiseToastCard(
                        entry: ordered[k],
                        onDismiss: () => controller.dismiss(ordered[k].id),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Per-toast shell:
/// - Enter/exit: 350ms slide+fade ([toast.css] `toast-slide-*`).
/// - Stack reflow (index changes): 220ms translate+scale via [didUpdateWidget].
///   Owned by state so no TweenAnimationBuilder state loss on rebuilds.
/// - No clipping — avoids sudden visual change when front/back status changes.
class _RiseToastAnimatedShell extends StatefulWidget {
  const _RiseToastAnimatedShell({
    required this.entryId,
    required this.controller,
    required this.isPlacementBottom,
    required this.idxFromFront,
    required this.translateY,
    required this.scale,
    required this.card,
  });

  final String entryId;
  final RiseToastController controller;
  final bool isPlacementBottom;
  final int idxFromFront;
  final double translateY;
  final double scale;
  final Widget card;

  @override
  State<_RiseToastAnimatedShell> createState() => _RiseToastAnimatedShellState();
}

class _RiseToastAnimatedShellState extends State<_RiseToastAnimatedShell>
    with TickerProviderStateMixin {
  // Enter/exit slide+fade.
  late final AnimationController _enterExitCtrl;
  late final CurvedAnimation _enterExitCurve;

  // Stack reflow: animates translateY and scale when idxFromFront changes.
  late final AnimationController _reflowCtrl;
  late Animation<double> _translateAnim;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();

    _enterExitCtrl = AnimationController(
      vsync: this,
      duration: kRiseToastEnterExitDuration,
    );
    _enterExitCurve = CurvedAnimation(
      parent: _enterExitCtrl,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    );

    _reflowCtrl = AnimationController(
      vsync: this,
      duration: _kStackReflowDuration,
    );
    // On first appearance there is no reflow — positions are already correct.
    _translateAnim = AlwaysStoppedAnimation<double>(widget.translateY);
    _scaleAnim = AlwaysStoppedAnimation<double>(widget.scale);

    widget.controller.registerExitAnimation(widget.entryId, _playExit);
    _enterExitCtrl.forward();
  }

  @override
  void didUpdateWidget(_RiseToastAnimatedShell oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.translateY != widget.translateY ||
        oldWidget.scale != widget.scale) {
      // Capture current animated values as the new start point so the
      // transition begins from wherever the previous animation left off.
      final fromTranslate = _translateAnim.value;
      final fromScale = _scaleAnim.value;

      _reflowCtrl.reset();
      _translateAnim = Tween<double>(begin: fromTranslate, end: widget.translateY)
          .animate(CurvedAnimation(parent: _reflowCtrl, curve: Curves.easeOutCubic));
      _scaleAnim = Tween<double>(begin: fromScale, end: widget.scale)
          .animate(CurvedAnimation(parent: _reflowCtrl, curve: Curves.easeOutCubic));
      _reflowCtrl.forward();
    }
  }

  @override
  void dispose() {
    widget.controller.unregisterExitAnimation(widget.entryId);
    _enterExitCurve.dispose();
    _enterExitCtrl.dispose();
    _reflowCtrl.dispose();
    super.dispose();
  }

  bool _exiting = false;

  void _playExit() {
    if (!mounted || _exiting) return;
    _exiting = true;
    if (_enterExitCtrl.isDismissed) {
      widget.controller.finishDismiss(widget.entryId);
      return;
    }
    _enterExitCtrl.reverse().whenComplete(() {
      if (mounted) widget.controller.finishDismiss(widget.entryId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final align = widget.isPlacementBottom ? Alignment.bottomCenter : Alignment.topCenter;
    final slideDir = widget.isPlacementBottom ? 1.0 : -1.0;

    return AnimatedBuilder(
      animation: Listenable.merge([_enterExitCurve, _reflowCtrl]),
      builder: (context, child) {
        final enterT = _enterExitCurve.value;
        // Slide from below (bottom) or above (top) on enter/exit.
        final enterSlideY = slideDir * (1.0 - enterT);

        return FractionalTranslation(
          translation: Offset(0, enterSlideY),
          child: Opacity(
            opacity: enterT.clamp(0.0, 1.0),
            child: Transform.translate(
              offset: Offset(0, _translateAnim.value),
              child: Transform.scale(
                scale: _scaleAnim.value,
                alignment: align,
                child: child,
              ),
            ),
          ),
        );
      },
      child: IgnorePointer(
        ignoring: widget.idxFromFront > 0,
        child: widget.card,
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
