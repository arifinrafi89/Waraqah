import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/book.dart';
import '../../../../core/models/edition.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../cart/cart_routes.dart';
import '../../../cart/domain/entities/cart_item_ref.dart';
import '../../../cart/presentation/providers/cart_providers.dart';

/// A Booklist's pinned "Add whole list to cart": each orderable Book's
/// From-Edition goes in the cart, then one snackbar says how many went in
/// and how many are out of stock. Certified Used is a per-row tap.
class AddListToCartBar extends ConsumerWidget {
  const AddListToCartBar({super.key, required this.books});

  final List<Book> books;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Container(
    padding: const EdgeInsets.all(Insets.md),
    decoration: BoxDecoration(
      color: context.palette.surface,
      border: Border(top: BorderSide(color: context.palette.border)),
    ),
    child: PrimaryButton(
      label: AppL10n.of(context)!.booklistAddAll,
      icon: Icons.add_shopping_cart_rounded,
      isBusy: ref.watch(addingToCartProvider),
      onPressed: books.isEmpty ? null : () => _addAll(context, ref),
    ),
  );

  Future<void> _addAll(BuildContext context, WidgetRef ref) async {
    final l10n = AppL10n.of(context)!;
    final messenger = ScaffoldMessenger.of(context);
    final router = GoRouter.of(context);
    final busy = ref.read(addingToCartProvider.notifier);
    final cart = ref.read(cartProvider.notifier);
    var added = 0;
    var outOfStock = 0;
    var failed = false;
    busy.select(true);
    try {
      for (final book in books) {
        final edition = book.fromEdition;
        if (!edition.isOrderable) {
          outOfStock++;
        } else if (await cart.add(CartItemRef.edition(edition.id))) {
          added++;
        }
      }
    } catch (_) {
      failed = true;
    } finally {
      busy.select(false);
    }
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        content: Text(
          failed
              ? l10n.commonSomethingWentWrong
              : [
                  l10n.booklistAdded(added),
                  if (outOfStock > 0) l10n.booklistOutOfStock(outOfStock),
                ].join(' · '),
        ),
        action: added > 0
            ? SnackBarAction(
                label: l10n.cartView,
                onPressed: () => router.push(CartRoutes.cart),
              )
            : null,
        persist: false,
      ),
    );
  }
}
