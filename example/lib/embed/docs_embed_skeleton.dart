import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

/// Skeleton demos for docs iframe (`?embed=skeleton-*`).
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

class _SkeletonUsageEmbed extends StatelessWidget {
  const _SkeletonUsageEmbed();

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(12),
      color: context.riseTheme.background,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: RiseSkeletonGroup(
          children: [
            const RiseSkeleton(height: 16),
            RiseSkeleton(width: MediaQuery.sizeOf(context).width * 0.35, height: 12),
          ],
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
        const RiseSkeleton(height: 14),
        const RiseSkeleton(height: 14),
        RiseSkeleton(width: MediaQuery.sizeOf(context).width * 0.45, height: 12),
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
              const RiseSkeleton(height: 14),
              RiseSkeleton(width: MediaQuery.sizeOf(context).width * 0.28, height: 12),
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
        const Expanded(child: RiseSkeleton(height: 12)),
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
            RiseSkeleton(height: 56, animationType: a),
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

class _SkeletonGridEmbed extends StatelessWidget {
  const _SkeletonGridEmbed();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 2.2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        RiseSkeleton(height: 32),
        RiseSkeleton(height: 32),
        RiseSkeleton(height: 32),
        RiseSkeleton(height: 32),
        RiseSkeleton(height: 32),
        RiseSkeleton(height: 32),
        RiseSkeleton(height: 32),
        RiseSkeleton(height: 32),
        RiseSkeleton(height: 32),
      ],
    );
  }
}

class _SkeletonSyncShimmerEmbed extends StatelessWidget {
  const _SkeletonSyncShimmerEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseSkeletonSyncShimmer(
      child: Row(
        children: [
          Expanded(
            child: RiseSkeleton(
              height: 40,
              animationType: RiseSkeletonAnimation.shimmer,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: RiseSkeleton(
              height: 40,
              animationType: RiseSkeletonAnimation.shimmer,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: RiseSkeleton(
              height: 40,
              animationType: RiseSkeletonAnimation.shimmer,
            ),
          ),
        ],
      ),
    );
  }
}
