import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// Form label (HeroUI [Label](https://github.com/heroui-inc/heroui/tree/v3/packages/react/src/components/label),
/// [label.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/label.css)).
///
/// Typography matches `.label`: `text-sm font-medium text-foreground` (14px / 500). Required fields append
/// a danger asterisk with `ml-0.5`-style spacing; disabled uses `status-disabled` opacity from
/// [RiseThemeData.disabledOpacity]; invalid matches `.label--invalid` (`text-danger`).
class RiseLabel extends StatelessWidget {
  const RiseLabel({
    super.key,
    required this.child,
    this.style,
    this.textAlign,
    this.isRequired = false,
    this.isDisabled = false,
    this.isInvalid = false,
    this.requiredIndicator,
    this.semanticsLabel,
  });

  /// Plain text convenience (sets [semanticsLabel] to [data] when [semanticsLabel] is omitted).
  RiseLabel.text(
    String data, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    bool isRequired = false,
    bool isDisabled = false,
    bool isInvalid = false,
    Widget? requiredIndicator,
    String? semanticsLabel,
  }) : this(
          key: key,
          style: style,
          textAlign: textAlign,
          isRequired: isRequired,
          isDisabled: isDisabled,
          isInvalid: isInvalid,
          requiredIndicator: requiredIndicator,
          semanticsLabel: semanticsLabel ?? data,
          child: Text(data),
        );

  final TextStyle? style;

  final TextAlign? textAlign;

  final Widget child;

  final bool isRequired;

  final bool isDisabled;

  final bool isInvalid;

  /// Replaces the default `*` after the label ([label.css] `after:content-['*']`).
  final Widget? requiredIndicator;

  /// Screen reader label (plain text); [RiseLabel.text] defaults this to the same string as [child].
  final String? semanticsLabel;

  static const double _kFontSize = 14;
  static const double _kLineHeight = 20 / 14;

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);

    final baseColor = isInvalid ? rise.danger : rise.defaultForeground;
    final base = theme.textTheme.bodyMedium?.copyWith(
          fontSize: _kFontSize,
          height: _kLineHeight,
          fontWeight: FontWeight.w500,
          color: baseColor,
        ) ??
        TextStyle(
          fontSize: _kFontSize,
          height: _kLineHeight,
          fontWeight: FontWeight.w500,
          color: baseColor,
        );

    final mergedBase = base.merge(style);

    final indicator =
        requiredIndicator ??
        Text('*', style: mergedBase.copyWith(color: rise.danger));

    final content = isRequired
        ? Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 2,
            children: [child, indicator],
          )
        : child;

    Widget result = DefaultTextStyle.merge(
      style: mergedBase,
      textAlign: textAlign,
      child: content,
    );

    if (isDisabled) {
      result = Opacity(
        opacity: rise.disabledOpacity,
        child: result,
      );
    }

    if (semanticsLabel != null) {
      final readerLabel = isRequired ? '${semanticsLabel!}, required' : semanticsLabel!;
      result = Semantics(
        label: readerLabel,
        child: ExcludeSemantics(
          child: result,
        ),
      );
    }

    return result;
  }
}
