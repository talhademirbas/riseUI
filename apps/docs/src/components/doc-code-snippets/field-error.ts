/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_field_error.dart`. */

export const fieldErrorUsageCode = `const RiseFieldError(
  visible: true,
  child: Text('Username must be at least 3 characters'),
)`;

export const fieldErrorVisibilityCode = `RiseFieldError(
  visible: _showError,
  child: const Text('This field has a validation error.'),
)`;

export const fieldErrorBasicValidationCode = `RiseFieldError(
  visible: isInvalid,
  child: const Text('Username must be at least 3 characters'),
)`;

export const fieldErrorDynamicMessageCode = `RiseFieldError(
  visible: errors.isNotEmpty,
  child: Text(errors.join(', ')),
)`;

export const fieldErrorMultipleMessagesCode = `RiseFieldError(
  visible: show,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [for (final e in errors) Text('- \$e')],
  ),
)`;
