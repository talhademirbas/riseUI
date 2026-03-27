import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// Modal bottom sheet with rounded top and Rise border (HeroUI [BottomSheet](https://heroui.com/docs/native/components/bottom-sheet)).
class RiseBottomSheet extends StatelessWidget {
  const RiseBottomSheet({
    super.key,
    required this.child,
    this.title,
    this.showDragHandle = true,
    this.borderRadius = 20,
    this.padding = const EdgeInsets.fromLTRB(20, 8, 20, 24),
  });

  final Widget child;

  final Widget? title;

  final bool showDragHandle;

  final double borderRadius;

  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);

    return Material(
      color: theme.colorScheme.surface,
      borderRadius: BorderRadius.vertical(top: Radius.circular(borderRadius)),
      clipBehavior: Clip.antiAlias,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: padding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (showDragHandle)
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: rise.border.withValues(alpha: 0.65),
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                ),
              if (title != null) ...[
                DefaultTextStyle.merge(
                  style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: rise.defaultForeground,
                      ) ??
                      TextStyle(fontWeight: FontWeight.w700, color: rise.defaultForeground),
                  child: title!,
                ),
                const SizedBox(height: 12),
              ],
              child,
            ],
          ),
        ),
      ),
    );
  }
}

/// Presents [RiseBottomSheet] via [showModalBottomSheet].
Future<T?> showRiseModalBottomSheet<T>({
  required BuildContext context,
  required Widget child,
  Widget? title,
  bool showDragHandle = true,
  bool isDismissible = true,
  bool enableDrag = true,
}) {
  final rise = context.riseTheme;
  return showModalBottomSheet<T>(
    context: context,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    showDragHandle: false,
    backgroundColor: Colors.transparent,
    barrierColor: rise.defaultForeground.withValues(alpha: 0.35),
    builder: (ctx) => Padding(
      padding: EdgeInsets.only(top: MediaQuery.paddingOf(ctx).top > 0 ? 8 : 0),
      child: RiseBottomSheet(
        title: title,
        showDragHandle: showDragHandle,
        child: child,
      ),
    ),
  );
}
