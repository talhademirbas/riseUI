import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// Styled dialog surface (HeroUI [Dialog](https://heroui.com/docs/native/components/dialog)).
class RiseDialog extends StatelessWidget {
  const RiseDialog({
    super.key,
    required this.child,
    this.title,
    this.actions,
    this.borderRadius = 20,
    this.insetPadding = const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
    this.contentPadding = const EdgeInsets.fromLTRB(20, 8, 20, 16),
  });

  final Widget child;

  final Widget? title;

  final List<Widget>? actions;

  final double borderRadius;

  final EdgeInsets insetPadding;

  final EdgeInsets contentPadding;

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);

    return Dialog(
      insetPadding: insetPadding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: BorderSide(color: rise.border.withValues(alpha: 0.35)),
      ),
      backgroundColor: theme.colorScheme.surface,
      child: Padding(
        padding: contentPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (title != null) ...[
              DefaultTextStyle.merge(
                style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: rise.defaultForeground,
                    ) ??
                    TextStyle(
                      fontWeight: FontWeight.w700,
                      color: rise.defaultForeground,
                    ),
                child: title!,
              ),
              const SizedBox(height: 12),
            ],
            SingleChildScrollView(child: child),
            if (actions != null && actions!.isNotEmpty) ...[
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: _spaced(actions!),
              ),
            ],
          ],
        ),
      ),
    );
  }

  List<Widget> _spaced(List<Widget> actions) {
    if (actions.length <= 1) return actions;
    return [
      for (var i = 0; i < actions.length; i++) ...[
        if (i > 0) const SizedBox(width: 8),
        actions[i],
      ],
    ];
  }
}

/// Shows a [RiseDialog] with optional title and actions.
Future<T?> showRiseDialog<T>({
  required BuildContext context,
  required Widget child,
  Widget? title,
  List<Widget>? actions,
  bool barrierDismissible = true,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (ctx) => RiseDialog(
      title: title,
      actions: actions,
      child: child,
    ),
  );
}
