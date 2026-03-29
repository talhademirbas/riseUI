/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_alert.dart`. */

export const alertUsageCode = `const RiseAlert(
  title: Text('New features available'),
  description: Text(
    'Check out our latest updates including dark mode support and improved accessibility features.',
  ),
)`;

export const alertAccentCode = `RiseAlert(
  status: RiseAlertStatus.accent,
  title: const Text('Update available'),
  description: const Text(
    'A new version of the application is available. Please refresh to get the latest features and bug fixes.',
  ),
  actions: [
    RiseButton(
      label: 'Refresh',
      size: RiseButtonSize.sm,
      variant: RiseButtonVariant.primary,
      onPressed: () {},
    ),
  ],
  onClose: () {},
)`;

export const alertSuccessCode = `RiseAlert(
  status: RiseAlertStatus.success,
  title: const Text('Payment successful'),
  description: const Text(
    'Your payment of \\\$49.99 has been processed. A confirmation email has been sent to your inbox.',
  ),
  actions: [
    RiseButton(
      label: 'View Receipt',
      size: RiseButtonSize.sm,
      variant: RiseButtonVariant.primary,
      onPressed: () {},
    ),
  ],
  onClose: () {},
)`;

export const alertWarningCode = `RiseAlert(
  status: RiseAlertStatus.warning,
  title: const Text('Storage almost full'),
  description: const Text(
    "You're using 90% of your storage quota. Consider upgrading your plan or removing unused files to avoid service interruption.",
  ),
  actions: [
    RiseButton(
      label: 'Manage Storage',
      size: RiseButtonSize.sm,
      variant: RiseButtonVariant.primary,
      onPressed: () {},
    ),
  ],
  onClose: () {},
)`;

export const alertDangerCode = `RiseAlert(
  status: RiseAlertStatus.danger,
  title: const Text('Unable to connect to server'),
  description: const Text('Try the steps below, then retry.'),
  actions: [
    RiseButton(
      label: 'Retry',
      size: RiseButtonSize.sm,
      variant: RiseButtonVariant.outline,
      onPressed: () {},
    ),
  ],
  onClose: () {},
)`;

export const alertWithoutDescriptionCode = `RiseAlert(
  status: RiseAlertStatus.success,
  title: const Text('Profile updated successfully'),
  onClose: () {},
)`;

export const alertCustomIndicatorCode = `RiseAlert(
  status: RiseAlertStatus.accent,
  leading: const RiseSpinner(
    size: RiseSpinnerSize.sm,
    color: RiseSpinnerColor.accent,
  ),
  title: const Text('Processing your request'),
  description: const Text('Please wait while we sync your data.'),
  onClose: () {},
)`;

export const alertWithoutCloseCode = `const RiseAlert(
  status: RiseAlertStatus.warning,
  title: Text('Scheduled maintenance'),
  description: Text('Services will be unavailable during this window.'),
)`;

export const alertWithActionsCode = `RiseAlert(
  status: RiseAlertStatus.warning,
  title: const Text('Review required'),
  description: const Text('Multiple actions in a wrap row.'),
  actions: [
    RiseButton(
      label: 'Dismiss',
      size: RiseButtonSize.sm,
      variant: RiseButtonVariant.ghost,
      onPressed: () {},
    ),
    RiseButton(
      label: 'Open',
      size: RiseButtonSize.sm,
      variant: RiseButtonVariant.primary,
      onPressed: () {},
    ),
  ],
  onClose: () {},
)`;
