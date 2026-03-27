/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_tag_group.dart`. */

export const tagGroupUsageCode = `RiseTagGroup<String>(
  values: ['news', 'travel', 'gaming'],
  labelBuilder: (v) => v,
  selected: selected,
  onChanged: (next) => setState(() => selected = next),
)`;

export const tagGroupSizesCode = `RiseTagGroup<String>(
  size: RiseTagSize.sm,
  values: ['news', 'travel', 'gaming'],
  labelBuilder: (v) => v,
  selected: selected,
  onChanged: (next) => setState(() => selected = next),
)`;

export const tagGroupVariantsCode = `RiseTagGroup<String>(
  variant: RiseTagVariant.surface,
  values: ['news', 'travel', 'gaming'],
  labelBuilder: (v) => v,
  selected: selected,
  onChanged: (next) => setState(() => selected = next),
)`;

export const tagGroupDisabledCode = `RiseTagGroup<String>(
  isDisabled: true,
  values: ['news', 'travel', 'gaming'],
  labelBuilder: (v) => v,
  selected: selected,
  onChanged: (_) {},
)

RiseTagGroup<String>(
  disabledKeys: {'travel'},
  values: ['news', 'travel', 'gaming'],
  labelBuilder: (v) => v,
  selected: selected,
  onChanged: (next) => setState(() => selected = next),
)`;

export const tagGroupSelectionModesCode = `RiseTagGroup<String>(
  selectionMode: RiseTagGroupSelectionMode.single,
  values: ['news', 'travel', 'gaming', 'shopping'],
  labelBuilder: (v) => v,
  selected: selected,
  onChanged: (next) => setState(() => selected = next),
)`;

export const tagGroupWithIconsCode = `RiseTagGroup<String>(
  leadingBuilder: (v) => Icon(Icons.article_outlined, size: 16),
  values: ['news', 'travel', 'gaming', 'shopping'],
  labelBuilder: (v) => v,
  selected: selected,
  onChanged: (next) => setState(() => selected = next),
)`;

export const tagGroupWithRemoveCode = `RiseTagGroup<String>(
  values: values,
  labelBuilder: (v) => v,
  selected: selected,
  onChanged: (next) => setState(() => selected = next),
  onRemove: (v) => setState(() => values.remove(v)),
)`;

export const tagGroupWithErrorCode = `RiseTagGroup<String>(
  label: 'Amenities',
  description: 'Select at least one category',
  errorMessage: selected.isEmpty ? 'Please select at least one' : null,
  values: ['laundry', 'fitness', 'parking'],
  labelBuilder: (v) => v,
  selected: selected,
  onChanged: (next) => setState(() => selected = next),
)`;
