import 'package:flutter/material.dart';

import '../button/rise_button.dart';

/// Layout axis for [RiseButtonGroup] (HeroUI `orientation`).
enum RiseButtonGroupOrientation {
  horizontal,
  vertical,
}

/// Per-button data when nested in [RiseButtonGroup] (joined radii, shared variant, no press scale).
@immutable
class RiseButtonGroupSlotData extends InheritedWidget {
  const RiseButtonGroupSlotData({
    super.key,
    required this.index,
    required this.count,
    required this.orientation,
    required this.variant,
    required this.size,
    required this.groupDisabled,
    required this.groupFullWidth,
    required super.child,
  });

  final int index;
  final int count;
  final RiseButtonGroupOrientation orientation;
  final RiseButtonVariant variant;
  final RiseButtonSize size;
  final bool groupDisabled;

  /// Parent [RiseButtonGroup.fullWidth] — stretches each button in the group.
  final bool groupFullWidth;

  static RiseButtonGroupSlotData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<RiseButtonGroupSlotData>();
  }

  bool get isFirst => index == 0;

  bool get isLast => index == count - 1;

  bool get only => count == 1;

  @override
  bool updateShouldNotify(RiseButtonGroupSlotData oldWidget) {
    return index != oldWidget.index ||
        count != oldWidget.count ||
        orientation != oldWidget.orientation ||
        variant != oldWidget.variant ||
        size != oldWidget.size ||
        groupDisabled != oldWidget.groupDisabled ||
        groupFullWidth != oldWidget.groupFullWidth;
  }
}

/// Groups related [RiseButton]s with shared styling, zero gap, joined corners, and optional separators.
///
/// Aligned with [HeroUI ButtonGroup](https://heroui.com/docs/react/components/button-group) and
/// [button-group.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/button-group.css).
class RiseButtonGroup extends StatelessWidget {
  const RiseButtonGroup({
    super.key,
    required this.children,
    this.variant = RiseButtonVariant.primary,
    this.size = RiseButtonSize.md,
    this.orientation = RiseButtonGroupOrientation.horizontal,
    this.fullWidth = false,
    this.isDisabled = false,
  });

  final List<Widget> children;

  final RiseButtonVariant variant;

  final RiseButtonSize size;

  final RiseButtonGroupOrientation orientation;

  final bool fullWidth;

  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    assert(children.isNotEmpty, 'RiseButtonGroup requires at least one child');

    Widget rowOrCol;
    if (orientation == RiseButtonGroupOrientation.horizontal) {
      rowOrCol = Row(
        mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 0; i < children.length; i++)
            _slot(context, i, children[i]),
        ],
      );
    } else {
      rowOrCol = Column(
        mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 0; i < children.length; i++)
            _slot(context, i, children[i]),
        ],
      );
    }

    if (fullWidth) {
      rowOrCol = SizedBox(width: double.infinity, child: rowOrCol);
    }

    return rowOrCol;
  }

  Widget _slot(BuildContext context, int index, Widget child) {
    final slot = RiseButtonGroupSlotData(
      index: index,
      count: children.length,
      orientation: orientation,
      variant: variant,
      size: size,
      groupDisabled: isDisabled,
      groupFullWidth: fullWidth,
      child: child,
    );

    if (fullWidth && orientation == RiseButtonGroupOrientation.horizontal) {
      return Expanded(child: slot);
    }
    if (fullWidth && orientation == RiseButtonGroupOrientation.vertical) {
      return Expanded(child: slot);
    }
    return slot;
  }
}

/// Vertical or horizontal hairline between grouped buttons (HeroUI `ButtonGroup.Separator`).
///
/// Place as the first child in a [Row] inside [RiseButton] (after the first button, inside second+ buttons).
class RiseButtonGroupSeparator extends StatelessWidget {
  const RiseButtonGroupSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    final slot = RiseButtonGroupSlotData.maybeOf(context);
    final horizontal = slot?.orientation != RiseButtonGroupOrientation.vertical;
    final color = Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.15);

    if (horizontal) {
      return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: SizedBox(
          width: 1,
          height: 20,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: SizedBox(
        height: 1,
        width: 48,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
