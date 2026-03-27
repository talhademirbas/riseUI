/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_alert.dart`. */

export const alertUsageCode = `const RiseAlert(
  title: Text('New features available'),
  description: Text('Supporting body copy for the alert.'),
)`;

export const alertAccentCode = `RiseAlert(
  status: RiseAlertStatus.accent,
  title: const Text('Update available'),
  description: const Text('Please refresh to get the latest features.'),
  actions: [
    RiseButton(
      label: 'Refresh',
      size: RiseButtonSize.sm,
      variant: RiseButtonVariant.primary,
      onPressed: () {},
    ),
  ],
)`;

export const alertSuccessCode = `const RiseAlert(
  status: RiseAlertStatus.success,
  title: Text('Profile updated successfully'),
)`;

export const alertWarningCode = `const RiseAlert(
  status: RiseAlertStatus.warning,
  title: Text('Scheduled maintenance'),
  description: Text('We will be unavailable during this window.'),
)`;

export const alertDangerCode = `RiseAlert(
  status: RiseAlertStatus.danger,
  title: const Text('Unable to connect to server'),
  description: const Text('Try again or check your connection.'),
  actions: [
    RiseButton(
      label: 'Retry',
      size: RiseButtonSize.sm,
      variant: RiseButtonVariant.outline,
      onPressed: () {},
    ),
  ],
)`;

export const alertCustomIndicatorCode = `RiseAlert(
  status: RiseAlertStatus.accent,
  leading: const Icon(Icons.auto_awesome_outlined),
  title: const Text('Custom indicator'),
  description: const Text('Any widget can replace the default icon.'),
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
)`;
