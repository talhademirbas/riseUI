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

export const selectWithDisabledOptionsCode = `RiseSelect<String>(
  label: const Text('Animal'),
  items: const [
    RiseSelectItem(value: 'dog', label: 'Dog'),
    RiseSelectItem(value: 'kangaroo', label: 'Kangaroo', isDisabled: true),
  ],
)`;

export const selectRequiredCode = `Column(
  children: [
    RiseSelect<String>(label: const Text('State'), isRequired: true, ...),
    RiseSelect<String>(label: const Text('Country'), isRequired: true, ...),
    RiseButton(onPressed: submit, child: const Text('Submit')),
  ],
)`;

export const selectFullWidthCode = `RiseSelect<String>(
  label: const Text('State'),
  fullWidth: true,
  placeholder: 'Select one',
)`;

export const selectVariantsCode = `[RiseSelect<String>(variant: RiseSelectVariant.primary, ...),
  RiseSelect<String>(variant: RiseSelectVariant.secondary, ...)]`;

export const selectMultipleCode = `RiseSelect<String>.multi(
  label: const Text('Countries to visit'),
  selectedValues: selected,
  onValuesChanged: (v) => setState(() => selected = [...v]),
  items: countries,
)`;

export const selectSectionsCode = `RiseSelect<String>(
  items: [
    RiseSelectItem(value: 'us', label: 'United States', sectionHeader: 'North America'),
    RiseSelectItem(value: 'ca', label: 'Canada'),
  ],
)`;

export const selectCustomIndicatorCode = `RiseSelect<String>(
  indicatorIcon: const Icon(Icons.unfold_more, size: 20),
)`;

export const selectCustomValueCode = `RiseSelect<String>(
  triggerValueBuilder: (context, {required defaultChild, required isPlaceholder}) {
    if (isPlaceholder) return defaultChild;
    return Row(children: [RiseAvatar(...), Text(name)]);
  },
)`;

export const selectControlledCode = `RiseSelect<String>(
  value: stateId,
  onChanged: (v) => setState(() => stateId = v ?? stateId),
)`;

export const selectDisabledCode = `RiseSelect<String>(
  enabled: false,
  value: 'california',
  onChanged: (_) {},
)`;
