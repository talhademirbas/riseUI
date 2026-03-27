/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_select.dart`. */

export const selectUsageCode = `RiseSelect<String>(
  label: const Text('State'),
  placeholder: 'Select one',
  value: selected,
  items: states,
  onChanged: (v) => setState(() => selected = v),
)`;

export const selectWithDescriptionCode = `RiseSelect<String>(
  label: const Text('State'),
  description: const Text('Select your state of residence'),
  placeholder: 'Select one',
)`;

export const selectWithDisabledOptionsCode = `const RiseSelect<String>(
  label: Text('Animal'),
  items: [
    RiseSelectItem(value: 'dog', label: 'Dog'),
    RiseSelectItem(value: 'cat', label: 'Cat', isDisabled: true),
  ],
)`;

export const selectRequiredCode = `RiseSelect<String>(
  label: const Text('Country'),
  isRequired: true,
  isInvalid: selected == null,
  errorMessage: selected == null ? const Text('Please select a country') : null,
)`;

export const selectFullWidthCode = `const RiseSelect<String>(
  fullWidth: true,
  placeholder: 'Select one',
)`;

export const selectVariantsCode = `const RiseSelect<String>(
  variant: RiseSelectVariant.secondary,
  placeholder: 'Select one',
)`;

export const selectDisabledCode = `RiseSelect<String>(
  enabled: false,
  value: 'california',
  onChanged: (_) {},
)`;
