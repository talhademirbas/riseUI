/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_radio.dart`. */

export const radioUsageCode = `RiseRadioGroup<String>(
  value: selected,
  onChanged: (v) => setState(() => selected = v),
  label: const Text('Plan selection'),
  options: const [
    RiseRadioOption(value: 'starter', label: Text('Starter')),
    RiseRadioOption(value: 'pro', label: Text('Pro')),
  ],
)`;

export const radioHorizontalCode = `RiseRadioGroup<String>(
  value: selected,
  onChanged: (v) => setState(() => selected = v),
  orientation: RiseRadioGroupOrientation.horizontal,
  options: options,
)`;

export const radioControlledCode = `RiseRadioGroup<String>(
  value: selected,
  onChanged: (v) => setState(() => selected = v),
  options: options,
)`;

export const radioDisabledCode = `const RiseRadioGroup<String>(
  value: 'pro',
  onChanged: _noopStringChange,
  isDisabled: true,
  options: options,
)`;

export const radioVariantsCode = `const RiseRadioGroup<String>(
  value: 'starter',
  onChanged: _noopStringChange,
  variant: RiseRadioGroupVariant.secondary,
  options: options,
)`;

export const radioInvalidCode = `RiseRadioGroup<String>(
  value: selected,
  onChanged: (v) => setState(() => selected = v),
  isRequired: true,
  isInvalid: selected == null,
  errorMessage: selected == null ? const Text('Please choose one option.') : null,
  options: options,
)`;
