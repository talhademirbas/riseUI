/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_search_field.dart`. */

export const searchFieldUsageCode = `const RiseSearchField(
  label: Text('Search'),
  hintText: 'Search...',
)`;

export const searchFieldWithDescriptionCode = `const RiseSearchField(
  label: Text('Search products'),
  description: Text('Enter keywords to search for products'),
)`;

export const searchFieldRequiredCode = `const RiseSearchField(
  label: Text('Search query'),
  isRequired: true,
  description: Text('Minimum 3 characters required'),
)`;

export const searchFieldValidationCode = `RiseSearchField(
  label: const Text('Search'),
  isInvalid: query.isNotEmpty && query.length < 3,
  errorMessage: const Text('Search query must be at least 3 characters'),
)`;

export const searchFieldDisabledCode = `const RiseSearchField(
  label: Text('Search'),
  enabled: false,
)`;

export const searchFieldControlledCode = `RiseSearchField(
  controller: controller,
  onChanged: (_) => setState(() {}),
  onClear: () => setState(() {}),
)`;

export const searchFieldFullWidthCode = `const RiseSearchField(
  fullWidth: true,
  hintText: 'Full width search...',
)`;

export const searchFieldVariantsCode = `const RiseSearchField(
  variant: RiseSearchFieldVariant.secondary,
  hintText: 'Search...',
)`;
