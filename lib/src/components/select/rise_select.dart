import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';
import '../input/rise_input.dart';

/// Visual variant aligned with HeroUI
/// [select.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/select.css)
/// (`.select--primary` / `.select--secondary`).
enum RiseSelectVariant {
  /// Default: `shadow-field`, `bg-field`.
  primary,

  /// `shadow-none`, `--color-default` fill on the trigger.
  secondary,
}

/// Item for [RiseSelect].
@immutable
class RiseSelectItem<T> {
  const RiseSelectItem({
    required this.value,
    required this.label,
    this.isDisabled = false,
    this.sectionHeader,
  });

  final T value;
  final String label;
  final bool isDisabled;

  /// When non-null, a section label is inserted above this row (HeroUI grouped list-box).
  final String? sectionHeader;
}

/// Builds the trigger value row; [defaultChild] is the standard label or placeholder text.
typedef RiseSelectTriggerValueBuilder<T> = Widget Function(
  BuildContext context, {
  required Widget defaultChild,
  required bool isPlaceholder,
});

/// Single- and multi-select aligned with HeroUI
/// [Select](https://github.com/heroui-inc/heroui/tree/v3/packages/react/src/components/select)
/// and [select.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/select.css).
///
/// Trigger uses the same minimum height and border/focus behavior as [RiseInput]; popover uses
/// `rounded-3xl` (24) and overlay chrome like `.select__popover`.
class RiseSelect<T> extends StatefulWidget {
  const RiseSelect({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    this.placeholder,
    this.label,
    this.description,
    this.errorMessage,
    this.enabled = true,
    this.isRequired = false,
    this.isInvalid = false,
    this.fullWidth = false,
    this.variant = RiseSelectVariant.primary,
    this.indicatorIcon,
    this.triggerValueBuilder,
  })  : multiSelect = false,
        selectedValues = null,
        onValuesChanged = null;

  const RiseSelect.multi({
    super.key,
    required this.items,
    required this.selectedValues,
    required this.onValuesChanged,
    this.placeholder,
    this.label,
    this.description,
    this.errorMessage,
    this.enabled = true,
    this.isRequired = false,
    this.isInvalid = false,
    this.fullWidth = false,
    this.variant = RiseSelectVariant.primary,
    this.indicatorIcon,
    this.triggerValueBuilder,
  })  : multiSelect = true,
        value = null,
        onChanged = null;

  final List<RiseSelectItem<T>> items;

  final bool multiSelect;

  final T? value;

  final ValueChanged<T?>? onChanged;

  final List<T>? selectedValues;

  final ValueChanged<List<T>>? onValuesChanged;

  final String? placeholder;

  final Widget? label;

  final Widget? description;

  final Widget? errorMessage;

  final bool enabled;

  final bool isRequired;

  final bool isInvalid;

  /// Reserved for API parity with HeroUI; the control and menu both stretch to the parent’s max width when bounded.
  final bool fullWidth;

  final RiseSelectVariant variant;

  /// Chevron by default; matches `[data-slot="select-indicator"]`.
  final Widget? indicatorIcon;

  final RiseSelectTriggerValueBuilder<T>? triggerValueBuilder;

  /// Same tap target as [RiseInput] (Hero comfortable field height, not web-only `min-h-9`).
  static const double kMinHeight = RiseInput.kMinHeight;

  static const double _kRadius = 14;
  static const double _kPopoverRadius = 24;

  static const EdgeInsets _kMenuPadding = EdgeInsets.symmetric(horizontal: 6, vertical: 4);

  @override
  State<RiseSelect<T>> createState() => _RiseSelectState<T>();
}

class _RiseSelectState<T> extends State<RiseSelect<T>> {
  final MenuController _menuController = MenuController();
  final FocusNode _focusNode = FocusNode();

  bool _hovering = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChanged);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChanged() => setState(() {});

  RiseSelectItem<T>? _itemForValue(T v) {
    for (final i in widget.items) {
      if (i.value == v) return i;
    }
    return null;
  }

  bool get _isPlaceholder {
    if (widget.multiSelect) {
      return widget.selectedValues == null || widget.selectedValues!.isEmpty;
    }
    return widget.value == null;
  }

  String _defaultTriggerLabel() {
    final placeholder = widget.placeholder ?? 'Select';
    if (widget.multiSelect) {
      final sel = widget.selectedValues!;
      if (sel.isEmpty) return placeholder;
      if (sel.length == 1) {
        return _itemForValue(sel.first)?.label ?? placeholder;
      }
      return '${sel.length} selected';
    }
    if (widget.value == null) return placeholder;
    return _itemForValue(widget.value as T)?.label ?? placeholder;
  }

  Widget _buildTriggerValue(RiseThemeData rise, ThemeData theme) {
    final defaultChild = Text(
      _defaultTriggerLabel(),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: 14,
            height: 20 / 14,
            color: _isPlaceholder ? rise.mutedForeground(0.65) : rise.defaultForeground,
          ) ??
          TextStyle(
            fontSize: 14,
            height: 20 / 14,
            color: _isPlaceholder ? rise.mutedForeground(0.65) : rise.defaultForeground,
          ),
    );

    if (widget.triggerValueBuilder != null) {
      return widget.triggerValueBuilder!(context, defaultChild: defaultChild, isPlaceholder: _isPlaceholder);
    }
    return Align(alignment: Alignment.centerLeft, child: defaultChild);
  }

  Color _baseFill(RiseThemeData rise, ThemeData theme) {
    return widget.variant == RiseSelectVariant.primary ? rise.surface : rise.surfaceSecondary;
  }

  Color _resolveFill(RiseThemeData rise, ThemeData theme) {
    final base = _baseFill(rise, theme);
    if (!widget.enabled) {
      return base.withValues(alpha: 0.65);
    }
    final expanded = _menuController.isOpen || _focusNode.hasFocus;
    if (_hovering && !expanded) {
      if (widget.variant == RiseSelectVariant.primary) {
        return Color.lerp(base, rise.muted, 0.22)!;
      }
      return Color.lerp(base, rise.resolveDefaultHover(), 0.28)!;
    }
    return base;
  }

  Color _borderColor(RiseThemeData rise) {
    if (!widget.enabled) {
      return rise.border.withValues(alpha: rise.disabledOpacity);
    }
    if (widget.isInvalid) {
      return rise.danger;
    }
    if (_menuController.isOpen || _focusNode.hasFocus) {
      return rise.accent;
    }
    return rise.border;
  }

  double _borderWidth(RiseThemeData rise) {
    if (!widget.enabled) return 1;
    if (widget.isInvalid) {
      return (_menuController.isOpen || _focusNode.hasFocus) ? 2 : 1.5;
    }
    if (_menuController.isOpen || _focusNode.hasFocus) return 2;
    return 1;
  }

  MenuStyle _menuStyle(RiseThemeData rise, ThemeData theme, double? menuWidth) {
    final base = MenuStyle(
      backgroundColor: WidgetStatePropertyAll(rise.overlay),
      elevation: const WidgetStatePropertyAll(10),
      shadowColor: WidgetStatePropertyAll(Colors.black.withValues(alpha: 0.14)),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RiseSelect._kPopoverRadius),
          side: BorderSide(color: rise.border.withValues(alpha: 0.38)),
        ),
      ),
      padding: const WidgetStatePropertyAll(RiseSelect._kMenuPadding),
    );
    if (menuWidth != null && menuWidth > 0 && menuWidth.isFinite) {
      return base.copyWith(
        fixedSize: WidgetStatePropertyAll(Size.fromWidth(menuWidth)),
      );
    }
    return base;
  }

  List<Widget> _buildMenuChildren() {
    final rise = context.riseTheme;
    final theme = Theme.of(context);
    final out = <Widget>[];
    String? lastSection;

    for (final item in widget.items) {
      if (item.sectionHeader != null && item.sectionHeader != lastSection) {
        lastSection = item.sectionHeader;
        out.add(
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 4),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                item.sectionHeader!,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: rise.mutedForeground(0.9),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      }

      if (widget.multiSelect) {
        final selected = widget.selectedValues!;
        final isOn = selected.contains(item.value);
        out.add(
          MenuItemButton(
            closeOnActivate: false,
            style: MenuItemButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              foregroundColor: rise.defaultForeground,
            ),
            onPressed: !widget.enabled || item.isDisabled
                ? null
                : () {
                    final next = List<T>.from(selected);
                    if (isOn) {
                      next.remove(item.value);
                    } else {
                      next.add(item.value);
                    }
                    widget.onValuesChanged!(next);
                  },
            trailingIcon: SizedBox(
              width: 22,
              child: isOn
                  ? Icon(Icons.check, size: 18, color: rise.accent)
                  : null,
            ),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(item.label, style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14)),
            ),
          ),
        );
      } else {
        out.add(
          MenuItemButton(
            style: MenuItemButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              foregroundColor: rise.defaultForeground,
            ),
            onPressed: !widget.enabled || item.isDisabled
                ? null
                : () {
                    widget.onChanged!(item.value);
                    _menuController.close();
                  },
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(item.label, style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14)),
            ),
          ),
        );
      }
    }
    return out;
  }

  Widget _buildMenuField(RiseThemeData rise, ThemeData theme) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final menuWidth =
            constraints.maxWidth.isFinite && constraints.maxWidth > 0 ? constraints.maxWidth : null;
        return MenuAnchor(
          controller: _menuController,
          consumeOutsideTap: true,
          childFocusNode: _focusNode,
          alignmentOffset: const Offset(0, 4),
          crossAxisUnconstrained: false,
          style: _menuStyle(rise, theme, menuWidth),
          onOpen: () => setState(() {}),
          onClose: () => setState(() {}),
          menuChildren: _buildMenuChildren(),
          builder: (context, controller, _) {
        final isOpen = controller.isOpen;
        final fill = _resolveFill(rise, theme);
        final borderSide = BorderSide(color: _borderColor(rise), width: _borderWidth(rise));
        final borderRadius = BorderRadius.circular(RiseSelect._kRadius);
        final indicator = Transform.rotate(
          angle: isOpen ? math.pi : 0,
          child: widget.indicatorIcon ??
              Icon(
                Icons.expand_more_rounded,
                size: 22,
                color: rise.mutedForeground(0.75),
              ),
        );

        Widget trigger = MouseRegion(
          onEnter: (_) => setState(() => _hovering = true),
          onExit: (_) => setState(() => _hovering = false),
          child: Material(
            color: fill,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
              side: borderSide,
            ),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              borderRadius: borderRadius,
              onTap: !widget.enabled
                  ? null
                  : () {
                      if (controller.isOpen) {
                        controller.close();
                      } else {
                        controller.open();
                      }
                    },
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: RiseSelect.kMinHeight),
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 12, end: 36, top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Expanded(child: _buildTriggerValue(rise, theme)),
                      indicator,
                    ],
                  ),
                ),
              ),
            ),
          ),
        );

        if (widget.variant == RiseSelectVariant.primary) {
          trigger = Material(
            color: Colors.transparent,
            elevation: widget.enabled ? 1 : 0,
            shadowColor: Colors.black.withValues(alpha: 0.08),
            surfaceTintColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
            child: trigger,
          );
        }

            return Theme(
              data: theme.copyWith(
                splashFactory: NoSplash.splashFactory,
                highlightColor: Colors.transparent,
              ),
              child: Semantics(
                button: true,
                expanded: isOpen,
                child: trigger,
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    assert(
      !widget.multiSelect ||
          (widget.selectedValues != null &&
              widget.onValuesChanged != null &&
              widget.onChanged == null &&
              widget.value == null),
      'RiseSelect.multi requires selectedValues and onValuesChanged',
    );
    assert(
      widget.multiSelect || (widget.onChanged != null),
      'Single RiseSelect requires onChanged',
    );

    final rise = context.riseTheme;
    final theme = Theme.of(context);

    final field = _buildMenuField(rise, theme);
    final sizedField = SizedBox(width: double.infinity, child: field);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          DefaultTextStyle.merge(
            style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: widget.isInvalid ? rise.danger : rise.defaultForeground,
                ) ??
                TextStyle(
                  fontWeight: FontWeight.w600,
                  color: widget.isInvalid ? rise.danger : rise.defaultForeground,
                ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                widget.label!,
                if (widget.isRequired) ...[
                  const SizedBox(width: 2),
                  Text('*', style: TextStyle(color: rise.danger)),
                ],
              ],
            ),
          ),
        if (widget.description != null && !widget.isInvalid) ...[
          const SizedBox(height: 4),
          DefaultTextStyle.merge(
            style: theme.textTheme.bodySmall?.copyWith(color: rise.mutedForeground()) ??
                TextStyle(color: rise.mutedForeground()),
            child: widget.description!,
          ),
        ],
        if (widget.label != null || widget.description != null) const SizedBox(height: 8),
        sizedField,
        if (widget.errorMessage != null && widget.isInvalid) ...[
          const SizedBox(height: 6),
          DefaultTextStyle.merge(
            style: theme.textTheme.bodySmall?.copyWith(color: rise.danger) ??
                TextStyle(color: rise.danger),
            child: widget.errorMessage!,
          ),
        ],
      ],
    );
  }
}
