/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_radio.dart`. */

export const radioUsageCode = `RiseRadioGroup<String>(
  value: selected,
  onChanged: (v) => setState(() => selected = v),
  label: const Text('Plan selection'),
  description: const Text('Choose the plan that suits you best'),
  options: plans,
)`;

export const radioHorizontalCode = `RiseRadioGroup<String>(
  value: selected,
  onChanged: (v) => setState(() => selected = v),
  orientation: RiseRadioGroupOrientation.horizontal,
  label: const Text('Subscription plan'),
  options: plans,
)`;

export const radioControlledCode = `RiseRadioGroup<String>(
  value: selected,
  onChanged: (v) => setState(() => selected = v),
  options: plans,
)`;

export const radioUncontrolledCode = `RiseRadioGroup<String>(
  value: lastChosen,
  onChanged: (v) => setState(() => lastChosen = v),
  options: plans,
)`;

export const radioValidationCode = `RiseRadioGroup<String>(
  value: selected,
  onChanged: (v) => setState(() => selected = v),
  isRequired: true,
  isInvalid: showError && selected == null,
  errorMessage: showError && selected == null ? Text('Please select a plan.') : null,
  options: plans,
)`;

export const radioDisabledCode = `RiseRadioGroup<String>(
  value: 'pro',
  onChanged: (_) {},
  isDisabled: true,
  label: const Text('Subscription plan'),
  description: const Text('Plan changes are temporarily paused.'),
  options: plans,
)`;

export const radioVariantsCode = `RiseRadioGroup<String>(
  value: 'a',
  onChanged: (_) {},
  variant: RiseRadioGroupVariant.secondary,
  options: options,
)`;

export const radioInvalidCode = `RiseRadioGroup<String>(
  value: selected,
  onChanged: (v) => setState(() => selected = v),
  isRequired: true,
  isInvalid: selected == null,
  errorMessage: selected == null ? Text('Please choose one option.') : null,
  options: options,
)`;

export const radioOnSurfaceCode = `RiseSurface(
  showShadow: true,
  child: RiseRadioGroup<String>(
    value: selected,
    onChanged: (v) => setState(() => selected = v),
    variant: RiseRadioGroupVariant.secondary,
    options: plans,
  ),
)`;
