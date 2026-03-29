import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

class DocsEmbedAlert {
  DocsEmbedAlert._();

  static Widget _wrap(Widget child) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kDocsEmbedMaxWidth),
        child: child,
      ),
    );
  }

  static Widget usage(BuildContext context) => _wrap(const _AlertUsageEmbed());
  static Widget accent(BuildContext context) => _wrap(const _AlertAccentEmbed());
  static Widget success(BuildContext context) => _wrap(const _AlertSuccessEmbed());
  static Widget warning(BuildContext context) => _wrap(const _AlertWarningEmbed());
  static Widget danger(BuildContext context) => _wrap(const _AlertDangerEmbed());
  static Widget withoutDescription(BuildContext context) =>
      _wrap(const _AlertWithoutDescriptionEmbed());
  static Widget customIndicator(BuildContext context) =>
      _wrap(const _AlertCustomIndicatorEmbed());
  static Widget withoutClose(BuildContext context) => _wrap(const _AlertWithoutCloseEmbed());
  static Widget withActions(BuildContext context) => _wrap(const _AlertWithActionsEmbed());
}

void _noop() {}

class _AlertUsageEmbed extends StatelessWidget {
  const _AlertUsageEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseAlert(
      title: Text('New features available'),
      description: Text(
        'Check out our latest updates including dark mode support and improved accessibility '
        'features.',
      ),
    );
  }
}

class _AlertAccentEmbed extends StatelessWidget {
  const _AlertAccentEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseAlert(
      status: RiseAlertStatus.accent,
      title: const Text('Update available'),
      description: const Text(
        'A new version of the application is available. Please refresh to get the latest '
        'features and bug fixes.',
      ),
      actions: [
        RiseButton(
          label: 'Refresh',
          size: RiseButtonSize.sm,
          variant: RiseButtonVariant.primary,
          onPressed: _noop,
        ),
      ],
      onClose: _noop,
    );
  }
}

class _AlertSuccessEmbed extends StatelessWidget {
  const _AlertSuccessEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseAlert(
      status: RiseAlertStatus.success,
      title: const Text('Payment successful'),
      description: const Text(
        'Your payment of \$49.99 has been processed. A confirmation email has been sent to '
        'your inbox.',
      ),
      actions: [
        RiseButton(
          label: 'View Receipt',
          size: RiseButtonSize.sm,
          variant: RiseButtonVariant.primary,
          onPressed: _noop,
        ),
      ],
      onClose: _noop,
    );
  }
}

class _AlertWarningEmbed extends StatelessWidget {
  const _AlertWarningEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseAlert(
      status: RiseAlertStatus.warning,
      title: const Text('Storage almost full'),
      description: const Text(
        "You're using 90% of your storage quota. Consider upgrading your plan or removing "
        'unused files to avoid service interruption.',
      ),
      actions: [
        RiseButton(
          label: 'Manage Storage',
          size: RiseButtonSize.sm,
          variant: RiseButtonVariant.primary,
          onPressed: _noop,
        ),
      ],
      onClose: _noop,
    );
  }
}

class _AlertDangerEmbed extends StatelessWidget {
  const _AlertDangerEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseAlert(
      status: RiseAlertStatus.danger,
      title: const Text('Unable to connect to server'),
      description: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("We're experiencing connection issues. Please try the following:"),
          SizedBox(height: 8),
          Text('• Check your internet connection'),
          Text('• Refresh the page'),
          Text('• Clear your browser cache'),
        ],
      ),
      actions: [
        RiseButton(
          label: 'Retry',
          size: RiseButtonSize.sm,
          variant: RiseButtonVariant.outline,
          onPressed: _noop,
        ),
      ],
      onClose: _noop,
    );
  }
}

class _AlertWithoutDescriptionEmbed extends StatelessWidget {
  const _AlertWithoutDescriptionEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseAlert(
      status: RiseAlertStatus.success,
      title: const Text('Profile updated successfully'),
      onClose: _noop,
    );
  }
}

class _AlertCustomIndicatorEmbed extends StatelessWidget {
  const _AlertCustomIndicatorEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseAlert(
      status: RiseAlertStatus.accent,
      leading: const RiseSpinner(
        size: RiseSpinnerSize.sm,
        color: RiseSpinnerColor.accent,
      ),
      title: const Text('Processing your request'),
      description: const Text(
        'Please wait while we sync your data. This may take a few moments.',
      ),
      onClose: _noop,
    );
  }
}

class _AlertWithoutCloseEmbed extends StatelessWidget {
  const _AlertWithoutCloseEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseAlert(
      status: RiseAlertStatus.warning,
      title: Text('Scheduled maintenance'),
      description: Text(
        'Our services will be unavailable on Sunday, March 15th from 2:00 AM to 6:00 AM UTC '
        'for scheduled maintenance.',
      ),
    );
  }
}

class _AlertWithActionsEmbed extends StatelessWidget {
  const _AlertWithActionsEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseAlert(
      status: RiseAlertStatus.warning,
      title: const Text('Review required'),
      description: const Text('Multiple actions in a wrap row.'),
      actions: [
        RiseButton(
          label: 'Dismiss',
          size: RiseButtonSize.sm,
          variant: RiseButtonVariant.ghost,
          onPressed: _noop,
        ),
        RiseButton(
          label: 'Open',
          size: RiseButtonSize.sm,
          variant: RiseButtonVariant.primary,
          onPressed: _noop,
        ),
      ],
      onClose: _noop,
    );
  }
}
