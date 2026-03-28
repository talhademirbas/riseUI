import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// HeroUI [`tabs.css`](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/tabs.css)
/// indicator motion (`250ms`, `ease-out-fluid` in CSS).
abstract final class RiseTabsMotion {
  RiseTabsMotion._();

  /// Selection indicator translate / size (`.tabs__indicator` `transition-duration: 250ms`).
  static const Duration indicator = Duration(milliseconds: 250);
}

/// Visual variant (HeroUI [Tabs](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/tabs/tabs.tsx) /
/// [tabs.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/tabs.css)).
enum RiseTabsVariant {
  /// Default: `bg-default` track (`.tabs__list`), `bg-segment` pill + `--shadow-surface` (`.tabs__indicator`).
  default_,

  /// Underline / leading-edge indicator, transparent list (`.tabs--secondary`).
  secondary,
}

/// Tab strip + panel layout orientation.
enum RiseTabsOrientation {
  horizontal,
  vertical,
}

/// Coordinates a tab strip and [TabBarView] (HeroUI [tabs.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/tabs/tabs.tsx)).
///
/// [tabViewHeight] bounds the tab content when the parent does not give a tight height
/// (e.g. inside a [ListView]). Spacing before the panel matches `.tabs__panel` (`mt-4` / **16**).
class RiseTabs extends StatefulWidget {
  const RiseTabs({
    super.key,
    required this.tabs,
    required this.children,
    this.tabViewHeight = 240,
    this.variant = RiseTabsVariant.default_,
    this.orientation = RiseTabsOrientation.horizontal,
    this.tabEnabled,
    this.labelStyle,
    this.indicatorWeight = 2,
    this.isScrollable = false,
    this.initialIndex = 0,
    this.onChanged,
    this.tabAlignment,
    this.labelColor,
    this.unselectedLabelColor,
  })  : assert(tabs.length == children.length, 'tabs and children must match'),
        assert(tabEnabled == null || tabEnabled.length == tabs.length);

  final List<Widget> tabs;

  final List<Widget> children;

  final double tabViewHeight;

  final RiseTabsVariant variant;

  final RiseTabsOrientation orientation;

  /// When false at index [i], that tab cannot be selected (HeroUI `isDisabled`).
  final List<bool>? tabEnabled;

  final TextStyle? labelStyle;

  /// Underline thickness for [RiseTabsVariant.secondary] horizontal tabs.
  final double indicatorWeight;

  final bool isScrollable;

  final int initialIndex;

  final ValueChanged<int>? onChanged;

  /// Horizontal [TabBar] alignment (e.g. [TabAlignment.center] for centered secondary tabs).
  final TabAlignment? tabAlignment;

  /// Selected tab label color. Defaults to [RiseThemeData.defaultForeground].
  final Color? labelColor;

  /// Unselected tab label color. Defaults to muted foreground at 55% opacity.
  final Color? unselectedLabelColor;

  @override
  State<RiseTabs> createState() => _RiseTabsState();
}

class _RiseTabsState extends State<RiseTabs> with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _lastValidIndex = 0;

  /// Hero `--shadow-surface` on the segment pill (light only; matches [RiseSurface] / accordion).
  static const List<BoxShadow> _segmentShadowsLight = [
    BoxShadow(color: Color(0x0A000000), offset: Offset(0, 2), blurRadius: 4),
    BoxShadow(color: Color(0x0F000000), offset: Offset(0, 1), blurRadius: 2),
    BoxShadow(color: Color(0x0F000000), offset: Offset(0, 0), blurRadius: 0, spreadRadius: 1),
  ];

  /// Hero `.tabs__tab` horizontal strip: `h-8` (32px) — Flutter [Tab] defaults to 46px without [Tab.height].
  static const double _horizontalTabHeight = 32;

  /// Horizontal [TabBar] label insets only (not used by vertical list).
  static const EdgeInsets _horizontalLabelPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 0);

  /// Vertical list rows (Hero vertical tab list); keep comfortable tap targets — not the same as [_horizontalLabelPadding].
  static const EdgeInsets _verticalTabPadding =
      EdgeInsets.symmetric(horizontal: 14, vertical: 10);

  void _onTabBarTap(int index) {
    final e = widget.tabEnabled;
    if (e != null && index < e.length && !e[index]) {
      _controller.index = _controller.previousIndex;
    }
  }

  /// Swiping [TabBarView] can land on a disabled index; block gestures when any tab is disabled.
  ScrollPhysics? get _tabViewPhysics {
    final e = widget.tabEnabled;
    if (e != null && e.any((enabled) => !enabled)) {
      return const NeverScrollableScrollPhysics();
    }
    return null;
  }

  int _safeInitialIndex() {
    final n = widget.tabs.length;
    if (n == 0) return 0;
    var idx = widget.initialIndex.clamp(0, n - 1);
    final e = widget.tabEnabled;
    if (e == null) return idx;
    if (idx < e.length && e[idx]) return idx;
    for (var i = 0; i < e.length; i++) {
      if (e[i]) return i;
    }
    return 0;
  }

  @override
  void initState() {
    super.initState();
    final initial = _safeInitialIndex();
    _controller = TabController(
      length: widget.tabs.length,
      vsync: this,
      initialIndex: initial,
    );
    _lastValidIndex = initial;
    _controller.addListener(_onTabControllerTick);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTabControllerTick);
    _controller.dispose();
    super.dispose();
  }

  void _onTabControllerTick() {
    if (_controller.indexIsChanging) return;
    final e = widget.tabEnabled;
    if (e != null &&
        _controller.index < e.length &&
        !e[_controller.index]) {
      final snap = _lastValidIndex.clamp(0, widget.tabs.length - 1);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _controller.index = snap;
      });
      return;
    }
    if (_lastValidIndex != _controller.index) {
      _lastValidIndex = _controller.index;
      widget.onChanged?.call(_controller.index);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.orientation == RiseTabsOrientation.vertical) {
      return _buildVertical(context);
    }
    return _buildHorizontal(context);
  }

  Widget _buildHorizontal(BuildContext context) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final effectiveTabs = _effectiveTabs(context);
    final baseLabel = widget.labelStyle ??
        TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 20 / 14,
          color: rise.defaultForeground,
        );

    final anyDisabled = widget.tabEnabled?.any((e) => !e) ?? false;

    if (widget.variant == RiseTabsVariant.default_) {
      final tabTheme = TabBarThemeData(
        indicatorAnimation: TabIndicatorAnimation.elastic,
        splashFactory: anyDisabled ? NoSplash.splashFactory : null,
        overlayColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) return Colors.transparent;
            if (states.contains(WidgetState.hovered)) {
              return rise.defaultForeground.withValues(alpha: 0.08);
            }
            return null;
          },
        ),
      );
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: rise.muted,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Theme(
                data: theme.copyWith(tabBarTheme: tabTheme),
                child: TabBar(
                  controller: _controller,
                  tabs: effectiveTabs,
                  isScrollable: widget.isScrollable,
                  padding: widget.isScrollable ? EdgeInsets.zero : null,
                  labelPadding: _horizontalLabelPadding,
                  dividerColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: rise.surface,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: isDark ? null : _segmentShadowsLight,
                  ),
                  labelStyle: baseLabel,
                  labelColor: widget.labelColor ?? rise.defaultForeground,
                  unselectedLabelColor:
                      widget.unselectedLabelColor ?? rise.mutedForeground(0.55),
                  splashBorderRadius: BorderRadius.circular(18),
                  onTap: _onTabBarTap,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: widget.tabViewHeight,
            child: TabBarView(
              controller: _controller,
              physics: _tabViewPhysics,
              children: widget.children,
            ),
          ),
        ],
      );
    }

    final secondaryTabTheme = TabBarThemeData(
      dividerColor: rise.border,
      splashFactory: anyDisabled ? NoSplash.splashFactory : null,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Theme(
          data: theme.copyWith(tabBarTheme: secondaryTabTheme),
          child: TabBar(
            controller: _controller,
            tabs: effectiveTabs,
            isScrollable: widget.isScrollable,
            padding: widget.isScrollable ? EdgeInsets.zero : null,
            labelPadding: _horizontalLabelPadding,
            tabAlignment: widget.tabAlignment,
            labelStyle: baseLabel,
            labelColor: widget.labelColor ?? rise.defaultForeground,
            unselectedLabelColor:
                widget.unselectedLabelColor ?? rise.mutedForeground(0.55),
            indicatorColor: rise.accent,
            indicatorWeight: widget.indicatorWeight,
            dividerColor: rise.border,
            onTap: _onTabBarTap,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: widget.tabViewHeight,
          child: TabBarView(
            controller: _controller,
            physics: _tabViewPhysics,
            children: widget.children,
          ),
        ),
      ],
    );
  }

  Widget _buildVertical(BuildContext context) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final secondary = widget.variant == RiseTabsVariant.secondary;

    final list = secondary
        ? _verticalTabList(context, rise, theme, true, isDark)
        : DecoratedBox(
            decoration: BoxDecoration(
              color: rise.muted,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: _verticalTabList(context, rise, theme, false, isDark),
            ),
          );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 180, child: list),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: SizedBox(
              height: widget.tabViewHeight,
              child: TabBarView(
                controller: _controller,
                physics: _tabViewPhysics,
                children: widget.children,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _verticalTabList(
    BuildContext context,
    RiseThemeData rise,
    ThemeData theme,
    bool secondary,
    bool isDark,
  ) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final n = widget.tabs.length;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: List.generate(n, (i) {
            final selected = _controller.index == i;
            final disabled =
                widget.tabEnabled != null && i < widget.tabEnabled!.length && !widget.tabEnabled![i];
            final title = _tabTitle(widget.tabs[i], i);
            final baseVerticalLabel = widget.labelStyle ??
                TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 20 / 14,
                );
            final style = baseVerticalLabel.copyWith(
              color: disabled
                  ? rise.mutedForeground(0.35)
                  : selected
                      ? (widget.labelColor ?? rise.defaultForeground)
                      : (widget.unselectedLabelColor ?? rise.mutedForeground(0.55)),
            );

            void onTap() {
              _controller.animateTo(i);
            }

            if (secondary) {
              final cell = Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: disabled ? null : onTap,
                  mouseCursor: disabled ? SystemMouseCursors.basic : null,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: _verticalTabPadding,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: selected ? rise.accent : rise.border,
                          width: selected ? 2 : 1,
                        ),
                      ),
                    ),
                    child: Text(title, style: style),
                  ),
                ),
              );
              if (i == 0) return cell;
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 4),
                  cell,
                ],
              );
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(16),
                child: InkWell(
                  onTap: disabled ? null : onTap,
                  mouseCursor: disabled ? SystemMouseCursors.basic : null,
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: _verticalTabPadding,
                    decoration: BoxDecoration(
                      color: selected ? rise.surface : null,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: selected && !isDark ? _segmentShadowsLight : null,
                    ),
                    child: Text(title, style: style),
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }

  List<Widget> _effectiveTabs(BuildContext context) {
    final rise = context.riseTheme;
    return List.generate(widget.tabs.length, (i) {
      final disabled =
          widget.tabEnabled != null && i < widget.tabEnabled!.length && !widget.tabEnabled![i];
      if (disabled) {
        final title = _tabTitle(widget.tabs[i], i);
        return Tab(
          height: _horizontalTabHeight,
          child: Opacity(
            opacity: rise.disabledOpacity,
            child: Text(
              title,
              style: widget.labelStyle,
            ),
          ),
        );
      }

      return _horizontalTabWithHeroHeight(widget.tabs[i]);
    });
  }

  /// Coerces default [Tab] height (46px) down to Hero `h-8` for horizontal bars only.
  Widget _horizontalTabWithHeroHeight(Widget tab) {
    if (tab is! Tab || tab.height != null) return tab;
    if (tab.icon != null && (tab.text != null || tab.child != null)) {
      return tab;
    }
    return Tab(
      key: tab.key,
      text: tab.text,
      icon: tab.icon,
      iconMargin: tab.iconMargin,
      height: _horizontalTabHeight,
      child: tab.child,
    );
  }

  String _tabTitle(Widget tab, int index) {
    if (tab is Tab && tab.text != null) return tab.text!;
    return 'Tab ${index + 1}';
  }
}
