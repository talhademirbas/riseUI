/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_spinner.dart`. */

export const spinnerUsageCode = `IconTheme.merge(
  data: IconThemeData(color: theme.colorScheme.onSurface),
  child: const RiseSpinner(),
)`;

export const spinnerColorsCode = `const RiseSpinner(color: RiseSpinnerColor.accent)
const RiseSpinner(color: RiseSpinnerColor.success)
// … warning, danger

DefaultTextStyle(
  style: TextStyle(color: brandBlue),
  child: const RiseSpinner(color: RiseSpinnerColor.current),
)`;

export const spinnerSizesCode = `const Row(
  children: [
    RiseSpinner(size: RiseSpinnerSize.sm),
    RiseSpinner(size: RiseSpinnerSize.md),
    RiseSpinner(size: RiseSpinnerSize.lg),
    RiseSpinner(size: RiseSpinnerSize.xl),
  ],
)`;

export const spinnerLoadingFlagCode = `const RiseSpinner(isLoading: false) // SizedBox.shrink()`;
