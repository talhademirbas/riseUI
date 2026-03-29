import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

/// Skeleton demos for docs iframe (`?embed=skeleton-*`).
///
/// Layouts mirror HeroUI v3 Storybook
/// [skeleton.stories.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/skeleton/skeleton.stories.tsx)
/// (`Template`, `GridTemplate`, `SingleShimmerTemplate`).
class DocsEmbedSkeleton {
  DocsEmbedSkeleton._();

  static Widget _wrap(Widget child) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kDocsEmbedMaxWidth),
        child: child,
      ),
    );
  }

  static Widget usage(BuildContext context) => _wrap(const _SkeletonUsageEmbed());

  static Widget textContent(BuildContext context) => _wrap(const _SkeletonTextContentEmbed());

  static Widget userProfile(BuildContext context) => _wrap(const _SkeletonUserProfileEmbed());

  static Widget listItems(BuildContext context) => _wrap(const _SkeletonListItemsEmbed());

  static Widget animationTypes(BuildContext context) => _wrap(const _SkeletonAnimationTypesEmbed());

  static Widget grid(BuildContext context) => _wrap(const _SkeletonGridEmbed());

  static Widget synchronizedShimmer(BuildContext context) =>
      _wrap(const _SkeletonSyncShimmerEmbed());
}

/// Hero `Template`: `w-[200px] space-y-5 rounded-3xl p-4 shadow-surface` + block + `space-y-3` lines.
class _SkeletonUsageEmbed extends StatelessWidget {
  const _SkeletonUsageEmbed();

  static const double _cardW = 200;
  static const double _pad = 16;
  static const double _inner = _cardW - _pad * 2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _cardW,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: RiseSurface(
          variant: RiseSurfaceVariant.default_,
          padding: const EdgeInsets.all(_pad),
          borderRadius: 24,
          showShadow: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const RiseSkeleton(height: 96, borderRadius: 12),
              const SizedBox(height: 20),
              RiseSkeletonGroup(
                spacing: 12,
                children: [
                  RiseSkeleton(height: 12, borderRadius: 8, width: _inner * 0.6),
                  RiseSkeleton(height: 12, borderRadius: 8, width: _inner * 0.8),
                  RiseSkeleton(height: 12, borderRadius: 8, width: _inner * 0.4),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkeletonTextContentEmbed extends StatelessWidget {
  const _SkeletonTextContentEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseSkeletonGroup(
      spacing: 12,
      children: [
        const RiseSkeleton(height: 12, borderRadius: 8),
        const RiseSkeleton(height: 12, borderRadius: 8),
        RiseSkeleton(
          width: MediaQuery.sizeOf(context).width * 0.45,
          height: 12,
          borderRadius: 8,
        ),
      ],
    );
  }
}

class _SkeletonUserProfileEmbed extends StatelessWidget {
  const _SkeletonUserProfileEmbed();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const RiseSkeleton(width: 48, height: 48, borderRadius: 24),
        const SizedBox(width: 12),
        Expanded(
          child: RiseSkeletonGroup(
            spacing: 8,
            children: [
              const RiseSkeleton(height: 12, borderRadius: 8),
              RiseSkeleton(
                width: MediaQuery.sizeOf(context).width * 0.28,
                height: 12,
                borderRadius: 8,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SkeletonListItemsEmbed extends StatelessWidget {
  const _SkeletonListItemsEmbed();

  static Widget _row() {
    return Row(
      children: [
        const Expanded(child: RiseSkeleton(height: 12, borderRadius: 8)),
        const SizedBox(width: 10),
        RiseSkeleton(width: 52, height: 12, borderRadius: 6),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return RiseSkeletonGroup(
      spacing: 16,
      children: [
        _row(),
        _row(),
        _row(),
      ],
    );
  }
}

class _SkeletonAnimationTypesEmbed extends StatelessWidget {
  const _SkeletonAnimationTypesEmbed();

  @override
  Widget build(BuildContext context) {
    final labelStyle = Theme.of(context).textTheme.labelSmall?.copyWith(
          color: context.riseTheme.mutedForeground(),
        );
    Widget block(RiseSkeletonAnimation a, String caption) {
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RiseSkeleton(height: 96, borderRadius: 12, animationType: a),
            const SizedBox(height: 8),
            Text(caption, style: labelStyle, textAlign: TextAlign.center),
          ],
        ),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        block(RiseSkeletonAnimation.shimmer, 'Shimmer'),
        const SizedBox(width: 12),
        block(RiseSkeletonAnimation.pulse, 'Pulse'),
        const SizedBox(width: 12),
        block(RiseSkeletonAnimation.none, 'None'),
      ],
    );
  }
}

/// Hero `GridTemplate`: `w-[450px] grid-cols-3 gap-4` + `h-24 rounded-xl` per cell.
class _SkeletonGridEmbed extends StatelessWidget {
  const _SkeletonGridEmbed();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 450,
      child: Row(
        children: const [
          Expanded(child: RiseSkeleton(height: 96, borderRadius: 12)),
          SizedBox(width: 16),
          Expanded(child: RiseSkeleton(height: 96, borderRadius: 12)),
          SizedBox(width: 16),
          Expanded(child: RiseSkeleton(height: 96, borderRadius: 12)),
        ],
      ),
    );
  }
}

/// Hero `SingleShimmerTemplate`: parent `skeleton--shimmer` + synchronized sweep
/// ([RiseSkeletonSyncShimmer]) + `h-24 rounded-xl` row (same geometry as [Grid]).
class _SkeletonSyncShimmerEmbed extends StatelessWidget {
  const _SkeletonSyncShimmerEmbed();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 450,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: RiseSkeletonSyncShimmer(
          child: Row(
            children: const [
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
    );
  }
}
