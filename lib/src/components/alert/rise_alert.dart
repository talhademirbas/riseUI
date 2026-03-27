import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// Status tone (HeroUI [Alert](https://heroui.com/docs/react/components/alert) /
/// [alert.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/alert.css)).
enum RiseAlertStatus {
  default_,
  accent,
  success,
  warning,
  danger,
}

/// Inline alert with indicator, title, description, and optional actions
/// (composition similar to [alert.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/alert/alert.tsx)).
///
/// Uses a neutral surface card with **status-colored title and indicator**, matching HeroUI
/// `.alert--accent` / `.alert--success` etc.
class RiseAlert extends StatelessWidget {
  const RiseAlert({
    super.key,
    required this.title,
    this.description,
    this.status = RiseAlertStatus.default_,
    this.leading,
    this.showIndicator = true,
    this.actions,
    this.borderRadius = 24,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  });

  final Widget title;

  final Widget? description;

  final RiseAlertStatus status;

  /// Overrides the default status icon when non-null (HeroUI `Alert.Indicator` children).
  final Widget? leading;

  /// When false and [leading] is null, no leading icon is shown.
  final bool showIndicator;

  /// Trailing actions (e.g. buttons) shown under the text block.
  final List<Widget>? actions;

  final double borderRadius;

  final EdgeInsetsGeometry padding;

  IconData _defaultIcon() {
    return switch (status) {
      RiseAlertStatus.default_ => Icons.info_outline,
      RiseAlertStatus.accent => Icons.info_outline,
      RiseAlertStatus.success => Icons.check_circle_outline,
      RiseAlertStatus.warning => Icons.warning_amber_rounded,
      RiseAlertStatus.danger => Icons.error_outline,
    };
  }

  _AlertTokens _tokens(BuildContext context) {
    final rise = context.riseTheme;
    return switch (status) {
      RiseAlertStatus.default_ => _AlertTokens(
          titleColor: rise.defaultForeground,
          iconColor: rise.defaultForeground,
        ),
      RiseAlertStatus.accent => _AlertTokens(
          titleColor: rise.accent,
          iconColor: rise.accent,
        ),
      RiseAlertStatus.success => _AlertTokens(
          titleColor: rise.success,
          iconColor: rise.success,
        ),
      RiseAlertStatus.warning => _AlertTokens(
          titleColor: rise.warningForeground,
          iconColor: rise.warning,
        ),
      RiseAlertStatus.danger => _AlertTokens(
          titleColor: rise.danger,
          iconColor: rise.danger,
        ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);
    final t = _tokens(context);

    final titleStyle = theme.textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.w600,
          color: t.titleColor,
          height: 1.35,
        ) ??
        TextStyle(fontWeight: FontWeight.w600, color: t.titleColor, height: 1.35);

    final descStyle = theme.textTheme.bodySmall?.copyWith(
          color: rise.mutedForeground(0.8),
          height: 1.45,
        ) ??
        TextStyle(color: rise.mutedForeground(0.8), height: 1.45);

    Widget? indicator;
    if (leading != null) {
      indicator = Padding(
        padding: const EdgeInsets.all(4),
        child: IconTheme.merge(
          data: IconThemeData(color: t.iconColor, size: 22),
          child: leading!,
        ),
      );
    } else if (showIndicator) {
      indicator = Padding(
        padding: const EdgeInsets.all(4),
        child: Icon(
          _defaultIcon(),
          size: 22,
          color: t.iconColor,
        ),
      );
    }

    final actionChildren = actions;
    final hasActions = actionChildren != null && actionChildren.isNotEmpty;

    return Material(
      color: theme.colorScheme.surface,
      elevation: 1,
      shadowColor: Colors.black.withValues(alpha: 0.08),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: BorderSide(color: rise.border.withValues(alpha: 0.35)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (indicator != null) ...[
              indicator,
              const SizedBox(width: 16),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  DefaultTextStyle.merge(
                    style: titleStyle,
                    child: title,
                  ),
                  if (description != null) ...[
                    const SizedBox(height: 6),
                    DefaultTextStyle.merge(
                      style: descStyle,
                      child: description!,
                    ),
                  ],
                  if (hasActions) ...[
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: actionChildren,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AlertTokens {
  const _AlertTokens({
    required this.titleColor,
    required this.iconColor,
  });

  final Color titleColor;
  final Color iconColor;
}
