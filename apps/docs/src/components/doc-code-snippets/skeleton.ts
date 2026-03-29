/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_skeleton.dart`. */

export const skeletonUsageCode = `SizedBox(
  width: 200,
  child: ClipRRect(
    borderRadius: BorderRadius.circular(24),
    child: RiseSurface(
      variant: RiseSurfaceVariant.default_,
      padding: EdgeInsets.all(16),
      borderRadius: 24,
      showShadow: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RiseSkeleton(height: 96, borderRadius: 12),
          SizedBox(height: 20),
          RiseSkeletonGroup(
            spacing: 12,
            children: [
              RiseSkeleton(height: 12, borderRadius: 8, width: 100.8),
              RiseSkeleton(height: 12, borderRadius: 8, width: 134.4),
              RiseSkeleton(height: 12, borderRadius: 8, width: 67.2),
            ],
          ),
        ],
      ),
    ),
  ),
)`;

export const skeletonTextContentCode = `RiseSkeletonGroup(
  spacing: 12,
  children: [
    RiseSkeleton(height: 12, borderRadius: 8),
    RiseSkeleton(height: 12, borderRadius: 8),
    RiseSkeleton(width: 180, height: 12, borderRadius: 8),
  ],
)`;

export const skeletonUserProfileCode = `Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    RiseSkeleton(width: 48, height: 48, borderRadius: 24),
    SizedBox(width: 12),
    Expanded(
      child: RiseSkeletonGroup(
        spacing: 8,
        children: [
          RiseSkeleton(height: 12, borderRadius: 8),
          RiseSkeleton(width: 96, height: 12, borderRadius: 8),
        ],
      ),
    ),
  ],
)`;

export const skeletonListItemsCode = `RiseSkeletonGroup(
  spacing: 16,
  children: [
    Row(
      children: [
        Expanded(child: RiseSkeleton(height: 12, borderRadius: 8)),
        SizedBox(width: 10),
        RiseSkeleton(width: 52, height: 12, borderRadius: 6),
      ],
    ),
    // …repeat rows
  ],
)`;

export const skeletonAnimationTypesCode = `Row(
  children: [
    Expanded(
      child: RiseSkeleton(height: 96, borderRadius: 12, animationType: RiseSkeletonAnimation.shimmer),
    ),
    SizedBox(width: 12),
    Expanded(
      child: RiseSkeleton(height: 96, borderRadius: 12, animationType: RiseSkeletonAnimation.pulse),
    ),
    SizedBox(width: 12),
    Expanded(
      child: RiseSkeleton(height: 96, borderRadius: 12, animationType: RiseSkeletonAnimation.none),
    ),
  ],
)`;

export const skeletonGridCode = `SizedBox(
  width: 450,
  child: Row(
    children: [
      Expanded(child: RiseSkeleton(height: 96, borderRadius: 12)),
      SizedBox(width: 16),
      Expanded(child: RiseSkeleton(height: 96, borderRadius: 12)),
      SizedBox(width: 16),
      Expanded(child: RiseSkeleton(height: 96, borderRadius: 12)),
    ],
  ),
)`;

export const skeletonSynchronizedShimmerCode = `SizedBox(
  width: 450,
  child: ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: RiseSkeletonSyncShimmer(
      child: Row(
        children: [
          Expanded(
            child: RiseSkeleton(
              height: 96,
              borderRadius: 12,
              animationType: RiseSkeletonAnimation.shimmer,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: RiseSkeleton(
              height: 96,
              borderRadius: 12,
              animationType: RiseSkeletonAnimation.shimmer,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: RiseSkeleton(
              height: 96,
              borderRadius: 12,
              animationType: RiseSkeletonAnimation.shimmer,
            ),
          ),
        ],
      ),
    ),
  ),
)`;
