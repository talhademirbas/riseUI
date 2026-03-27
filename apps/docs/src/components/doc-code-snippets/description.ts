/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_description.dart`. */

export const descriptionUsageCode = `const RiseDescription(
  child: Text('Choose a username you will use across the product.'),
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
