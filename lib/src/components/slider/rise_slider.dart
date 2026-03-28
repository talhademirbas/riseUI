import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// Layout axis for [RiseSlider] / [RiseRangeSlider] (HeroUI `orientation`).
enum RiseSliderOrientation {
  /// Default: label row above a horizontal track.
  horizontal,

  /// Output on top, vertical track, label below (HeroUI vertical slider layout).
  vertical,
}

/// Single-thumb slider with optional label + value output row — aligned with
/// [HeroUI Slider](https://heroui.com/docs/react/components/slider) and
/// [slider.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/slider.css).
class RiseSlider extends StatelessWidget {
  const RiseSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 0,
    this.max = 100,
    this.step,
    this.divisions,
    this.onChangeEnd,
    this.isDisabled = false,
    this.orientation = RiseSliderOrientation.horizontal,
    this.label,
    this.showOutput = true,
    this.formatValue,
    this.valueIndicatorLabel,
    this.semanticFormatterCallback,
  });

  /// Current value (clamped to [min] / [max]).
  final double value;

  final ValueChanged<double> onChanged;

  /// HeroUI `minValue` (default `0`).
  final double min;

  /// HeroUI `maxValue` (default `100`).
  final double max;

  /// HeroUI `step`. When set, [divisions] is derived as `(max - min) / step` when integral.
  final double? step;

  /// Explicit division count (Material [Slider.divisions]). Overrides step-based divisions when set.
  final int? divisions;

  /// HeroUI `onChangeEnd`.
  final ValueChanged<double>? onChangeEnd;

  /// HeroUI `isDisabled`.
  final bool isDisabled;

  final RiseSliderOrientation orientation;

  /// Optional leading label (HeroUI `<Label />`).
  final Widget? label;

  /// Whether to show the value output on the top row (HeroUI `<Slider.Output />`).
  final bool showOutput;

  /// Formats the value for the output text. Defaults to a short numeric string from [step].
  final String Function(double value)? formatValue;

  /// Material [Slider.label] — tooltip while dragging.
  final String? valueIndicatorLabel;

  final SemanticFormatterCallback? semanticFormatterCallback;

  static int? _effectiveDivisions(double min, double max, double? step, int? divisions) {
    if (divisions != null) return divisions;
    return _divisionsFromStep(min, max, step);
  }

  static int? _divisionsFromStep(double min, double max, double? step) {
    if (step == null || step <= 0) return null;
    final span = max - min;
    final n = span / step;
    final rounded = n.round();
    if ((n - rounded).abs() > 1e-9) return null;
    return rounded;
  }

  static String _defaultFormat(double v, double? step) {
    if (step != null && step >= 1) {
      return v.round().toString();
    }
    if (step != null && step < 1) {
      final decimals = step.toString().split('.').last.length;
      return v.toStringAsFixed(decimals.clamp(0, 4));
    }
    return v == v.roundToDouble() ? v.round().toString() : v.toStringAsFixed(1);
  }

  /// Hero `text-sm font-medium` + `tabular-nums` on output.
  static TextStyle? _labelTextStyle(TextTheme textTheme, RiseThemeData rise) {
    return textTheme.labelLarge?.copyWith(
      fontSize: 14,
      height: 1.4,
      fontWeight: FontWeight.w500,
      color: rise.defaultForeground,
    );
  }

  static TextStyle? _outputTextStyle(TextTheme textTheme, RiseThemeData rise) {
    return textTheme.labelLarge?.copyWith(
      fontSize: 14,
      height: 1.4,
      fontWeight: FontWeight.w500,
      color: rise.defaultForeground,
      fontFeatures: const [FontFeature.tabularFigures()],
    );
  }

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final textTheme = Theme.of(context).textTheme;
    final labelStyle = _labelTextStyle(textTheme, rise);
    final outputStyle = _outputTextStyle(textTheme, rise);

    final effectiveDivisions = _effectiveDivisions(min, max, step, divisions);
    final clamped = value.clamp(min, max);
    final outputText = formatValue != null
        ? formatValue!(clamped)
        : _defaultFormat(clamped, step);

    final theme = RiseSlider._theme(rise);

    Widget slider = SliderTheme(
      data: theme,
      child: Slider(
        value: clamped,
        min: min,
        max: max,
        divisions: effectiveDivisions,
        label: valueIndicatorLabel,
        onChanged: isDisabled ? null : onChanged,
        onChangeEnd: isDisabled
            ? null
            : onChangeEnd != null
                ? (v) => onChangeEnd!(v)
                : null,
        semanticFormatterCallback: semanticFormatterCallback,
      ),
    );

    if (orientation == RiseSliderOrientation.vertical) {
      slider = RotatedBox(
        quarterTurns: 3,
        child: SizedBox(
          width: 200,
          height: 40,
          child: slider,
        ),
      );
    }

    if (orientation == RiseSliderOrientation.horizontal) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (label != null || showOutput)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (label != null)
                    Expanded(
                      child: DefaultTextStyle(
                        style: labelStyle ?? const TextStyle(),
                        child: label!,
                      ),
                    )
                  else
                    const Spacer(),
                  if (showOutput)
                    Text(outputText, style: outputStyle),
                ],
              ),
            ),
          slider,
        ],
      );
    }

    // Vertical: output, track, label (`slider.css` vertical grid, gap-2 between blocks).
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showOutput)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(outputText, textAlign: TextAlign.center, style: outputStyle),
          ),
        SizedBox(
          height: 200,
          width: 56,
          child: Center(child: slider),
        ),
        if (label != null) ...[
          const SizedBox(height: 8),
          DefaultTextStyle(
            style: labelStyle ?? const TextStyle(),
            textAlign: TextAlign.center,
            child: label!,
          ),
        ],
      ],
    );
  }

  static SliderThemeData _theme(RiseThemeData rise) {
    final disabled = rise.disabledOpacity;
    return SliderThemeData(
      trackHeight: 20,
      activeTrackColor: rise.accent,
      inactiveTrackColor: rise.muted,
      disabledActiveTrackColor: rise.muted.withValues(alpha: disabled),
      disabledInactiveTrackColor: rise.muted.withValues(alpha: disabled * 0.85),
      thumbColor: rise.accent,
      disabledThumbColor: rise.defaultForeground.withValues(alpha: 0.35),
      overlayColor: rise.accent.withValues(alpha: 0.12),
      thumbShape: _RiseHeroSliderThumbShape(rise: rise),
      rangeThumbShape: _RiseHeroRangeSliderThumbShape(rise: rise),
      trackShape: const RoundedRectSliderTrackShape(),
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 12),
      overlappingShapeStrokeColor: rise.surface,
    );
  }
}

/// Stacks multiple slider rows for example layouts.
class RiseSliderGroup extends StatelessWidget {
  const RiseSliderGroup({
    super.key,
    required this.children,
    this.orientation = Axis.vertical,
    this.spacing = 12,
  });

  final List<Widget> children;

  /// `vertical` (default) or `horizontal` scrollable row.
  final Axis orientation;

  final double spacing;

  @override
  Widget build(BuildContext context) {
    if (orientation == Axis.horizontal) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _withSpacing(children, spacing, horizontal: true),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: _withSpacing(children, spacing, horizontal: false),
    );
  }

  static List<Widget> _withSpacing(List<Widget> children, double gap, {required bool horizontal}) {
    if (children.isEmpty) return children;
    final out = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      if (i > 0) {
        out.add(horizontal ? SizedBox(width: gap) : SizedBox(height: gap));
      }
      out.add(children[i]);
    }
    return out;
  }
}

/// Range (two-thumb) slider with label + combined output — HeroUI range examples.
class RiseRangeSlider extends StatelessWidget {
  const RiseRangeSlider({
    super.key,
    required this.values,
    required this.onChanged,
    this.min = 0,
    this.max = 100,
    this.step,
    this.divisions,
    this.onChangeEnd,
    this.isDisabled = false,
    this.orientation = RiseSliderOrientation.horizontal,
    this.label,
    this.showOutput = true,
    this.formatRange,
    this.semanticFormatterCallback,
  });

  final RangeValues values;

  final ValueChanged<RangeValues> onChanged;

  final double min;

  final double max;

  final double? step;

  final int? divisions;

  final ValueChanged<RangeValues>? onChangeEnd;

  final bool isDisabled;

  final RiseSliderOrientation orientation;

  final Widget? label;

  final bool showOutput;

  /// Formats both ends, e.g. currency. Default: `"a – b"` with numeric formatting.
  final String Function(double start, double end)? formatRange;

  final SemanticFormatterCallback? semanticFormatterCallback;

  static int? _effectiveDivisions(double min, double max, double? step, int? divisions) {
    if (divisions != null) return divisions;
    return RiseSlider._divisionsFromStep(min, max, step);
  }

  static String _defaultPair(double a, double b, double? step) {
    final fa = RiseSlider._defaultFormat(a, step);
    final fb = RiseSlider._defaultFormat(b, step);
    return '$fa\u202f–\u202f$fb';
  }

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final textTheme = Theme.of(context).textTheme;
    final labelStyle = RiseSlider._labelTextStyle(textTheme, rise);
    final outputStyle = RiseSlider._outputTextStyle(textTheme, rise);

    final start = values.start.clamp(min, max);
    final end = values.end.clamp(min, max);
    final pair = values.start <= values.end ? RangeValues(start, end) : RangeValues(end, start);

    final effectiveDivisions = _effectiveDivisions(min, max, step, divisions);
    final outputText =
        formatRange != null ? formatRange!(pair.start, pair.end) : _defaultPair(pair.start, pair.end, step);

    final theme = RiseSlider._theme(rise);

    Widget range = SliderTheme(
      data: theme,
      child: RangeSlider(
        values: pair,
        min: min,
        max: max,
        divisions: effectiveDivisions,
        onChanged: isDisabled ? null : onChanged,
        onChangeEnd: isDisabled
            ? null
            : onChangeEnd != null
                ? (v) => onChangeEnd!(v)
                : null,
        semanticFormatterCallback: semanticFormatterCallback,
      ),
    );

    if (orientation == RiseSliderOrientation.vertical) {
      range = RotatedBox(
        quarterTurns: 3,
        child: SizedBox(
          width: 200,
          height: 40,
          child: range,
        ),
      );
    }

    if (orientation == RiseSliderOrientation.horizontal) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (label != null || showOutput)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (label != null)
                    Expanded(
                      child: DefaultTextStyle(
                        style: labelStyle ?? const TextStyle(),
                        child: label!,
                      ),
                    )
                  else
                    const Spacer(),
                  if (showOutput) Text(outputText, style: outputStyle),
                ],
              ),
            ),
          range,
        ],
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showOutput)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(outputText, textAlign: TextAlign.center, style: outputStyle),
          ),
        SizedBox(
          height: 200,
          width: 56,
          child: Center(child: range),
        ),
        if (label != null) ...[
          const SizedBox(height: 8),
          DefaultTextStyle(
            style: labelStyle ?? const TextStyle(),
            textAlign: TextAlign.center,
            child: label!,
          ),
        ],
      ],
    );
  }
}

/// Hero `slider__thumb`: outer accent capsule + inner `accent-foreground` pill (`::after`), shadow-field.
class _RiseHeroSliderThumbShape extends SliderComponentShape {
  const _RiseHeroSliderThumbShape({required this.rise});

  final RiseThemeData rise;

  static const double _outerW = 28;
  static const double _outerH = 20;
  static const double _innerW = 24;
  static const double _innerH = 16;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(_outerW, _outerH);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;
    final outerPaint = Paint()
      ..color = ColorTween(
        begin: sliderTheme.disabledThumbColor,
        end: sliderTheme.thumbColor,
      ).evaluate(enableAnimation)!;

    final outerR = RRect.fromRectAndRadius(
      Rect.fromCenter(center: center, width: _outerW, height: _outerH),
      Radius.circular(_outerH / 2),
    );
    canvas.drawRRect(outerR, outerPaint);

    final innerScale = 1.0 - 0.1 * activationAnimation.value;
    final innerColor = ColorTween(
      begin: rise.defaultForeground.withValues(alpha: 0.35),
      end: rise.accentForeground,
    ).evaluate(enableAnimation)!;

    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.scale(innerScale);
    canvas.translate(-center.dx, -center.dy);

    final innerR = RRect.fromRectAndRadius(
      Rect.fromCenter(center: center, width: _innerW, height: _innerH),
      Radius.circular(_innerH / 2),
    );
    final innerPath = Path()..addRRect(innerR);
    canvas.drawShadow(innerPath, Colors.black, 1.2, true);
    canvas.drawRRect(innerR, Paint()..color = innerColor);
    canvas.restore();
  }
}

/// Same thumb geometry for [RangeSlider] thumbs (HeroUI range track).
class _RiseHeroRangeSliderThumbShape extends RangeSliderThumbShape {
  const _RiseHeroRangeSliderThumbShape({required this.rise});

  final RiseThemeData rise;

  static const double _outerW = 28;
  static const double _outerH = 20;
  static const double _innerW = 24;
  static const double _innerH = 16;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(_outerW, _outerH);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    bool isDiscrete = false,
    bool isEnabled = false,
    bool? isOnTop,
    required SliderThemeData sliderTheme,
    TextDirection? textDirection,
    Thumb? thumb,
    bool? isPressed,
  }) {
    final Canvas canvas = context.canvas;
    final ColorTween colorTween = ColorTween(
      begin: sliderTheme.disabledThumbColor,
      end: sliderTheme.thumbColor,
    );
    final outerPaint = Paint()..color = colorTween.evaluate(enableAnimation)!;

    final outerR = RRect.fromRectAndRadius(
      Rect.fromCenter(center: center, width: _outerW, height: _outerH),
      Radius.circular(_outerH / 2),
    );

    canvas.drawRRect(outerR, outerPaint);
    if (isOnTop ?? false) {
      final stroke = Paint()
        ..color = sliderTheme.overlappingShapeStrokeColor ?? Colors.white
        ..strokeWidth = 1
        ..style = PaintingStyle.stroke;
      canvas.drawRRect(outerR, stroke);
    }

    final innerScale = 1.0 - 0.1 * activationAnimation.value;
    final innerColor = ColorTween(
      begin: rise.defaultForeground.withValues(alpha: 0.35),
      end: rise.accentForeground,
    ).evaluate(enableAnimation)!;

    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.scale(innerScale);
    canvas.translate(-center.dx, -center.dy);

    final innerR = RRect.fromRectAndRadius(
      Rect.fromCenter(center: center, width: _innerW, height: _innerH),
      Radius.circular(_innerH / 2),
    );
    final innerPath = Path()..addRRect(innerR);
    canvas.drawShadow(innerPath, Colors.black, (isPressed ?? false) ? 2.0 : 1.2, true);
    canvas.drawRRect(innerR, Paint()..color = innerColor);
    canvas.restore();
  }
}
