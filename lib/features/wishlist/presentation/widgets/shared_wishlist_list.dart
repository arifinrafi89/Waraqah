import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/shared_wishlist.dart';
import 'shared_wishlist_tile.dart';

/// A tip on sending one as a gift, then the books on someone's list.
class SharedWishlistList extends StatelessWidget {
  const SharedWishlistList({super.key, required this.list});

  final SharedWishlist list;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        Insets.screen,
        0,
        Insets.screen,
        Insets.xl,
      ),
      children: [
        SurfaceCard(
          padding: const EdgeInsets.all(Insets.md),
          child: Row(
            spacing: Insets.md,
            children: [
              Icon(Icons.card_giftcard_rounded, color: palette.accent),
              Expanded(
                child: Text(
                  l10n.wishlistSharedGiftHint(list.ownerName),
                  style: AppFonts.ui(size: 12.5, color: palette.textDim),
                ),
              ),
            ],
          ),
        ),
        for (final book in list.books)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SharedWishlistTile(key: ValueKey(book.id), book: book),
          ),
      ],
    );
  }
}
