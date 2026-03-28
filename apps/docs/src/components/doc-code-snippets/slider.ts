/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_slider.dart`. */

export const sliderUsageCode = `RiseSlider(
  value: volume,
  onChanged: (v) => setState(() => volume = v),
  label: const Text('Volume'),
)`;

export const sliderVerticalCode = `RiseSlider(
  value: volume,
  onChanged: (v) => setState(() => volume = v),
  orientation: RiseSliderOrientation.vertical,
  label: const Text('Volume'),
)`;

export const sliderRangeCode = `RiseRangeSlider(
  values: range,
  min: 0,
  max: 1000,
  step: 50,
  onChanged: (v) => setState(() => range = v),
  label: const Text('Price Range'),
)`;

export const sliderDisabledCode = `RiseSlider(
  value: 30,
  onChanged: (_) {},
  isDisabled: true,
  label: const Text('Volume'),
)`;

export const sliderCustomFormatCode = `RiseSlider(
  value: price,
  max: 100,
  formatValue: (v) => '\\\$' + v.toStringAsFixed(2),
  onChanged: (v) => setState(() => price = v),
  label: const Text('Price'),
)`;
