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
  static Widget customIndicator(BuildContext context) => _wrap(const _AlertCustomIndicatorEmbed());
  static Widget withActions(BuildContext context) => _wrap(const _AlertWithActionsEmbed());
}

class _AlertUsageEmbed extends StatelessWidget {
  const _AlertUsageEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseAlert(
      title: Text('New features available'),
      description: Text(
        'Check out our latest updates including dark mode support and improved accessibility features.',
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
    );
  }
}

class _AlertSuccessEmbed extends StatelessWidget {
  const _AlertSuccessEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseAlert(
      status: RiseAlertStatus.success,
      title: Text('Profile updated successfully'),
    );
  }
}

class _AlertWarningEmbed extends StatelessWidget {
  const _AlertWarningEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseAlert(
      status: RiseAlertStatus.warning,
      title: Text('Scheduled maintenance'),
      description: Text(
        'Our services will be unavailable on Sunday, March 15th from 2:00 AM to 6:00 AM UTC for scheduled maintenance.',
      ),
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
          onPressed: () {},
        ),
      ],
    );
  }
}

class _AlertCustomIndicatorEmbed extends StatelessWidget {
  const _AlertCustomIndicatorEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseAlert(
      status: RiseAlertStatus.accent,
      leading: const Icon(Icons.auto_awesome_outlined),
      title: const Text('Custom indicator'),
      description: const Text('The leading slot can be any widget, not only the default status icon.'),
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
      description: const Text('Two actions demonstrate the footer action row.'),
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
    );
  }
}
