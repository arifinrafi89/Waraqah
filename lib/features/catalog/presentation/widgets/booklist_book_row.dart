import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/stock_label.dart';
import '../../../../core/widgets/cover_art.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../cart/domain/entities/cart_item_ref.dart';
import '../../../cart/presentation/widgets/add_to_cart_action.dart';
import '../../../p2p/presentation/providers/p2p_providers.dart';
import '../../catalog_routes.dart';
import '../providers/used_options_providers.dart';
import 'booklist_price_cell.dart';

/// One Book on a Booklist with its New, Certified Used and Used prices.
/// Certified Used goes in the cart on tap; Used and the row open the book
/// page. [onRemove] shows a remove button (a Reader's own list).
class BooklistBookRow extends ConsumerWidget {
  const BooklistBookRow({super.key, required this.book, this.onRemove});

  final Book book;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    void open() => context.push(CatalogRoutes.bookDetailFor(book.id));
    final certified = ref
        .watch(usedOptionsProvider(book.id))
        .whenData((o) => o.certifiedUsed);
    final used = ref
        .watch(listingsForBookProvider(book.id))
        .whenData(
          (all) => all.isEmpty
              ? null
              : all.map((l) => l.priceBdt).reduce((a, b) => a < b ? a : b),
        );
    return SurfaceCard(
      clip: true,
      child: InkWell(
        onTap: open,
        child: Padding(
          padding: const EdgeInsets.all(Insets.sm + 2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: Insets.md,
            children: [
              SizedBox(
                width: 46,
                child: CoverArt(
                  title: book.coverLabel,
                  seed: book.coverSeed,
                  fontSize: 6,
                  radius: Radii.sm,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 6,
                  children: [
                    Text(
                      book.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.texts.titleSmall,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: BooklistPriceCell(
                            label: l10n.booklistPriceNew,
                            price: AsyncData(book.fromPriceBdt),
                            caption: l10n.stockStatus(book.cardStockStatus),
                          ),
                        ),
                        Expanded(
                          child: BooklistPriceCell(
                            label: l10n.booklistPriceCertified,
                            price: certified.whenData((c) => c?.priceBdt),
                            onTap: () => ref.addToCart(
                              context,
                              CartItemRef.certifiedUsed(certified.value!.id),
                            ),
                          ),
                        ),
                        Expanded(
                          child: BooklistPriceCell(
                            label: l10n.booklistPriceUsed,
                            price: used,
                            onTap: open,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (onRemove != null)
                IconButton(
                  icon: const Icon(Icons.close_rounded, size: 18),
                  tooltip: l10n.booklistRemoveBook,
                  onPressed: onRemove,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
