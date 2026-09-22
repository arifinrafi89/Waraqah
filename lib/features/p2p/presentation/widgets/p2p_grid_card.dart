import 'package:flutter/material.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/money.dart';
import '../../../home/domain/models/p2p_listing.dart';
import '../../../home/domain/models/profile.dart';

extension P2pConditionLabel on P2pCondition {
  String get label {
    switch (this) {
      case P2pCondition.likeNew:
        return 'Like New';
      case P2pCondition.good:
        return 'Good';
      case P2pCondition.fair:
        return 'Fair';
    }
  }
}

/// P2P listing cover + info card, extracted from Home's `_P2pCard` for reuse
/// in a responsive grid cell (Home keeps its fixed-width strip usage as-is).
class P2pGridCard extends StatelessWidget {
  const P2pGridCard({
    super.key,
    required this.listing,
    required this.book,
    required this.seller,
    required this.chip,
    this.onTap,
  });

  final P2pListing listing;
  final Book? book;
  final Profile? seller;
  final Color chip;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    final title = book?.title ?? 'Untitled';
    final sellerFirstName = seller?.fullName.split(' ').first ?? 'Student';
    final batch = seller != null && seller!.studentId.length >= 2
        ? "'${seller!.studentId.substring(0, 2)}"
        : '';

    return Container(
      decoration: BoxDecoration(
        color: palette.surface,
        border: Border.all(color: palette.border),
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [chip, Color.lerp(chip, Colors.black, 0.45)!],
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 7,
                      right: 7,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.35),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          listing.condition.label,
                          style: const TextStyle(fontSize: 8.5, fontWeight: FontWeight.w800, color: Colors.white),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: AppTheme.wordmarkTextStyle(palette).copyWith(fontSize: 13, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 9, 10, 11),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.w800, color: palette.text, height: 1.3),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '$sellerFirstName · $batch',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: palette.textFaint),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    taka(listing.price),
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: palette.accent,
                      fontFeatures: const [FontFeature.tabularFigures()],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
