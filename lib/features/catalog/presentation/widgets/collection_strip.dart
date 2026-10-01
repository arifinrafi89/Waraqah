import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/horizontal_strip.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/collection.dart';
import '../providers/catalog_providers.dart';
import 'collection_tile.dart';

/// Horizontal strip of [CollectionTile]s. Home and Section pages use it.
class CollectionStrip extends StatelessWidget {
  const CollectionStrip({super.key, required this.collections});

  final List<Collection> collections;

  @override
  Widget build(BuildContext context) => HorizontalStrip(
    cardWidthFraction: 0.4,
    minCardWidth: 140,
    maxCardWidth: 200,
    children: [for (final c in collections) CollectionTile(collection: c)],
  );
}

/// Shimmer stand-in with the same strip geometry.
class CollectionStripSkeleton extends StatelessWidget {
  const CollectionStripSkeleton({super.key});

  @override
  Widget build(BuildContext context) => HorizontalStrip(
    cardWidthFraction: 0.4,
    minCardWidth: 140,
    maxCardWidth: 200,
    physics: const NeverScrollableScrollPhysics(),
    children: [
      for (var i = 0; i < 3; i++)
        const ShimmerBox(aspectRatio: 0.95, radius: Radii.card),
    ],
  );
}

/// A Section's Collections under a header. Shows nothing while loading, on
/// error, or when the Section has none.
class SectionCollections extends ConsumerWidget {
  const SectionCollections({super.key, required this.section});

  final Section section;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collections = ref.watch(collectionsProvider(section)).value;
    if (collections == null || collections.isEmpty) return const SizedBox();
    return Padding(
      padding: const EdgeInsets.only(top: Insets.sm, bottom: Insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Insets.screen),
            child: SectionHeader(
              title: AppL10n.of(context)!.collectionStripTitle,
            ),
          ),
          CollectionStrip(collections: collections),
        ],
      ),
    );
  }
}
