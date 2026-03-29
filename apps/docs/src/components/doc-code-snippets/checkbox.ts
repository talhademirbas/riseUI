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
  description: const Text('Shows indeterminate state'),
)`;

export const checkboxWithDescriptionCode = `RiseCheckbox(
  value: checked,
  onChanged: (v) => setState(() => checked = v ?? false),
  label: const Text('Accept terms and conditions'),
  description: const Text('I agree to the terms and privacy policy'),
)`;

export const checkboxInvalidCode = `RiseCheckbox(
  value: agreed,
  onChanged: (v) => setState(() => agreed = v ?? false),
  isInvalid: !agreed,
  label: const Text('I agree to the terms'),
  description: const Text('You must accept the terms to continue'),
)`;

export const checkboxVariantsCode = `RiseCheckbox(
  variant: RiseCheckboxVariant.secondary,
  value: checked,
  onChanged: (v) => setState(() => checked = v ?? false),
  label: const Text('Secondary checkbox'),
  description: const Text('Lower emphasis variant for use in surfaces'),
)`;

export const checkboxDisabledCode = `RiseCheckbox(
  value: false,
  onChanged: null,
  isDisabled: true,
  label: const Text('Feature'),
  description: const Text('This feature is coming soon'),
)`;

export const checkboxCustomIndicatorCode = `RiseCheckbox(
  value: liked,
  onChanged: (v) => setState(() => liked = v ?? false),
  label: const Text('Heart'),
  indicatorBuilder: (context, value, indeterminate) {
    if (value == true) return Icon(Icons.favorite, size: 14);
    return null;
  },
)`;

export const checkboxRenderPropsCode = `RiseCheckbox(
  value: accepted,
  onChanged: (v) => setState(() => accepted = v ?? false),
  label: Text(accepted ? 'Terms accepted' : 'Accept terms'),
  description: Text(accepted ? 'Thank you' : 'Please read the terms'),
)`;

export const checkboxSizesCode = `RiseCheckbox(
  size: RiseCheckboxSize.lg,
  value: on,
  onChanged: (v) => setState(() => on = v ?? false),
  label: const Text('Rounded checkbox'),
)`;

export const checkboxFeaturesCode = `RiseCheckbox(
  variant: RiseCheckboxVariant.secondary,
  value: emailOn,
  onChanged: (v) => setState(() => emailOn = v ?? false),
  label: const Text('Email Notifications'),
  description: const Text('Receive updates via email'),
)`;
