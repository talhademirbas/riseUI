/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_label.dart`. */

export const labelUsageCode = `RiseLabel.text('Display name')`;

export const labelRequiredCode = `RiseLabel.text(
  'Email',
  isRequired: true,
)`;

export const labelDisabledCode = `RiseLabel.text(
  'Account ID',
  isDisabled: true,
)`;

export const labelInvalidCode = `RiseLabel.text(
  'Password',
  isInvalid: true,
)`;

export const labelWithInputCode = `Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    RiseLabel.text('Username'),
    SizedBox(height: 6),
    RiseInput(hintText: 'jane.doe'),
  ],
)`;
