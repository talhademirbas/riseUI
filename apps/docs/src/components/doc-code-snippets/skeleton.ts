/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_skeleton.dart`. */

export const skeletonUsageCode = `Material(
  elevation: 1,
  borderRadius: BorderRadius.circular(12),
  color: context.riseTheme.background,
  child: Padding(
    padding: const EdgeInsets.all(16),
    child: RiseSkeletonGroup(
      children: [
        const RiseSkeleton(height: 16),
        RiseSkeleton(width: 120, height: 12),
      ],
    ),
  ),
)`;

export const skeletonTextContentCode = `RiseSkeletonGroup(
  spacing: 12,
  children: [
    const RiseSkeleton(height: 14),
    const RiseSkeleton(height: 14),
    RiseSkeleton(width: 180, height: 12),
  ],
)`;

export const skeletonUserProfileCode = `Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const RiseSkeleton(width: 48, height: 48, borderRadius: 24),
    const SizedBox(width: 12),
    Expanded(
      child: RiseSkeletonGroup(
        spacing: 8,
        children: [
          const RiseSkeleton(height: 14),
          RiseSkeleton(width: 96, height: 12),
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
        const Expanded(child: RiseSkeleton(height: 12)),
        const SizedBox(width: 10),
        RiseSkeleton(width: 52, height: 12, borderRadius: 6),
      ],
    ),
    // …repeat rows
  ],
)`;

export const skeletonAnimationTypesCode = `Row(
  children: [
    Expanded(
      child: RiseSkeleton(height: 56, animationType: RiseSkeletonAnimation.shimmer),
    ),
    Expanded(
      child: RiseSkeleton(height: 56, animationType: RiseSkeletonAnimation.pulse),
    ),
    Expanded(
      child: RiseSkeleton(height: 56, animationType: RiseSkeletonAnimation.none),
    ),
  ],
)`;

export const skeletonGridCode = `GridView.count(
  crossAxisCount: 3,
  mainAxisSpacing: 12,
  crossAxisSpacing: 12,
  childAspectRatio: 2.2,
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  children: const [
    RiseSkeleton(height: 32),
    // …
  ],
)`;

export const skeletonSynchronizedShimmerCode = `RiseSkeletonSyncShimmer(
  child: Row(
    children: [
      Expanded(
        child: RiseSkeleton(height: 40, animationType: RiseSkeletonAnimation.shimmer),
      ),
      const SizedBox(width: 10),
      Expanded(
        child: RiseSkeleton(height: 40, animationType: RiseSkeletonAnimation.shimmer),
      ),
    ],
  ),
)`;
