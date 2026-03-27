/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_text_area.dart`. */

export const textAreaUsageCode = `const RiseTextArea(
  placeholder: 'Type your message…',
  rows: 3,
  maxLines: 8,
)`;

export const textAreaControlledCode = `Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    RiseTextArea(
      controller: controller,
      rows: 3,
      maxLines: 6,
      maxLength: 280,
      onChanged: (_) => setState(() {}),
    ),
    const SizedBox(height: 8),
    Text('Characters: \${controller.text.length} / 280'),
  ],
)`;

export const textAreaRowsCode = `const Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    RiseTextArea(
      labelText: 'Short feedback',
      hintText: 'A few lines…',
      rows: 2,
      maxLines: 4,
    ),
    SizedBox(height: 12),
    RiseTextArea(
      labelText: 'Detailed notes',
      hintText: 'More room to write…',
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
      placeholder: 'Primary textarea',
      rows: 3,
      maxLines: 6,
    ),
    SizedBox(height: 10),
    RiseTextArea(
      fullWidth: true,
      variant: RiseTextAreaVariant.secondary,
      placeholder: 'Secondary textarea',
      rows: 3,
      maxLines: 6,
    ),
  ],
)`;
