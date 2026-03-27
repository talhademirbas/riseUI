/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_surface.dart`. */

export const surfaceUsageCode = `RiseSurface(
  variant: RiseSurfaceVariant.primary,
  borderRadius: 16,
  child: Text('Default surface content'),
)

RiseSurface(variant: RiseSurfaceVariant.secondary, child: …)
RiseSurface(variant: RiseSurfaceVariant.tertiary, child: …)
RiseSurface(variant: RiseSurfaceVariant.transparent, child: …)`;

export const surfaceWithFormCode = `RiseSurface(
  variant: RiseSurfaceVariant.primary,
  child: Column(
    children: [
      RiseTextField(
        labelText: 'Email',
        variant: RiseTextFieldVariant.secondary,
        fullWidth: true,
      ),
    ],
  ),
)`;
