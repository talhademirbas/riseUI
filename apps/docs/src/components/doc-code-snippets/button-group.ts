/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_button_group.dart`. */

export const buttonGroupUsageCode = `RiseButtonGroup(
  variant: RiseButtonVariant.primary,
  children: [
    RiseButton(label: 'First', onPressed: () {}),
    RiseButton(
      onPressed: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          RiseButtonGroupSeparator(),
          Text('Second'),
        ],
      ),
    ),
    RiseButton(
      onPressed: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          RiseButtonGroupSeparator(),
          Text('Third'),
        ],
      ),
    ),
  ],
)`;

export const buttonGroupVariantsCode = `RiseButtonGroup(
  variant: RiseButtonVariant.outline,
  children: [
    RiseButton(label: 'First', onPressed: () {}),
    // … second & third with RiseButtonGroupSeparator
  ],
)`;

export const buttonGroupSizesCode = `RiseButtonGroup(
  size: RiseButtonSize.sm,
  variant: RiseButtonVariant.primary,
  children: [/* … */],
)`;

export const buttonGroupOrientationCode = `RiseButtonGroup(
  orientation: RiseButtonGroupOrientation.vertical,
  variant: RiseButtonVariant.outline,
  children: [/* … */],
)`;

export const buttonGroupWithIconsCode = `RiseButtonGroup(
  variant: RiseButtonVariant.outline,
  children: [
    RiseButton(isIconOnly: true, onPressed: () {}, child: Icon(Icons.search)),
    // …
  ],
)`;

export const buttonGroupFullWidthCode = `RiseButtonGroup(
  fullWidth: true,
  variant: RiseButtonVariant.outline,
  children: [/* … */],
)`;

export const buttonGroupDisabledCode = `RiseButtonGroup(
  isDisabled: true,
  children: [
    RiseButton(label: 'First', onPressed: () {}),
    RiseButton(
      allowEnabledWhenGroupDisabled: true,
      onPressed: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          RiseButtonGroupSeparator(),
          Text('Third (enabled)'),
        ],
      ),
    ),
  ],
)`;

export const buttonGroupWithoutSeparatorCode = `RiseButtonGroup(
  variant: RiseButtonVariant.outline,
  children: [
    RiseButton(label: 'First', onPressed: () {}),
    RiseButton(label: 'Second', onPressed: () {}),
    RiseButton(label: 'Third', onPressed: () {}),
  ],
)`;
