/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_text_field.dart`. */

export const textFieldUsageCode = `const RiseTextField(
  keyboardType: TextInputType.emailAddress,
  labelText: 'Email',
  placeholder: 'Enter your email',
)`;

export const textFieldWithDescriptionCode = `const RiseTextField(
  labelText: 'Username',
  placeholder: 'juliam_example',
  helperText: 'Choose a unique username for your account.',
)`;

export const textFieldRequiredCode = `const RiseTextField(
  isRequired: true,
  labelText: 'Full name',
  helperText: 'This field is required.',
)`;

export const textFieldValidationCode = `RiseTextField(
  controller: controller,
  labelText: 'Bio',
  minLines: 2,
  maxLines: 4,
  isInvalid: invalid,
  errorText: invalid ? 'Minimum 20 characters required.' : null,
  helperText: invalid ? null : 'Minimum 20 characters (\${text.length}/20).',
  onChanged: (_) => setState(() {}),
)`;

export const textFieldControlledCode = `Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    RiseTextField(
      controller: nameController,
      labelText: 'Display name',
      onChanged: (_) => setState(() {}),
    ),
    Text('Characters: \${nameController.text.length}'),
    RiseTextField(
      controller: bioController,
      labelText: 'Bio',
      minLines: 2,
      maxLines: 5,
      maxLength: 200,
      onChanged: (_) => setState(() {}),
    ),
    Text('Characters: \${bioController.text.length} / 200'),
  ],
)`;

export const textFieldErrorMessageCode = `const RiseTextField(
  keyboardType: TextInputType.emailAddress,
  labelText: 'Email',
  placeholder: 'you@example.com',
  isInvalid: true,
  errorText: 'Please enter a valid email address.',
)`;

export const textFieldDisabledCode = `const RiseTextField(
  labelText: 'Account ID',
  hintText: 'acct_01H…',
  helperText: 'This field cannot be edited.',
  enabled: false,
)`;

export const textFieldMultilineCode = `const RiseTextField(
  labelText: 'Message',
  placeholder: 'How can we help?',
  helperText: 'Maximum 500 characters.',
  minLines: 3,
  maxLines: 6,
  maxLength: 500,
)`;

export const textFieldInputTypesCode = `Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const RiseTextField(
      labelText: 'Password',
      obscureText: true,
      placeholder: '••••••••',
    ),
    RiseTextField(
      labelText: 'Age',
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      placeholder: '25',
    ),
    const RiseTextField(
      labelText: 'Email',
      keyboardType: TextInputType.emailAddress,
      placeholder: 'name@domain.com',
    ),
  ],
)`;

export const textFieldFullWidthCode = `const Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    RiseTextField(
      fullWidth: true,
      labelText: 'Your name',
      placeholder: 'Ada Lovelace',
    ),
    RiseTextField(
      fullWidth: true,
      labelText: 'Password',
      obscureText: true,
      helperText: 'Password must be longer than 8 characters.',
      placeholder: '••••••••',
    ),
  ],
)`;

export const textFieldInSurfaceCode = `const RiseSurface(
  variant: RiseSurfaceVariant.secondary,
  padding: EdgeInsets.all(24),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      RiseTextField(
        fullWidth: true,
        variant: RiseTextFieldVariant.secondary,
        labelText: 'Your name',
        helperText: "We'll never share this with anyone else.",
        placeholder: 'Jane Doe',
      ),
      RiseTextField(
        fullWidth: true,
        variant: RiseTextFieldVariant.secondary,
        labelText: 'Email',
        keyboardType: TextInputType.emailAddress,
        placeholder: 'you@example.com',
      ),
      RiseTextField(
        fullWidth: true,
        variant: RiseTextFieldVariant.secondary,
        labelText: 'Bio',
        helperText: 'Minimum 4 rows.',
        minLines: 4,
        maxLines: 8,
        placeholder: 'Tell us about yourself…',
      ),
    ],
  ),
)`;

export const textFieldVariantsCode = `const Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    RiseTextField(
      fullWidth: true,
      variant: RiseTextFieldVariant.primary,
      labelText: 'Primary',
      placeholder: 'Surface container fill',
    ),
    RiseTextField(
      fullWidth: true,
      variant: RiseTextFieldVariant.secondary,
      labelText: 'Secondary',
      placeholder: 'Muted fill — use on surfaces',
    ),
  ],
)`;
