/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_spinner.dart`. */

export const spinnerUsageCode = `IconTheme.merge(
  data: IconThemeData(color: theme.defaultForeground),
  child: const RiseSpinner(),
)`;

export const spinnerColorsCode = `Row(
  children: [
    const RiseSpinner(color: RiseSpinnerColor.accent),
    const SizedBox(width: 32),
    DefaultTextStyle(
      style: TextStyle(color: brandColor),
      child: const RiseSpinner(color: RiseSpinnerColor.current),
    ),
    // … success, warning, danger
  ],
)`;

export const spinnerSizesCode = `Row(
  children: [
    RiseSpinner(size: RiseSpinnerSize.sm, color: RiseSpinnerColor.accent),
    const SizedBox(width: 32),
    RiseSpinner(size: RiseSpinnerSize.md, color: RiseSpinnerColor.accent),
    const SizedBox(width: 32),
    RiseSpinner(size: RiseSpinnerSize.lg, color: RiseSpinnerColor.accent),
    const SizedBox(width: 32),
    RiseSpinner(size: RiseSpinnerSize.xl, color: RiseSpinnerColor.accent),
  ],
)`;

export const spinnerLoadingFlagCode = `const RiseSpinner(isLoading: false) // SizedBox.shrink()`;
