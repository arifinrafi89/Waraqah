import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/models/edition.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../alerts/presentation/widgets/alert_buttons.dart';
import '../../../cart/domain/entities/cart_item_ref.dart';
import '../../../cart/presentation/providers/cart_providers.dart';
import '../../../cart/presentation/widgets/add_to_cart_action.dart';
import '../providers/edition_providers.dart';
import 'edition_price.dart';

/// Pinned bottom bar: the chosen Edition's price, an Add to cart icon and a
/// wide Buy now button, which adds it and opens the cart (both wait while an
/// add is on its way). A sold-out Edition gets "Notify me" instead.
class AddToCartBar extends ConsumerWidget {
  const AddToCartBar({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final edition = book.chosenEdition(
      ref.watch(selectedEditionIdProvider(book.id)),
    );
    final isAdding = ref.watch(addingToCartProvider);
    final item = CartItemRef.edition(edition.id);
    final canAdd = edition.isOrderable && !isAdding;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surface,
        border: Border(top: BorderSide(color: palette.border)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            Insets.screen,
            Insets.md,
            Insets.screen,
            Insets.md,
          ),
          child: Row(
            spacing: Insets.md,
            children: [
              EditionPrice(
                edition: edition,
                size: 18,
                alignment: CrossAxisAlignment.start,
              ),
              if (!edition.isOrderable)
                Expanded(
                  child: NotifyMeButton(bookId: book.id, edition: edition),
                )
              else ...[
                IconButton.outlined(
                  tooltip: l10n.bookDetailAddToCart,
                  onPressed: canAdd ? () => ref.addToCart(context, item) : null,
                  icon: const Icon(Icons.add_shopping_cart_rounded),
                  style: IconButton.styleFrom(
                    fixedSize: const Size.square(Sizes.buttonHeight),
                    foregroundColor: palette.accent,
                    side: BorderSide(color: palette.border),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Radii.md),
                    ),
                  ),
                ),
                Expanded(
                  child: PrimaryButton(
                    label: edition.stock == 0 && edition.isPreorder
                        ? l10n.offerPreorderNow
                        : l10n.bookBuyNow,
                    isBusy: isAdding,
                    onPressed: () =>
                        ref.addToCart(context, item, openCart: true),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
