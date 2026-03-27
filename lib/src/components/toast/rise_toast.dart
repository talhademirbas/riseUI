import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// Floating snack bar helper (HeroUI [Toast](https://heroui.com/docs/native/components/toast)).
abstract final class RiseToast {
  RiseToast._();

  static void show(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
    RiseToastVariant variant = RiseToastVariant.default_,
    SnackBarAction? action,
  }) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);

    final Color bg;
    final Color fg;
    switch (variant) {
      case RiseToastVariant.default_:
        bg = theme.colorScheme.inverseSurface;
        fg = theme.colorScheme.onInverseSurface;
      case RiseToastVariant.accent:
        bg = rise.accent;
        fg = rise.accentForeground;
      case RiseToastVariant.success:
        bg = rise.success;
        fg = rise.successForeground;
      case RiseToastVariant.warning:
        bg = rise.warning;
        fg = rise.warningForeground;
      case RiseToastVariant.danger:
        bg = rise.danger;
        fg = rise.dangerForeground;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: fg)),
        backgroundColor: bg,
        behavior: SnackBarBehavior.floating,
        duration: duration,
        action: action,
      ),
    );
  }
}

enum RiseToastVariant {
  default_,
  accent,
  success,
  warning,
  danger,
}
