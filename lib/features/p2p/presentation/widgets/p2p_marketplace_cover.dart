import 'package:flutter/material.dart';

import '../../../../core/widgets/cover_art.dart';
import '../../domain/entities/p2p_listing.dart';

class P2pMarketplaceCover extends StatelessWidget {
  const P2pMarketplaceCover({super.key, required this.listing});

  final P2pListing listing;

  @override
  Widget build(BuildContext context) {
    final conditionColor = switch (listing.condition) {
      BookCondition.likeNew => const Color(0xFF7DD3A8),
      BookCondition.good => const Color(0xFFE8C96B),
      BookCondition.fair => const Color(0xFFE1A7A1),
    };

    return Stack(
      children: [
        CoverArt(
          title: listing.title,
          seed: listing.coverSeed,
          aspectRatio: 0.9,
          radius: 14,
          centerTitle: true,
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: conditionColor.withValues(alpha: 0.9),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              listing.conditionLabel,
              style: const TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w800,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
