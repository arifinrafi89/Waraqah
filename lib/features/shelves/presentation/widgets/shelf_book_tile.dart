import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/cover_art.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/catalog_routes.dart';
import '../../domain/entities/shelf_entry.dart';
import 'shelf_actions.dart';
import 'shelf_labels.dart';
import 'shelf_sheet.dart';

/// One Book on a shelf: cover, title, Author and when it was added or
/// finished. Opens the book page; the menu moves it or takes it off.
class ShelfBookTile extends ConsumerWidget {
  const ShelfBookTile({super.key, required this.entry});

  final ShelfEntry entry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final palette = context.palette;
    final book = entry.book;
    final date = DateFormat.yMMMd(
      Localizations.localeOf(context).toLanguageTag(),
    ).format(entry.finishedAt ?? entry.addedAt);
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.sm),
      child: InkWell(
        borderRadius: BorderRadius.circular(Radii.sm),
        onTap: () => context.push(CatalogRoutes.bookDetailFor(book.id)),
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
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 2,
                children: [
                  Text(book.title, style: context.texts.titleSmall),
                  Text(
                    book.author,
                    style: AppFonts.ui(size: 12, color: palette.textDim),
                  ),
                  Text(
                    entry.finishedAt == null
                        ? l10n.shelfAddedOn(date)
                        : l10n.shelfFinishedOn(date),
                    style: AppFonts.ui(size: 11, color: palette.textFaint),
                  ),
                ],
              ),
            ),
            PopupMenuButton<ShelfChoice>(
              tooltip: l10n.shelfMoveTo,
              icon: const Icon(Icons.more_vert_rounded),
              onSelected: (c) => ref.moveToShelf(context, book.id, c.shelf),
              itemBuilder: (_) => [
                for (final shelf in Shelf.values)
                  if (shelf != entry.shelf)
                    PopupMenuItem(
                      value: (shelf: shelf),
                      child: Text(l10n.shelfName(shelf)),
                    ),
                PopupMenuItem(
                  value: (shelf: null),
                  child: Text(l10n.shelfRemove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
