/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_input_group.dart`. */

export const inputGroupUsageCode = `RiseInputGroup(
  prefix: Icon(Icons.email_outlined),
  children: const [RiseInput(hintText: 'Email address')],
)`;

export const inputGroupWithSuffixCode = `RiseInputGroup(
  suffix: Icon(Icons.alternate_email),
  children: const [RiseInput(hintText: 'Email address')],
)`;

export const inputGroupPrefixAndSuffixCode = `const RiseInputGroup(
  prefix: Text('\\$'),
  suffix: Text('USD'),
  children: [RiseInput(hintText: 'Set a price')],
)`;

export const inputGroupPasswordToggleCode = `RiseInputGroup(
  suffix: IconButton(
    onPressed: () => setState(() => obscure = !obscure),
    icon: Icon(obscure ? Icons.visibility_off : Icons.visibility),
  ),
  children: [RiseInput(obscureText: obscure, hintText: 'Password')],
)`;

export const inputGroupVariantsCode = `const RiseInputGroup(
  variant: RiseInputGroupVariant.secondary,
  prefix: Icon(Icons.email_outlined),
  children: [RiseInput(hintText: 'Secondary variant')],
)`;

export const inputGroupFullWidthCode = `const RiseInputGroup(
  fullWidth: true,
  prefix: Icon(Icons.link_outlined),
  children: [RiseInput(hintText: 'https://example.com')],
)`;
