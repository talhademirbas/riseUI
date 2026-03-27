/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_checkbox.dart`. */

export const checkboxUsageCode = `RiseCheckbox(
  value: checked,
  onChanged: (v) => setState(() => checked = v ?? false),
  label: const Text('Accept terms and conditions'),
)`;

export const checkboxControlledCode = `RiseCheckbox(
  value: enabled,
  onChanged: (v) => setState(() => enabled = v ?? false),
  label: const Text('Email notifications'),
)`;

export const checkboxIndeterminateCode = `RiseCheckbox(
  tristate: true,
  value: value,
  onChanged: (v) => setState(() => value = v),
  label: const Text('Select all'),
  description: const Text('Shows indeterminate state (dash icon)'),
)`;

export const checkboxWithDescriptionCode = `RiseCheckbox(
  value: checked,
  onChanged: (v) => setState(() => checked = v ?? false),
  label: const Text('Email notifications'),
  description: const Text('Get notified when someone mentions you in a comment'),
)`;

export const checkboxInvalidCode = `RiseCheckbox(
  value: agreed,
  onChanged: (v) => setState(() => agreed = v ?? false),
  isInvalid: !agreed,
  label: const Text('I agree to the terms'),
)`;

export const checkboxVariantsCode = `RiseCheckbox(
  variant: RiseCheckboxVariant.secondary,
  value: checked,
  onChanged: (v) => setState(() => checked = v ?? false),
  label: const Text('Secondary checkbox'),
)`;

export const checkboxDisabledCode = `RiseCheckbox(
  value: false,
  onChanged: (_) {},
  isDisabled: true,
  label: const Text('Premium feature'),
)`;
