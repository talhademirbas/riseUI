/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_toast.dart`. */

export const toastHeroStoriesCode = `RiseToast.show(
  context,
  variant: RiseToastVariant.default_,
  title: 'You have been invited to join a team',
  description: 'Bob sent you an invitation to join HeroUI team',
  indicator: Icon(Icons.people_outline, size: 16),
  action: RiseToastAction(
    label: 'Dismiss',
    onPressed: RiseToast.clear,
  ),
);`;

export const toastPlacementsCode = `RiseToast.show(
  context,
  title: 'Placement: Top start',
  placement: RiseToastPlacement.topStart,
);`;

export const toastLoadingCode = `RiseToast.show(
  context,
  title: 'Saving…',
  showDefaultIndicator: false,
  isLoading: true,
  duration: Duration.zero,
);`;
