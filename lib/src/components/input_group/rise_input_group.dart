import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// Visual variant aligned with HeroUI InputGroup (`primary` / `secondary`).
enum RiseInputGroupVariant {
  primary,
  secondary,
}

/// Horizontal row of inputs with shared border (HeroUI [InputGroup](https://heroui.com/docs/native/components/input-group)).
class RiseInputGroup extends StatelessWidget {
  const RiseInputGroup({
    super.key,
    required this.children,
    this.prefix,
    this.suffix,
    this.leading,
    this.trailing,
    this.variant = RiseInputGroupVariant.primary,
    this.fullWidth = false,
    this.borderRadius = 14,
  }) : assert(prefix == null || leading == null, 'Use either prefix or leading, not both.'),
       assert(suffix == null || trailing == null, 'Use either suffix or trailing, not both.');

  final List<Widget> children;

  /// Preferred HeroUI naming.
  final Widget? prefix;

  /// Preferred HeroUI naming.
  final Widget? suffix;

  /// Backward-compatible alias for [prefix].
  final Widget? leading;

  /// Backward-compatible alias for [suffix].
  final Widget? trailing;

  final RiseInputGroupVariant variant;

  final bool fullWidth;

  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);
    final resolvedPrefix = prefix ?? leading;
    final resolvedSuffix = suffix ?? trailing;

    final row = <Widget>[];
    if (resolvedPrefix != null) {
      row.add(Padding(padding: const EdgeInsets.only(left: 12, right: 4), child: resolvedPrefix));
    }
    for (var i = 0; i < children.length; i++) {
      if (i > 0) {
        row.add(Container(width: 1, height: 28, color: rise.border.withValues(alpha: 0.45)));
      }
      row.add(Expanded(child: children[i]));
    }
    if (resolvedSuffix != null) {
      row.add(Padding(padding: const EdgeInsets.only(left: 4, right: 12), child: resolvedSuffix));
    }

    final bg = variant == RiseInputGroupVariant.primary
        ? theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.35)
        : rise.muted;
    final group = Material(
      color: bg,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: BorderSide(color: rise.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: row,
      ),
    );
    if (fullWidth) return SizedBox(width: double.infinity, child: group);
    return group;
  }
}
