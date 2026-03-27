/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_input.dart`. */

export const inputUsageCode = `const RiseInput(
  hintText: 'Enter your name',
)`;

export const inputTypesCode = `const RiseInput(
  keyboardType: TextInputType.emailAddress,
  hintText: 'Email',
)`;

export const inputControlledCode = `RiseInput(
  controller: controller,
  onChanged: (_) => setState(() {}),
)`;

export const inputFullWidthCode = `const RiseInput(
  fullWidth: true,
  hintText: 'Full width input',
)`;

export const inputVariantsCode = `const RiseInput(
  variant: RiseInputVariant.secondary,
  hintText: 'Secondary input',
)`;
