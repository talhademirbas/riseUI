/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_field_error.dart`. */

export const fieldErrorUsageCode = `const RiseFieldError(
  child: Text('Username must be at least 3 characters'),
)`;

export const fieldErrorBasicValidationCode = `if (isInvalid)
  const RiseFieldError(
    child: Text('Username must be at least 3 characters'),
  )`;

export const fieldErrorDynamicMessageCode = `RiseFieldError(
  child: Text(errors.join(', ')),
)`;

export const fieldErrorMultipleMessagesCode = `RiseFieldError(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [for (final e in errors) Text('- $e')],
  ),
)`;
