import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/models/edition.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/edition_providers.dart';
import 'edition_price.dart';

/// Pinned bottom bar: the chosen Edition's price, an Add to cart icon and a
/// wide Buy now button. Both are disabled when that Edition can't be ordered.
///
/// The cart is the next piece of work, so for now both say so instead of
/// pretending to add anything.
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
    final onPressed = edition.isOrderable ? () => _comingSoon(context) : null;
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
              IconButton.outlined(
                tooltip: l10n.bookDetailAddToCart,
                onPressed: onPressed,
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
                  label: l10n.bookBuyNow,
                  onPressed: onPressed,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _comingSoon(BuildContext context) => ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(content: Text(AppL10n.of(context)!.bookDetailCartSoon)),
    );
}
