import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/cover_art.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../core/widgets/tags.dart';
import '../../../../l10n/app_localizations.dart';
import '../../catalog_admin_routes.dart';

/// One Book in Staff's list: cover, title, Author, From-price, total stock
/// and a Hidden tag. Tapping it opens the Book form.
class AdminBookRow extends StatelessWidget {
  const AdminBookRow({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final stock = book.editions.fold(0, (sum, e) => sum + e.stock);
    return SurfaceCard(
      clip: true,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () => context.push(CatalogAdminRoutes.bookFor(book.id)),
          child: Padding(
            padding: const EdgeInsets.all(10),
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
                      Text(book.author, style: context.texts.bodySmall),
                      Text(
                        '${Bdt.format(book.fromPriceBdt)} · '
                        '${l10n.adminCatalogInStock(stock)}',
                        style: context.texts.labelMedium,
                      ),
                      if (book.hidden) MiniTag(label: l10n.adminCatalogHidden),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
