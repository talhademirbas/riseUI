import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';
import '../close_button/rise_close_button.dart';
import '../surface/rise_surface.dart';

/// Status tone ([alert.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/alert.css)
/// `.alert--default` / `.alert--accent` / …).
enum RiseAlertStatus {
  default_,
  accent,
  success,
  warning,
  danger,
}

/// Inline alert with indicator, title, description, optional actions, and optional dismiss
/// ([alert.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/alert/alert.tsx),
/// [alert.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/alert.css)).
///
/// Visual parity:
/// - `flex` row, `items-start`, `gap-4` (16px), `rounded-3xl`, `bg-surface`, `px-4` `py-3`, `shadow-surface`
/// - `.alert__indicator` — `p-1`, icon `size-4` (16px)
/// - `.alert__title` — `text-sm` / `leading-6` / `font-medium`, status-colored
/// - `.alert__description` — `text-sm` `text-muted`
class RiseAlert extends StatelessWidget {
  const RiseAlert({
    super.key,
    required this.title,
    this.description,
    this.status = RiseAlertStatus.default_,
    this.leading,
    this.showIndicator = true,
    this.actions,
    this.onClose,
    this.borderRadius = 24,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  });

  /// HeroUI `[data-slot="alert-default-icon"]` / `size-4`.
  static const double iconSize = 16;

  /// `gap-4` between indicator and text block.
  static const double rowGap = 16;

  /// `gap-1` between title and description (when both exist).
  static const double titleDescriptionGap = 4;

  final Widget title;

  final Widget? description;

  final RiseAlertStatus status;

  /// Overrides the default status icon when non-null (HeroUI `Alert.Indicator` children).
  final Widget? leading;

  /// When false and [leading] is null, no leading icon is shown.
  final bool showIndicator;

  /// Trailing actions (e.g. buttons) below the text block.
  final List<Widget>? actions;

  /// When non-null, a [RiseCloseButton] is shown (HeroUI stories with `CloseButton`).
  final VoidCallback? onClose;

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
          titleColor: rise.warning,
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
    final t = _tokens(context);

    final titleStyle = TextStyle(
      fontSize: 14,
      height: 24 / 14,
      fontWeight: FontWeight.w500,
      color: t.titleColor,
    );

    final descStyle = TextStyle(
      fontSize: 14,
      height: 20 / 14,
      color: rise.mutedForeground(),
    );

    Widget? indicator;
    if (leading != null) {
      indicator = Padding(
        padding: const EdgeInsets.all(4),
        child: IconTheme.merge(
          data: IconThemeData(color: t.iconColor, size: iconSize),
          child: leading!,
        ),
      );
    } else if (showIndicator) {
      indicator = Padding(
        padding: const EdgeInsets.all(4),
        child: Icon(
          _defaultIcon(),
          size: iconSize,
          color: t.iconColor,
        ),
      );
    }

    final actionChildren = actions;
    final hasActions = actionChildren != null && actionChildren.isNotEmpty;

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: RiseSurface(
        variant: RiseSurfaceVariant.default_,
        padding: padding,
        borderRadius: borderRadius,
        showShadow: true,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (indicator != null) ...[
              indicator,
              const SizedBox(width: rowGap),
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
                    const SizedBox(height: titleDescriptionGap),
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
            if (onClose != null) ...[
              const SizedBox(width: 8),
              RiseCloseButton(onPressed: onClose!),
            ],
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
