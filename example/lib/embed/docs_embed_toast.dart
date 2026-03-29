import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

/// Toast demos — [toast.stories.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/toast/toast.stories.tsx).
class DocsEmbedToast {
  DocsEmbedToast._();

  static Widget _wrap(Widget child) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kDocsEmbedMaxWidth),
        child: child,
      ),
    );
  }

  /// Mirrors the Storybook `Template` row (`Default` story).
  static Widget heroStoriesTap(BuildContext context) {
    return _wrap(
      Wrap(
        spacing: 8,
        runSpacing: 8,
        alignment: WrapAlignment.center,
        children: [
          RiseButton(
            variant: RiseButtonVariant.tertiary,
            label: 'Default toast',
            onPressed: () {
              RiseToast.show(
                context,
                variant: RiseToastVariant.default_,
                title: 'You have been invited to join a team',
                description: 'Bob sent you an invitation to join HeroUI team',
                indicator: const Icon(Icons.people_outline, size: 16),
                action: RiseToastAction(
                  label: 'Dismiss',
                  onPressed: RiseToast.clear,
                ),
              );
            },
          ),
          RiseButton(
            variant: RiseButtonVariant.secondary,
            label: 'Accent toast',
            onPressed: () {
              RiseToast.info(
                context,
                'You have 2 credits left',
                description: 'Get a paid plan for more credits',
                action: RiseToastAction(
                  label: 'Upgrade',
                  onPressed: () {},
                ),
              );
            },
          ),
          RiseButton(
            variant: RiseButtonVariant.tertiary,
            label: 'Success toast',
            onPressed: () {
              RiseToast.success(
                context,
                'You have upgraded your plan',
                description: 'You can continue using HeroUI Chat',
                action: RiseToastAction(
                  label: 'Billing',
                  buttonVariant: RiseButtonVariant.secondary,
                  onPressed: () {},
                ),
              );
            },
          ),
          RiseButton(
            variant: RiseButtonVariant.tertiary,
            label: 'Warning toast',
            onPressed: () {
              RiseToast.warning(
                context,
                'You have no credits left',
                description: 'Upgrade to a paid plan to continue',
                action: RiseToastAction(
                  label: 'Upgrade',
                  onPressed: () {},
                ),
              );
            },
          ),
          RiseButton(
            variant: RiseButtonVariant.dangerSoft,
            label: 'Danger toast',
            onPressed: () {
              RiseToast.danger(
                context,
                'Storage is full',
                description:
                    'Remove files to release space. Adding more text to demonstrate longer content display',
                indicator: const Icon(Icons.storage_outlined, size: 16),
                action: RiseToastAction(
                  label: 'Remove',
                  buttonVariant: RiseButtonVariant.danger,
                  onPressed: () {},
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  static Widget placementsTap(BuildContext context) {
    Widget b(String label, RiseToastPlacement p) {
      return RiseButton(
        variant: RiseButtonVariant.tertiary,
        label: label,
        onPressed: () {
          RiseToast.show(
            context,
            title: 'Placement: $label',
            description: 'Toasts stack per placement with gap and scale.',
            placement: p,
            duration: const Duration(seconds: 3),
          );
        },
      );
    }

    return _wrap(
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          b('Top', RiseToastPlacement.top),
          b('Top start', RiseToastPlacement.topStart),
          b('Top end', RiseToastPlacement.topEnd),
          b('Bottom', RiseToastPlacement.bottom),
          b('Bottom start', RiseToastPlacement.bottomStart),
          b('Bottom end', RiseToastPlacement.bottomEnd),
        ],
      ),
    );
  }

  static Widget loadingTap(BuildContext context) {
    return _wrap(
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          RiseButton(
            variant: RiseButtonVariant.secondary,
            label: 'Show loading toast',
            onPressed: () {
              RiseToast.show(
                context,
                title: 'Saving…',
                description: 'This toast stays until you close it or clear the queue.',
                showDefaultIndicator: false,
                isLoading: true,
                duration: Duration.zero,
              );
            },
          ),
        ],
      ),
    );
  }
}
