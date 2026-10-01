import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/cover_art.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/catalog_routes.dart';
import '../../domain/entities/scanned_book.dart';
import 'scan_actions.dart';

/// The Book the barcode belongs to: open its page, or sell a copy.
class ScanFoundCard extends ConsumerWidget {
  const ScanFoundCard({super.key, required this.book, required this.forSell});

  final ScannedBook book;
  final bool forSell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final dim = AppFonts.ui(size: 12, color: palette.textDim);
    final sell = PrimaryButton(
      label: l10n.scanSellCopy,
      icon: Icons.sell_outlined,
      onPressed: () => ref.sellCopy(context, book, forSell: forSell),
    );
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: Insets.md,
        children: [
          Row(
            spacing: Insets.md,
            children: [
              SizedBox(
                width: 56,
                child: CoverArt(
                  title: book.title,
                  seed: book.coverSeed,
                  aspectRatio: 2 / 3,
                  fontSize: 8,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 3,
                  children: [
                    Text(book.title, style: context.texts.titleSmall),
                    Text(book.author, style: dim),
                    Text(l10n.scanIsbn(book.isbn), style: dim),
                    if (book.newPriceBdt case final price?)
                      Text(
                        l10n.scanNewFrom(Bdt.format(price)),
                        style: AppFonts.ui(size: 12.5, color: palette.accent),
                      ),
                  ],
                ),
              ),
            ],
          ),
          if (forSell) sell,
          SecondaryButton(
            label: l10n.scanOpenBook,
            onPressed: () =>
                context.push(CatalogRoutes.bookDetailFor(book.bookId)),
          ),
          if (!forSell) sell,
        ],
      ),
    );
  }
}
