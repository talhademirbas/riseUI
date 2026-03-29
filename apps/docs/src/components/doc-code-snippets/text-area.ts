/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_text_area.dart`. */

export const textAreaUsageCode = `const RiseTextArea(
  fullWidth: true,
  placeholder: 'Type your message…',
  rows: 3,
  maxLines: 8,
)`;

export const textAreaControlledCode = `Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    RiseTextArea(
      fullWidth: true,
      controller: controller,
      rows: 3,
      maxLines: 6,
      maxLength: 280,
      onChanged: (_) => setState(() {}),
    ),
    Text('Characters: \${controller.text.length} / 280'),
  ],
)`;

export const textAreaRowsCode = `const Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    RiseTextArea(
      fullWidth: true,
      labelText: 'Short feedback',
      hintText: 'A few lines…',
      rows: 2,
      maxLines: 4,
    ),
    RiseTextArea(
      fullWidth: true,
      labelText: 'Detailed notes',
      rows: 5,
      maxLines: 10,
    ),
  ],
)`;

export const textAreaFullWidthCode = `const RiseTextArea(
  fullWidth: true,
  placeholder: 'Full width textarea',
  rows: 4,
  maxLines: 8,
)`;

export const textAreaVariantsCode = `const Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    RiseTextArea(
      fullWidth: true,
      variant: RiseTextAreaVariant.primary,
      placeholder: 'Primary — shadow-field',
      rows: 3,
      maxLines: 6,
    ),
    RiseTextArea(
      fullWidth: true,
      variant: RiseTextAreaVariant.secondary,
      placeholder: 'Secondary — shadow-none',
      rows: 3,
      maxLines: 6,
    ),
  ],
)`;

export const textAreaDisabledCode = `const RiseTextArea(
  fullWidth: true,
  enabled: false,
  placeholder: 'Not editable',
  rows: 3,
)`;

export const textAreaInvalidCode = `RiseTextArea(
  fullWidth: true,
  isInvalid: empty,
  errorText: empty ? 'This field is required' : null,
)`;
