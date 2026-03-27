/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_label.dart`. */

export const labelUsageCode = `const RiseLabel(
  child: Text('Email'),
)`;

export const labelRequiredCode = `const RiseLabel(
  isRequired: true,
  child: Text('Password'),
)`;

export const labelDisabledCode = `const RiseLabel(
  isDisabled: true,
  child: Text('Username'),
)`;

export const labelInvalidCode = `const RiseLabel(
  isInvalid: true,
  child: Text('Email'),
)`;

export const labelWithInputCode = `const Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    RiseLabel(isRequired: true, child: Text('Email address')),
    SizedBox(height: 6),
    RiseInput(hintText: 'name@example.com', fullWidth: true),
  ],
)`;
