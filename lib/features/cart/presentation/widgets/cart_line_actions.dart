import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../wishlist/presentation/widgets/wishlist_action.dart';
import '../../domain/entities/cart_line.dart';
import '../providers/cart_providers.dart';

/// What a cart line's buttons do, with a message when something fails.
extension CartLineActions on WidgetRef {
  Future<void> changeQuantity(
    BuildContext context,
    CartLine line,
    int quantity,
  ) async {
    final messenger = ScaffoldMessenger.of(context);
    final error = AppL10n.of(context)!.commonSomethingWentWrong;
    try {
      await read(cartProvider.notifier).setQuantity(line.id, quantity);
    } catch (_) {
      messenger.showSnackBar(SnackBar(content: Text(error)));
    }
  }

  /// Saves the book to the wishlist, then takes the line out of the cart.
  Future<void> saveForLater(BuildContext context, CartLine line) async {
    final cart = read(cartProvider.notifier);
    final saved = await setWishlisted(
      context,
      line.bookId,
      saved: true,
      savedMessage: AppL10n.of(context)!.cartMovedToWishlist,
    );
    if (saved) await cart.remove(line.id);
  }
}
