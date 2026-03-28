import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// Durations aligned with HeroUI v3 accordion CSS (`duration-250`, panel `200ms`).
abstract final class RiseAccordionMotion {
  RiseAccordionMotion._();

  /// Indicator rotation (`duration-250`).
  static const Duration indicator = Duration(milliseconds: 250);

  /// Panel height / reveal (`200ms`, ease-out-quad).
  static const Duration panel = Duration(milliseconds: 200);
}

/// Whether one or many panels may be expanded at once.
enum RiseAccordionSelectionMode {
  /// Only one panel open at a time.
  single,

  /// Any number of panels may be open.
  multiple,
}

/// HeroUI React [`variant`](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/accordion/accordion.tsx) — default is borderless full-width; surface adds a rounded shell.
enum RiseAccordionVariant {
  /// Full-width, hairline separators only ([`accordion.css`](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/accordion.css) default).
  default_,

  /// Rounded surface card + inset dividers + `bg-default` trigger hover when collapsed.
  surface,
}

/// Root scope: expansion state and layout tokens for [RiseAccordionItem] descendants.
@immutable
class RiseAccordionData {
  const RiseAccordionData({
    required this.horizontalPadding,
    required this.separatorMargin,
    required this.isExpanded,
    required this.onToggle,
    required this.rootDisabled,
    required this.variant,
  });

  /// HeroUI `.accordion__trigger`: `px-4` → **16**; surface-style panels often use **20**.
  final double horizontalPadding;

  /// Matches [RiseAccordion.variant] — drives trigger hover and divider tone.
  final RiseAccordionVariant variant;

  final EdgeInsetsGeometry? separatorMargin;

  final bool Function(String value) isExpanded;

  final void Function(String value, {required bool itemDisabled}) onToggle;

  final bool rootDisabled;

  EdgeInsetsGeometry get triggerPadding {
    return EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 16);
  }

  /// HeroUI `.accordion__body-inner`: `px-4 pt-0 pb-4`.
  EdgeInsetsGeometry get contentPadding {
    return EdgeInsets.fromLTRB(horizontalPadding, 0, horizontalPadding, 16);
  }

  static const double titleToIndicatorGap = 16;

  static const double leadingToTitleGap = 12;
}

class RiseAccordionScope extends InheritedWidget {
  const RiseAccordionScope({
    super.key,
    required this.data,
    required super.child,
  });

  final RiseAccordionData data;

  static RiseAccordionData of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<RiseAccordionScope>();
    assert(scope != null, 'RiseAccordionTrigger/Content/Indicator must be inside RiseAccordion');
    return scope!.data;
  }

  @override
  bool updateShouldNotify(RiseAccordionScope oldWidget) {
    return data != oldWidget.data;
  }
}

@immutable
class RiseAccordionItemRenderData {
  const RiseAccordionItemRenderData({
    required this.isExpanded,
    required this.value,
  });

  final bool isExpanded;

  final String value;
}

typedef RiseAccordionItemBuilder = Widget Function(
  BuildContext context,
  RiseAccordionItemRenderData data,
);

class RiseAccordionItemScope extends InheritedWidget {
  const RiseAccordionItemScope({
    super.key,
    required this.value,
    required this.itemDisabled,
    required super.child,
  });

  final String value;

  final bool itemDisabled;

  static RiseAccordionItemScope of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<RiseAccordionItemScope>();
    assert(scope != null, 'RiseAccordionItemScope not found — wrap with RiseAccordionItem');
    return scope!;
  }

  @override
  bool updateShouldNotify(RiseAccordionItemScope oldWidget) {
    return value != oldWidget.value || itemDisabled != oldWidget.itemDisabled;
  }
}

/// Root → items → trigger / indicator / content.
///
/// Default **chrome**: none (HeroUI web `variant="default"` is full-width with item separators only).
/// Set [variant] to [RiseAccordionVariant.surface] for the rounded shell (same as passing
/// [RiseAccordionDecorations.surface] via [decoration], which wins when both are set).
/// Alternatively opt in with [backgroundColor] / [showBorder].
class RiseAccordion extends StatefulWidget {
  const RiseAccordion({
    super.key,
    required this.children,
    this.backgroundColor,
    this.decoration,
    this.variant = RiseAccordionVariant.default_,
    this.borderRadius = 12,
    this.showBorder = false,
    this.horizontalPadding = 16,
    this.separatorMargin,
    this.selectionMode = RiseAccordionSelectionMode.single,
    this.hideSeparator = false,
    this.isCollapsible = true,
    this.isDisabled = false,
    this.initialExpanded,
    this.expandedValues,
    this.onExpandedChanged,
  }) : assert(
          expandedValues == null || onExpandedChanged != null,
          'Controlled mode requires onExpandedChanged',
        );

  final List<Widget> children;

  /// When [decoration] is null, optional fill behind the whole accordion.
  final Color? backgroundColor;

  final BoxDecoration? decoration;

  /// When [decoration] is null and this is [RiseAccordionVariant.surface], applies
  /// [RiseAccordionDecorations.surface].
  final RiseAccordionVariant variant;

  final double borderRadius;

  /// When [decoration] is null, optional hairline border (off by default — HeroUI default has no outer border).
  final bool showBorder;

  /// HeroUI trigger/content horizontal padding (`px-4` = **16**).
  final double horizontalPadding;

  final EdgeInsetsGeometry? separatorMargin;

  final RiseAccordionSelectionMode selectionMode;

  final bool hideSeparator;

  final bool isCollapsible;

  final bool isDisabled;

  final List<String>? initialExpanded;

  final List<String>? expandedValues;

  final ValueChanged<List<String>>? onExpandedChanged;

  @override
  State<RiseAccordion> createState() => _RiseAccordionState();
}

class _RiseAccordionState extends State<RiseAccordion> {
  late Set<String> _expanded;

  @override
  void initState() {
    super.initState();
    _expanded = Set<String>.from(widget.initialExpanded ?? const []);
  }

  @override
  void didUpdateWidget(RiseAccordion oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.expandedValues != null) {
      return;
    }
    if (widget.initialExpanded != oldWidget.initialExpanded) {
      _expanded = Set<String>.from(widget.initialExpanded ?? const []);
    }
  }

  Set<String> get _effective {
    if (widget.expandedValues != null) {
      return Set<String>.from(widget.expandedValues!);
    }
    return _expanded;
  }

  void _toggle(String value, {required bool itemDisabled}) {
    if (widget.isDisabled || itemDisabled) return;

    final current = Set<String>.from(_effective);
    final Set<String> next;

    if (current.contains(value)) {
      if (!widget.isCollapsible) {
        return;
      }
      next = Set<String>.from(current)..remove(value);
    } else if (widget.selectionMode == RiseAccordionSelectionMode.single) {
      next = {value};
    } else {
      next = Set<String>.from(current)..add(value);
    }

    widget.onExpandedChanged?.call(next.toList());
    if (widget.expandedValues == null) {
      setState(() => _expanded = next);
    }
  }

  @override
  Widget build(BuildContext context) {
    final effectiveDecoration = widget.decoration ??
        (widget.variant == RiseAccordionVariant.surface
            ? RiseAccordionDecorations.surface(context)
            : null);

    final data = RiseAccordionData(
      horizontalPadding: widget.horizontalPadding,
      separatorMargin: widget.separatorMargin,
      rootDisabled: widget.isDisabled,
      variant: widget.variant,
      isExpanded: (v) => _effective.contains(v),
      onToggle: _toggle,
    );

    final columnChildren = <Widget>[];
    for (var i = 0; i < widget.children.length; i++) {
      if (i > 0 && !widget.hideSeparator) {
        columnChildren.add(
          _RiseAccordionSeparator(margin: widget.separatorMargin),
        );
      }
      columnChildren.add(widget.children[i]);
    }

    Widget body = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: columnChildren,
    );

    body = _decorateRoot(context, body, effectiveDecoration);

    return RiseAccordionScope(data: data, child: body);
  }

  Widget _decorateRoot(
    BuildContext context,
    Widget body,
    BoxDecoration? effectiveDecoration,
  ) {
    if (effectiveDecoration != null) {
      final d = effectiveDecoration;
      final r = d.borderRadius?.resolve(Directionality.of(context)) ??
          BorderRadius.circular(widget.borderRadius);
      return DecoratedBox(
        decoration: d,
        child: ClipRRect(
          borderRadius: r,
          child: body,
        ),
      );
    }

    final hasChrome = widget.backgroundColor != null || widget.showBorder;
    if (!hasChrome) {
      return body;
    }

    final rise = context.riseTheme;
    final bg = widget.backgroundColor;
    final br = BorderRadius.circular(widget.borderRadius);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: bg,
        borderRadius: br,
        border: widget.showBorder
            ? Border.all(color: rise.border.withValues(alpha: 0.35))
            : null,
      ),
      child: ClipRRect(
        borderRadius: br,
        child: body,
      ),
    );
  }
}

class _RiseAccordionSeparator extends StatelessWidget {
  const _RiseAccordionSeparator({this.margin});

  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final variant = RiseAccordionScope.of(context).variant;
    final color = variant == RiseAccordionVariant.surface
        ? rise.defaultForeground.withValues(alpha: 0.06)
        : rise.separator;
    final line = Divider(
      height: 1,
      thickness: 1,
      color: color,
    );
    if (margin != null) {
      return Padding(
        padding: margin!,
        child: line,
      );
    }
    return line;
  }
}

class RiseAccordionItem extends StatelessWidget {
  const RiseAccordionItem({
    super.key,
    required this.value,
    required this.child,
    this.isDisabled = false,
  });

  final String value;

  final bool isDisabled;

  final Widget child;

  factory RiseAccordionItem.render({
    Key? key,
    required String value,
    required RiseAccordionItemBuilder builder,
    bool isDisabled = false,
  }) {
    return RiseAccordionItem(
      key: key,
      value: value,
      isDisabled: isDisabled,
      child: _RiseAccordionItemRenderBridge(value: value, builder: builder),
    );
  }

  /// HeroUI-style row: `text-sm font-medium` title, `text-sm` muted body, optional leading.
  factory RiseAccordionItem.panel({
    Key? key,
    required String value,
    required Widget title,
    required Widget content,
    Widget? leading,
    bool isDisabled = false,
    bool applyMutedStyleToContent = true,
  }) {
    return RiseAccordionItem(
      key: key,
      value: value,
      isDisabled: isDisabled,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RiseAccordionTrigger(
            child: Builder(
              builder: (context) {
                final rise = context.riseTheme;
                final titleStyle = TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 1.43,
                  color: rise.defaultForeground,
                );
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (leading != null) ...[
                      leading,
                      SizedBox(width: RiseAccordionData.leadingToTitleGap),
                    ],
                    Expanded(
                      child: DefaultTextStyle.merge(
                        style: titleStyle,
                        child: title,
                      ),
                    ),
                    SizedBox(width: RiseAccordionData.titleToIndicatorGap),
                    const RiseAccordionIndicator(),
                  ],
                );
              },
            ),
          ),
          RiseAccordionContent(
            child: applyMutedStyleToContent
                ? Builder(
                    builder: (context) {
                      final rise = context.riseTheme;
                      return DefaultTextStyle.merge(
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.43,
                          color: rise.mutedForeground(0.8),
                        ),
                        child: content,
                      );
                    },
                  )
                : content,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RiseAccordionItemScope(
      value: value,
      itemDisabled: isDisabled,
      child: child,
    );
  }
}

class _RiseAccordionItemRenderBridge extends StatelessWidget {
  const _RiseAccordionItemRenderBridge({
    required this.value,
    required this.builder,
  });

  final String value;
  final RiseAccordionItemBuilder builder;

  @override
  Widget build(BuildContext context) {
    final root = RiseAccordionScope.of(context);
    final data = RiseAccordionItemRenderData(
      isExpanded: root.isExpanded(value),
      value: value,
    );
    return builder(context, data);
  }
}

/// HeroUI `.accordion__trigger`: default hover `color-mix(foreground 3%)` when collapsed; surface variant uses `bg-default` ([RiseThemeData.muted]); focus ring.
class RiseAccordionTrigger extends StatelessWidget {
  const RiseAccordionTrigger({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final data = RiseAccordionScope.of(context);
    final item = RiseAccordionItemScope.of(context);

    void onTap() {
      data.onToggle(item.value, itemDisabled: item.itemDisabled);
    }

    final rise = context.riseTheme;
    final padding = data.triggerPadding;
    final expanded = data.isExpanded(item.value);
    final disabled = data.rootDisabled || item.itemDisabled;

    final hoverColor = disabled || expanded
        ? Colors.transparent
        : data.variant == RiseAccordionVariant.surface
            ? rise.muted
            : rise.defaultForeground.withValues(alpha: 0.03);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: disabled ? null : onTap,
        hoverColor: hoverColor,
        splashColor: rise.defaultForeground.withValues(alpha: 0.06),
        highlightColor: rise.defaultForeground.withValues(alpha: 0.04),
        focusColor: rise.accent.withValues(alpha: 0.12),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}

/// HeroUI `.accordion__indicator`: chevron `size-4`, rotate **−180°** when expanded, **250ms** transition.
class RiseAccordionIndicator extends StatelessWidget {
  const RiseAccordionIndicator({
    super.key,
    this.size = 16,
    this.color,
    this.child,
    this.expandedTurns = 0.5,
  });

  final double size;

  final Color? color;

  /// Replaces the default chevron (rotation [expandedTurns] when expanded — e.g. `0.125` for 45°).
  final Widget? child;

  /// Full turns to apply when expanded (default **0.5** = 180°).
  final double expandedTurns;

  @override
  Widget build(BuildContext context) {
    final data = RiseAccordionScope.of(context);
    final item = RiseAccordionItemScope.of(context);
    final rise = context.riseTheme;
    final expanded = data.isExpanded(item.value);
    final c = color ?? rise.mutedForeground(0.7);

    final Widget effective = child ??
        Icon(
          Icons.expand_more,
          size: size,
          color: c,
        );

    return AnimatedRotation(
      turns: expanded ? expandedTurns : 0,
      duration: RiseAccordionMotion.indicator,
      curve: Curves.easeOut,
      child: SizedBox(
        width: size,
        height: size,
        child: Center(child: effective),
      ),
    );
  }
}

/// HeroUI `.accordion__panel`: height + opacity **200ms** `ease-out-quad`.
class RiseAccordionContent extends StatelessWidget {
  const RiseAccordionContent({
    super.key,
    required this.child,
    this.alignment = Alignment.topCenter,
  });

  final Widget child;

  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    final data = RiseAccordionScope.of(context);
    final item = RiseAccordionItemScope.of(context);
    final expanded = data.isExpanded(item.value);
    final padding = data.contentPadding;

    return AnimatedSize(
      duration: RiseAccordionMotion.panel,
      curve: Curves.easeOutQuad,
      alignment: alignment,
      child: expanded
          ? Padding(
              padding: padding,
              child: child,
            )
          : const SizedBox.shrink(),
    );
  }
}

/// HeroUI v3 surface variant: `rounded-3xl` + [`RiseThemeData.surface`] + [`--surface-shadow`](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/themes/default/variables.css) in light mode.
///
/// Matches [heroui-native accordion surface](https://github.com/heroui-inc/heroui-native/blob/rc/src/components/accordion/accordion.styles.ts)
/// (`bg-surface`, `shadow-surface`) — same shell idea as [RiseSurface] / [RiseListGroup].
abstract final class RiseAccordionDecorations {
  RiseAccordionDecorations._();

  static const List<BoxShadow> _surfaceShadowsLight = [
    BoxShadow(color: Color(0x0A000000), offset: Offset(0, 2), blurRadius: 4),
    BoxShadow(color: Color(0x0F000000), offset: Offset(0, 1), blurRadius: 2),
    BoxShadow(color: Color(0x0F000000), offset: Offset(0, 0), blurRadius: 0, spreadRadius: 1),
  ];

  /// Surface shell: **24px** radius, **[RiseThemeData.surface]** fill, Hero `--surface-shadow` in light (matches [RiseSurface] / [RiseListGroup]).
  /// Pair with `horizontalPadding: 20` and `separatorMargin: EdgeInsets.symmetric(horizontal: 12)` for inset dividers.
  static BoxDecoration surface(BuildContext context) {
    final rise = context.riseTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return BoxDecoration(
      color: rise.surface,
      borderRadius: BorderRadius.circular(24),
      boxShadow: isDark ? null : _surfaceShadowsLight,
    );
  }
}
