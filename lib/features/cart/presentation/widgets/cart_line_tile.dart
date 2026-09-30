import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/cover_art.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../core/widgets/tags.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/catalog_routes.dart';
import '../../domain/entities/cart_line.dart';
import '../providers/cart_providers.dart';
import 'cart_labels.dart';
import 'cart_line_price.dart';
import 'quantity_stepper.dart';

/// One cart line: cover, title, edition, line price and the quantity stepper.
/// The cover and title open the book's page; the price row never does, so a
/// tap on a disabled + can't fall through to it.
class CartLineTile extends ConsumerWidget {
  const CartLineTile({super.key, required this.line});

  final CartLine line;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final faint = AppFonts.ui(size: 11, color: palette.textFaint);
    void openBook() => context.push(CatalogRoutes.bookDetailFor(line.bookId));
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
                title: line.title,
                seed: line.coverSeed,
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
                        line.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: context.texts.titleSmall,
                      ),
                      Text(line.author, style: faint),
                      Wrap(
                        spacing: 6,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(l10n.cartLineEdition(line), style: faint),
                          if (line.isPreorder)
                            MiniTag(label: l10n.stockPreorder),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    Expanded(child: CartLinePrice(line: line)),
                    QuantityStepper(
                      quantity: line.quantity,
                      max: line.maxQuantity,
                      onChanged: (quantity) => _change(context, ref, quantity),
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

  Future<void> _change(BuildContext context, WidgetRef ref, int quantity) async {
    final messenger = ScaffoldMessenger.of(context);
    final error = AppL10n.of(context)!.commonSomethingWentWrong;
    try {
      await ref.read(cartProvider.notifier).setQuantity(line.id, quantity);
    } catch (_) {
      messenger.showSnackBar(SnackBar(content: Text(error)));
    }
  }
}
