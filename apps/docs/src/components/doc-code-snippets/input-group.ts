/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_input_group.dart`. */

export const inputGroupUsageCode = `RiseInputGroup(
  prefix: Icon(Icons.email_outlined),
  children: const [RiseInput(placeholder: 'name@email.com')],
)`;

export const inputGroupTextPrefixCode = `const RiseInputGroup(
  prefix: Text('https://'),
  children: [RiseInput(placeholder: 'example.com')],
)`;

export const inputGroupTextSuffixCode = `const RiseInputGroup(
  children: [RiseInput(placeholder: 'subdomain')],
  suffix: Text('.com'),
)`;

export const inputGroupIconPrefixTextSuffixCode = `RiseInputGroup(
  prefix: Icon(Icons.currency_exchange),
  suffix: const Text('USD'),
  children: const [RiseInput(placeholder: '0.00')],
)`;

export const inputGroupCopySuffixCode = `RiseInputGroup(
  children: [RiseInput(controller: controller)],
  suffix: IconButton(
    icon: const Icon(Icons.copy_outlined),
    onPressed: () => Clipboard.setData(ClipboardData(text: controller.text)),
  ),
)`;

export const inputGroupIconPrefixCopySuffixCode = `RiseInputGroup(
  prefix: Icon(Icons.language_outlined),
  children: [RiseInput(controller: controller)],
  suffix: IconButton(
    icon: const Icon(Icons.copy_outlined),
    onPressed: () => Clipboard.setData(ClipboardData(text: controller.text)),
  ),
)`;

export const inputGroupLoadingCode = `RiseInputGroup(
  children: const [RiseInput(placeholder: 'Search…')],
  suffix: busy
      ? RiseSpinner(size: RiseSpinnerSize.sm)
      : IconButton(icon: Icon(Icons.refresh_outlined), onPressed: onRefresh),
)`;

export const inputGroupKeyboardShortcutCode = `RiseInputGroup(
  children: const [RiseInput(placeholder: 'Quick command…')],
  suffix: Padding(
    padding: EdgeInsets.only(right: 8),
    child: /* ⌘K kbd pill */,
  ),
)`;

export const inputGroupBadgeSuffixCode = `RiseInputGroup(
  prefix: Icon(Icons.code_outlined),
  children: const [RiseInput(placeholder: 'feature/api-v2')],
  suffix: RiseChip(size: RiseChipSize.sm, child: Text('Beta')),
)`;

export const inputGroupRequiredFieldCode = `Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    RiseLabel.text('Project name', isRequired: true),
    RiseInputGroup(
      prefix: Icon(Icons.folder_outlined),
      children: [RiseInput(placeholder: 'my-app')],
    ),
  ],
)`;

export const inputGroupValidationCode = `Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    RiseInputGroup(
      isInvalid: invalid,
      children: [RiseInput(controller: c, onChanged: (_) => setState(() {}))],
    ),
    RiseFieldError(visible: invalid, child: Text('Use at least 3 characters.')),
  ],
)`;

export const inputGroupDisabledCode = `const RiseInputGroup(
  enabled: false,
  prefix: Icon(Icons.lock_outline),
  children: [RiseInput(placeholder: 'Read-only token')],
)`;

export const inputGroupWithSuffixCode = `RiseInputGroup(
  suffix: Icon(Icons.alternate_email),
  children: const [RiseInput(placeholder: 'Email address')],
)`;

export const inputGroupPrefixAndSuffixCode = `const RiseInputGroup(
  prefix: Text('\\$'),
  suffix: Text('USD'),
  children: [RiseInput(placeholder: 'Set a price')],
)`;

export const inputGroupPasswordToggleCode = `RiseInputGroup(
  suffix: IconButton(
    onPressed: () => setState(() => obscure = !obscure),
    icon: Icon(obscure ? Icons.visibility_off : Icons.visibility),
  ),
  children: [RiseInput(obscureText: obscure, placeholder: 'Password')],
)`;

export const inputGroupVariantsCode = `const RiseInputGroup(
  variant: RiseInputGroupVariant.secondary,
  prefix: Icon(Icons.email_outlined),
  children: [RiseInput(placeholder: 'Secondary variant')],
)`;

export const inputGroupFullWidthCode = `const RiseInputGroup(
  fullWidth: true,
  prefix: Icon(Icons.email_outlined),
  children: [RiseInput(placeholder: 'name@email.com')],
)`;

export const inputGroupInvalidCode = `const RiseInputGroup(
  isInvalid: true,
  prefix: Icon(Icons.email_outlined),
  children: [RiseInput(placeholder: 'Invalid email')],
)`;
