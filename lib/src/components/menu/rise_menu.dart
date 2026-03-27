import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// Themed [MenuAnchor] helper (HeroUI [Menu](https://heroui.com/docs/native/components/menu)).
class RiseMenu extends StatelessWidget {
  const RiseMenu({
    super.key,
    required this.builder,
    required this.menuChildren,
    this.alignmentOffset = Offset.zero,
    this.consumeOutsideTap = true,
  });

  final MenuAnchorChildBuilder builder;

  final List<Widget> menuChildren;

  final Offset alignmentOffset;

  final bool consumeOutsideTap;

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);

    return MenuAnchor(
      alignmentOffset: alignmentOffset,
      consumeOutsideTap: consumeOutsideTap,
      style: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(theme.colorScheme.surface),
        elevation: const WidgetStatePropertyAll(8),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: BorderSide(color: rise.border.withValues(alpha: 0.4)),
          ),
        ),
        padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 8)),
      ),
      menuChildren: menuChildren,
      builder: builder,
    );
  }
}
