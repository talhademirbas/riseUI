import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// Vertical list with dividers (HeroUI [ListGroup](https://heroui.com/docs/native/components/list-group)).
class RiseListGroup extends StatelessWidget {
  const RiseListGroup({
    super.key,
    required this.children,
    this.padding = EdgeInsets.zero,
    this.borderRadius = 16,
    this.showDividers = true,
  });

  final List<Widget> children;

  final EdgeInsetsGeometry padding;

  final double borderRadius;

  final bool showDividers;

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);

    final items = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      if (i > 0 && showDividers) {
        items.add(Divider(height: 1, thickness: 1, color: rise.border.withValues(alpha: 0.45)));
      }
      items.add(children[i]);
    }

    return Material(
      color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.35),
      borderRadius: BorderRadius.circular(borderRadius),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: items,
        ),
      ),
    );
  }
}
