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

export const labelWithDescriptionCode = `Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    RiseLabel.text('Birthday'),
    SizedBox(height: 4),
    RiseDescription.text('We use this for age-appropriate defaults.'),
  ],
)`;

export const labelRequiredInvalidCode = `RiseLabel.text(
  'Legal name',
  isRequired: true,
  isInvalid: true,
)`;

export const labelCustomIndicatorCode = `RiseLabel(
  isRequired: true,
  requiredIndicator: Text('(req)', style: TextStyle(color: rise.danger)),
  semanticsLabel: 'Invoice number',
  child: Text('Invoice number'),
)`;

export const labelControlFieldCode = `RiseControlField(
  label: RiseLabel.text('Company', isRequired: true),
  description: Text('This appears on invoices.'),
  control: RiseInput(hintText: 'Acme Inc.'),
)`;
