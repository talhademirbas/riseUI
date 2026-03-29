/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_description.dart`. */

export const descriptionUsageCode = `const RiseDescription(
  child: Text('Helper text under a label or field.'),
)`;

export const descriptionWithFormFieldCode = `Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    RiseLabel.text('Nickname'),
    SizedBox(height: 4),
    RiseDescription(
      child: Text('Visible to other users on your profile.'),
    ),
    SizedBox(height: 8),
    RiseInput(hintText: 'friendly-fox'),
  ],
)`;

export const descriptionWithTextFieldCode = `const RiseTextField(
  labelText: 'Bio',
  placeholder: 'Tell us about yourself',
  helperText: 'A short paragraph is enough.',
)`;

export const descriptionLongWrapCode = `SizedBox(
  width: 220,
  child: RiseDescription.text(
    'https://example.com/very/long/path/that/wraps/',
  ),
)`;
