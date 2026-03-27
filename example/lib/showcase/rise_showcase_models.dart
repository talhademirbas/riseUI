import 'package:flutter/widgets.dart';

/// Single source of truth for **one** interactive example (example app section + docs embed).
///
/// [slug] is stable: combined with [componentId] it forms the Flutter web embed id
/// `{componentId}-{slug}` (e.g. `accordion-faq`).
@immutable
class RiseUsageVariant {
  const RiseUsageVariant({
    required this.slug,
    required this.sectionTitle,
    this.subtitle,
    required this.builder,
    this.minHeight = 320,
  });

  final String slug;

  /// Example app section heading / docs `###` title.
  final String sectionTitle;

  /// Short copy under the heading (HeroUI-style usage notes).
  final String? subtitle;

  /// Preview widget (shared with [DocsEmbedPage] on web).
  final Widget Function(BuildContext context) builder;

  /// Preferred iframe height for the docs site.
  final double minHeight;

  String embedId(String componentId) => '$componentId-$slug';
}

/// Metadata + all usage variants for one component (mobile example + docs **Usage** block).
@immutable
class RiseComponentShowcase {
  const RiseComponentShowcase({
    required this.componentId,
    required this.title,
    required this.description,
    required this.usages,
  });

  final String componentId;
  final String title;
  final String description;
  final List<RiseUsageVariant> usages;
}
