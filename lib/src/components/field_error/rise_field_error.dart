import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// Validation / error line under a field (HeroUI [FieldError](https://heroui.com/docs/native/components/field-error)).
class RiseFieldError extends StatelessWidget {
  const RiseFieldError({
    super.key,
    required this.child,
    this.style,
    this.textAlign,
    this.semanticLabel,
  });

  final Widget child;

  final TextStyle? style;

  final TextAlign? textAlign;

  /// Announced by screen readers (defaults to plain text if [child] is [Text]).
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);
    final base = theme.textTheme.bodySmall?.copyWith(
          color: rise.danger,
          fontWeight: FontWeight.w500,
          height: 1.4,
        ) ??
        TextStyle(color: rise.danger, fontWeight: FontWeight.w500, height: 1.4);

    Widget result = DefaultTextStyle.merge(
      style: base.merge(style),
      textAlign: textAlign,
      child: child,
    );

    final label = semanticLabel ?? _plainText(child);
    if (label != null) {
      result = Semantics(
        liveRegion: true,
        label: label,
        child: result,
      );
    }

    return result;
  }

  static String? _plainText(Widget widget) {
    if (widget is Text && widget.data != null) return widget.data;
    return null;
  }
}
