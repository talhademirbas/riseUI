/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_input.dart`. */

export const inputUsageCode = `const RiseInput(
  placeholder: 'Your name',
)`;

export const inputVariantsCode = `const RiseInput(
  fullWidth: true,
  variant: RiseInputVariant.secondary,
  placeholder: 'Secondary input',
)`;

export const inputTypesCode = `const RiseInput(
  keyboardType: TextInputType.emailAddress,
  placeholder: 'Email',
)`;

export const inputControlledCode = `RiseInput(
  controller: controller,
  onChanged: (_) => setState(() {}),
)`;

export const inputFullWidthCode = `const RiseInput(
  fullWidth: true,
  placeholder: 'Full width input',
)`;

export const inputOnSurfacesCode = `RiseSurface(
  variant: RiseSurfaceVariant.secondary,
  child: RiseInput(
    fullWidth: true,
    placeholder: 'Your name',
    variant: RiseInputVariant.primary,
  ),
)`;

export const inputInvalidCode = `const RiseInput(
  isInvalid: true,
  placeholder: 'Must be at least 3 characters',
)`;

export const inputDisabledCode = `const RiseInput(
  enabled: false,
  placeholder: 'Not editable',
)`;
