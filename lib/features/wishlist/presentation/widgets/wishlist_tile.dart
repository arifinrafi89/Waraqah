import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/book.dart';
import '../../../../core/models/edition.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/stock_label.dart';
import '../../../../core/widgets/cover_art.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/catalog_routes.dart';
import 'wishlist_action.dart';
import 'wishlist_price.dart';

/// One saved book: cover, title, stock and price, with a filled heart to
/// remove it and a cart button that moves its cheapest edition to the cart.
class WishlistTile extends ConsumerWidget {
  const WishlistTile({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final edition = book.fromEdition;
    void openBook() => context.push(CatalogRoutes.bookDetailFor(book.id));
    return SurfaceCard(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: Insets.md,
        children: [
          GestureDetector(
            onTap: openBook,
            child: SizedBox(
              width: Sizes.listThumbWidth,
              child: CoverArt(
                title: book.coverLabel,
                seed: book.coverSeed,
                aspectRatio: Sizes.listThumbWidth / Sizes.listThumbHeight,
                fontSize: 8.5,
                radius: 10,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: openBook,
                  borderRadius: BorderRadius.circular(Radii.sm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 3,
                    children: [
                      Text(
                        book.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: context.texts.titleSmall,
                      ),
                      Text(
                        book.author,
                        style: AppFonts.ui(size: 11, color: palette.textFaint),
                      ),
                      Text(
                        l10n.stockStatus(book.cardStockStatus),
                        style: AppFonts.ui(
                          size: 11,
                          weight: FontWeight.w700,
                          color: edition.isOrderable
                              ? palette.accent
                              : palette.textFaint,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(child: WishlistPrice(edition: edition)),
                    IconButton(
                      tooltip: l10n.wishlistRemove,
                      color: palette.accent,
                      icon: const Icon(Icons.favorite_rounded),
                      onPressed: () =>
                          ref.setWishlisted(context, book.id, saved: false),
                    ),
                    IconButton.outlined(
                      tooltip: l10n.wishlistMoveToCart,
                      color: palette.accent,
                      icon: const Icon(Icons.add_shopping_cart_rounded),
                      onPressed: edition.isOrderable
                          ? () => ref.moveToCart(context, book)
                          : null,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
