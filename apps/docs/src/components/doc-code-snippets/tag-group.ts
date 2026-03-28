/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_tag_group.dart`. */

export const tagGroupUsageCode = `RiseTagGroup<String>(
  selectionMode: RiseTagGroupSelectionMode.single,
  values: ['news', 'travel', 'gaming', 'shopping'],
  leadingBuilder: (v) => Icon(/* article · planet · rocket · bag */, size: 16),
  labelBuilder: (v) => capitalize(v),
  selected: selected,
  onChanged: (next) => setState(() => selected = next),
)`;

export const tagGroupSizesCode = `RiseTagGroup<String>(
  selectionMode: RiseTagGroupSelectionMode.single,
  size: RiseTagSize.sm,
  values: ['news', 'travel', 'gaming'],
  labelBuilder: (v) => capitalize(v),
  selected: selected,
  onChanged: (next) => setState(() => selected = next),
)`;

export const tagGroupVariantsCode = `RiseTagGroup<String>(
  selectionMode: RiseTagGroupSelectionMode.single,
  variant: RiseTagVariant.surface,
  values: ['news', 'travel', 'gaming'],
  labelBuilder: (v) => capitalize(v),
  selected: selected,
  onChanged: (next) => setState(() => selected = next),
)`;

export const tagGroupDisabledCode = `RiseTagGroup<String>(
  disabledKeys: {'news', 'gaming'},
  values: ['news', 'travel', 'gaming'],
  labelBuilder: (v) => capitalize(v),
  selected: selected,
  description: 'Some tags are disabled',
  onChanged: (next) => setState(() => selected = next),
)

RiseTagGroup<String>(
  disabledKeys: {'travel'},
  values: ['news', 'travel', 'gaming'],
  labelBuilder: (v) => capitalize(v),
  selected: selectedB,
  description: 'Tags disabled via disabledKeys prop',
  onChanged: (next) => setState(() => selectedB = next),
)`;

export const tagGroupSelectionModesCode = `RiseTagGroup<String>(
  selectionMode: RiseTagGroupSelectionMode.single,
  values: ['news', 'travel', 'gaming', 'shopping'],
  labelBuilder: (v) => capitalize(v),
  selected: selected,
  onChanged: (next) => setState(() => selected = next),
)`;

export const tagGroupControlledCode = `RiseTagGroup<String>(
  selectionMode: RiseTagGroupSelectionMode.multiple,
  label: 'Categories (controlled)',
  values: ['news', 'travel', 'gaming', 'shopping'],
  labelBuilder: (v) => capitalize(v),
  selected: selected,
  onChanged: (next) => setState(() => selected = next),
)`;

export const tagGroupWithIconsCode = `RiseTagGroup<String>(
  selectionMode: RiseTagGroupSelectionMode.single,
  leadingBuilder: (v) => Icon(iconFor(v), size: 16),
  values: ['news', 'travel', 'gaming', 'shopping'],
  labelBuilder: (v) => capitalize(v),
  selected: selected,
  description: 'Tags with icons',
  onChanged: (next) => setState(() => selected = next),
)`;

export const tagGroupWithRemoveCode = `RiseTagGroup<String>(
  values: values,
  labelBuilder: (v) => capitalize(v),
  selected: selected,
  onChanged: (next) => setState(() => selected = next),
  onRemove: (v) => setState(() => values.remove(v)),
)`;

export const tagGroupWithErrorCode = `RiseTagGroup<String>(
  label: 'Amenities',
  description: invalid ? 'Select at least one category' : 'Selected: …',
  errorMessage: invalid ? 'Please select at least one category' : null,
  values: ['laundry', 'fitness', 'parking'],
  labelBuilder: (v) => capitalize(v),
  selected: selected,
  onChanged: (next) => setState(() => selected = next),
)`;

export const tagGroupWithListDataCode = `RiseTagGroup<String>(
  label: 'Team Members',
  selectionMode: RiseTagGroupSelectionMode.multiple,
  values: ids,
  leadingBuilder: (id) => RiseAvatar(
    size: RiseAvatarSize.sm,
    image: NetworkImage(avatarUrlFor(id)),
    name: nameFor(id),
  ),
  labelBuilder: (id) => nameFor(id),
  selected: selected,
  description: 'Select team members for your project',
  onChanged: (next) => setState(() => selected = next),
  onRemove: (id) => setState(() => removeUser(id)),
)`;
