/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_button.dart`. */

export const buttonUsageCode = `RiseButton(
  label: 'Click me',
  onPressed: () {},
)`;

export const buttonVariantsCode = `Wrap(
  spacing: 12,
  runSpacing: 12,
  children: [
    RiseButton(label: 'Primary', onPressed: () {}),
    RiseButton(variant: RiseButtonVariant.secondary, label: 'Secondary', onPressed: () {}),
    RiseButton(variant: RiseButtonVariant.tertiary, label: 'Tertiary', onPressed: () {}),
    RiseButton(variant: RiseButtonVariant.outline, label: 'Outline', onPressed: () {}),
    RiseButton(variant: RiseButtonVariant.ghost, label: 'Ghost', onPressed: () {}),
    RiseButton(variant: RiseButtonVariant.danger, label: 'Danger', onPressed: () {}),
    RiseButton(variant: RiseButtonVariant.dangerSoft, label: 'Danger soft', onPressed: () {}),
  ],
)`;

export const buttonWithIconsCode = `RiseButton(
  onPressed: () {},
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.search, size: 18),
      SizedBox(width: 8),
      Text('Search'),
    ],
  ),
)`;

export const buttonIconOnlyCode = `RiseButton(
  isIconOnly: true,
  onPressed: () {},
  child: Icon(Icons.more_horiz),
)`;

export const buttonLoadingCode = `RiseButton(
  isDisabled: true,
  onPressed: null,
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(strokeWidth: 2, color: accentForeground),
      ),
      SizedBox(width: 10),
      Text('Uploading…'),
    ],
  ),
)`;

export const buttonLoadingStateCode = `RiseButton(
  variant: RiseButtonVariant.outline,
  onPressed: () {},
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.attach_file, size: 18),
      SizedBox(width: 8),
      Text('Upload File'),
    ],
  ),
)`;

export const buttonSizesCode = `Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    RiseButton(size: RiseButtonSize.sm, label: 'Small', onPressed: () {}),
    SizedBox(width: 16),
    RiseButton(size: RiseButtonSize.md, label: 'Medium', onPressed: () {}),
    SizedBox(width: 16),
    RiseButton(size: RiseButtonSize.lg, label: 'Large', onPressed: () {}),
  ],
)`;

export const buttonFullWidthCode = `Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    RiseButton(fullWidth: true, label: 'Primary Button', onPressed: () {}),
    RiseButton(
      fullWidth: true,
      variant: RiseButtonVariant.outline,
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(Icons.add, size: 18), SizedBox(width: 8), Text('With Icon')],
      ),
    ),
  ],
)`;

export const buttonDisabledCode = `RiseButton(
  isDisabled: true,
  label: 'Primary',
  onPressed: () {},
)`;

export const buttonSocialButtonsCode = `Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    RiseButton(
      fullWidth: true,
      variant: RiseButtonVariant.outline,
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.g_mobiledata, size: 20),
          SizedBox(width: 10),
          Text('Sign in with Google'),
        ],
      ),
    ),
    SizedBox(height: 12),
    RiseButton(
      fullWidth: true,
      variant: RiseButtonVariant.outline,
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.code, size: 20),
          SizedBox(width: 10),
          Text('Sign in with GitHub'),
        ],
      ),
    ),
    SizedBox(height: 12),
    RiseButton(
      fullWidth: true,
      variant: RiseButtonVariant.outline,
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.apple, size: 20),
          SizedBox(width: 10),
          Text('Sign in with Apple'),
        ],
      ),
    ),
  ],
)`;

export const buttonCompoundLabelCode = `RiseButton(
  variant: RiseButtonVariant.secondary,
  onPressed: () {},
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.mail_outlined, size: 18),
      SizedBox(width: 8),
      RiseButtonLabel('Messages'),
      SizedBox(width: 6),
      Text(
        '12',
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: context.riseTheme.mutedForeground(0.85),
        ),
      ),
    ],
  ),
)`;
