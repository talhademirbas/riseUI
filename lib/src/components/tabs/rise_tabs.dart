import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// Visual variant (HeroUI [Tabs](https://heroui.com/docs/react/components/tabs) /
/// [tabs.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/tabs.css)).
enum RiseTabsVariant {
  /// Filled segment indicator on a muted track (`tabs__indicator` + pill list).
  primary,

  /// Underline / leading-edge indicator, transparent list (`tabs--secondary`).
  secondary,
}

/// Tab strip + panel layout orientation.
enum RiseTabsOrientation {
  horizontal,
  vertical,
}

/// Coordinates a tab strip and [TabBarView] (HeroUI Tabs + [tabs.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/tabs/tabs.tsx)).
///
/// [tabViewHeight] bounds the tab content when the parent does not give a tight height
/// (e.g. inside a [ListView]).
class RiseTabs extends StatefulWidget {
  const RiseTabs({
    super.key,
    required this.tabs,
    required this.children,
    this.tabViewHeight = 240,
    this.variant = RiseTabsVariant.primary,
    this.orientation = RiseTabsOrientation.horizontal,
    this.tabEnabled,
    this.labelStyle,
    this.indicatorWeight = 2,
    this.isScrollable = false,
    this.initialIndex = 0,
    this.onChanged,
    this.tabAlignment,
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

  @override
  State<RiseTabs> createState() => _RiseTabsState();
}

class _RiseTabsState extends State<RiseTabs> with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _lastValidIndex = 0;

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
    final effectiveTabs = _effectiveTabs(context);
    final baseLabel = widget.labelStyle ??
        theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600);

    if (widget.variant == RiseTabsVariant.primary) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: rise.muted,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: TabBar(
                controller: _controller,
                tabs: effectiveTabs,
                isScrollable: widget.isScrollable,
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.07),
                      blurRadius: 6,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                labelStyle: baseLabel,
                labelColor: rise.defaultForeground,
                unselectedLabelColor: rise.mutedForeground(0.55),
                splashBorderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
          SizedBox(
            height: widget.tabViewHeight,
            child: TabBarView(
              controller: _controller,
              children: widget.children,
            ),
          ),
        ],
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TabBar(
          controller: _controller,
          tabs: effectiveTabs,
          isScrollable: widget.isScrollable,
          tabAlignment: widget.tabAlignment,
          labelStyle: baseLabel,
          labelColor: rise.defaultForeground,
          unselectedLabelColor: rise.mutedForeground(0.55),
          indicatorColor: rise.accent,
          indicatorWeight: widget.indicatorWeight,
          dividerColor: rise.border.withValues(alpha: 0.65),
        ),
        SizedBox(
          height: widget.tabViewHeight,
          child: TabBarView(
            controller: _controller,
            children: widget.children,
          ),
        ),
      ],
    );
  }

  Widget _buildVertical(BuildContext context) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);
    final secondary = widget.variant == RiseTabsVariant.secondary;

    final list = secondary
        ? DecoratedBox(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: rise.border.withValues(alpha: 0.75)),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: _verticalTabList(context, rise, theme, true),
            ),
          )
        : DecoratedBox(
            decoration: BoxDecoration(
              color: rise.muted,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: _verticalTabList(context, rise, theme, false),
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
  ) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: List.generate(widget.tabs.length, (i) {
            final selected = _controller.index == i;
            final disabled =
                widget.tabEnabled != null && i < widget.tabEnabled!.length && !widget.tabEnabled![i];
            final title = _tabTitle(widget.tabs[i], i);
            final style = (widget.labelStyle ??
                    theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600))
                ?.copyWith(
              color: disabled
                  ? rise.mutedForeground(0.35)
                  : selected
                      ? rise.defaultForeground
                      : rise.mutedForeground(0.55),
            );

            void onTap() {
              if (disabled) return;
              _controller.animateTo(i);
            }

            if (secondary && selected) {
              return Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onTap,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(color: rise.accent, width: 2),
                      ),
                    ),
                    child: Text(title, style: style),
                  ),
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(16),
                child: InkWell(
                  onTap: onTap,
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: !secondary && selected ? theme.colorScheme.surface : null,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: !secondary && selected
                          ? [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.07),
                                blurRadius: 6,
                                offset: const Offset(0, 1),
                              ),
                            ]
                          : null,
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
      final tab = widget.tabs[i];
      final disabled =
          widget.tabEnabled != null && i < widget.tabEnabled!.length && !widget.tabEnabled![i];
      if (!disabled) return tab;
      final title = _tabTitle(tab, i);
      return Tab(
        child: Opacity(
          opacity: rise.disabledOpacity,
          child: Text(
            title,
            style: widget.labelStyle,
          ),
        ),
      );
    });
  }

  String _tabTitle(Widget tab, int index) {
    if (tab is Tab && tab.text != null) return tab.text!;
    return 'Tab ${index + 1}';
  }
}
