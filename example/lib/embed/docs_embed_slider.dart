import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

/// Slider demos for docs iframe (`?embed=slider-*`).
class DocsEmbedSlider {
  DocsEmbedSlider._();

  static Widget _wrap(Widget child) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kDocsEmbedMaxWidth),
        child: child,
      ),
    );
  }

  static Widget usage(BuildContext context) => _wrap(const _SliderUsageEmbed());

  static Widget vertical(BuildContext context) => _wrap(const _SliderVerticalEmbed());

  static Widget range(BuildContext context) => _wrap(const _SliderRangeEmbed());

  static Widget disabled(BuildContext context) => _wrap(const _SliderDisabledEmbed());

  static Widget customFormat(BuildContext context) => _wrap(const _SliderCustomFormatEmbed());
}

class _SliderUsageEmbed extends StatefulWidget {
  const _SliderUsageEmbed();

  @override
  State<_SliderUsageEmbed> createState() => _SliderUsageEmbedState();
}

class _SliderUsageEmbedState extends State<_SliderUsageEmbed> {
  double _v = 30;

  @override
  Widget build(BuildContext context) {
    return RiseSlider(
      value: _v,
      onChanged: (x) => setState(() => _v = x),
      label: const Text('Volume'),
    );
  }
}

class _SliderVerticalEmbed extends StatefulWidget {
  const _SliderVerticalEmbed();

  @override
  State<_SliderVerticalEmbed> createState() => _SliderVerticalEmbedState();
}

class _SliderVerticalEmbedState extends State<_SliderVerticalEmbed> {
  double _v = 30;

  @override
  Widget build(BuildContext context) {
    return RiseSlider(
      value: _v,
      onChanged: (x) => setState(() => _v = x),
      orientation: RiseSliderOrientation.vertical,
      label: const Text('Volume'),
    );
  }
}

class _SliderRangeEmbed extends StatefulWidget {
  const _SliderRangeEmbed();

  @override
  State<_SliderRangeEmbed> createState() => _SliderRangeEmbedState();
}

class _SliderRangeEmbedState extends State<_SliderRangeEmbed> {
  RangeValues _r = const RangeValues(100, 500);

  @override
  Widget build(BuildContext context) {
    return RiseRangeSlider(
      values: _r,
      min: 0,
      max: 1000,
      step: 50,
      onChanged: (v) => setState(() => _r = v),
      label: const Text('Price Range'),
    );
  }
}

class _SliderDisabledEmbed extends StatelessWidget {
  const _SliderDisabledEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseSlider(
      value: 30,
      onChanged: _noop,
      isDisabled: true,
      label: const Text('Volume'),
    );
  }
}

void _noop(double _) {}

class _SliderCustomFormatEmbed extends StatefulWidget {
  const _SliderCustomFormatEmbed();

  @override
  State<_SliderCustomFormatEmbed> createState() => _SliderCustomFormatEmbedState();
}

class _SliderCustomFormatEmbedState extends State<_SliderCustomFormatEmbed> {
  double _v = 60;
  RangeValues _r = const RangeValues(100, 500);

  @override
  Widget build(BuildContext context) {
    String usd(double n) => '\$${n.toStringAsFixed(2)}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RiseSlider(
          value: _v,
          max: 100,
          step: 1,
          onChanged: (x) => setState(() => _v = x),
          label: const Text('Price'),
          formatValue: usd,
        ),
        const SizedBox(height: 24),
        RiseRangeSlider(
          values: _r,
          min: 0,
          max: 1000,
          step: 50,
          onChanged: (v) => setState(() => _r = v),
          label: const Text('Price Range'),
          formatRange: (a, b) => '${usd(a)} – ${usd(b)}',
        ),
      ],
    );
  }
}
