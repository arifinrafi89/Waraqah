import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/book.dart';
import '../../../../core/models/edition.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/cover_art.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../cart/domain/entities/cart_item_ref.dart';
import '../../../cart/presentation/widgets/add_to_cart_action.dart';
import '../../../catalog/catalog_routes.dart';
import 'wishlist_price.dart';

/// One book on someone else's list: tap it to open the book, or put its
/// cheapest edition in the cart. The list itself can't be changed here.
class SharedWishlistTile extends ConsumerWidget {
  const SharedWishlistTile({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final edition = book.fromEdition;
    return SurfaceCard(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () => context.push(CatalogRoutes.bookDetailFor(book.id)),
        borderRadius: BorderRadius.circular(Radii.sm),
        child: Row(
          spacing: Insets.md,
          children: [
            SizedBox(
              width: Sizes.listThumbWidth,
              child: CoverArt(
                title: book.coverLabel,
                seed: book.coverSeed,
                aspectRatio: Sizes.listThumbWidth / Sizes.listThumbHeight,
                fontSize: 8.5,
                radius: 10,
              ),
            ),
            Expanded(
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
                  WishlistPrice(edition: edition),
                ],
              ),
            ),
            IconButton.outlined(
              tooltip: l10n.bookDetailAddToCart,
              color: palette.accent,
              icon: const Icon(Icons.add_shopping_cart_rounded),
              onPressed: edition.isOrderable
                  ? () =>
                        ref.addToCart(context, CartItemRef.edition(edition.id))
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
