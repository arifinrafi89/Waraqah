import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../l10n/app_localizations.dart';
import '../../cart_routes.dart';
import '../../domain/entities/cart_item_ref.dart';
import '../providers/cart_providers.dart';

/// The one way any page puts something in the cart:
///
/// ```dart
/// ref.addToCart(context, CartItemRef.edition(edition.id));
/// ```
///
/// It tells the reader what happened ("Added to cart · View cart", or why it
/// couldn't). With [openCart] (Buy now) it goes straight to the cart instead.
extension AddToCartAction on WidgetRef {
  Future<void> addToCart(
    BuildContext context,
    CartItemRef item, {
    bool openCart = false,
  }) async {
    final l10n = AppL10n.of(context)!;
    final messenger = ScaffoldMessenger.of(context);
    final router = GoRouter.of(context);
    final busy = read(addingToCartProvider.notifier);
    final cart = read(cartProvider.notifier);

    busy.select(true);
    bool? added;
    try {
      added = await cart.add(item);
    } catch (_) {
      added = null;
    } finally {
      busy.select(false);
    }

    messenger.hideCurrentSnackBar();
    if (added != null && openCart) {
      router.push(CartRoutes.cart);
      if (added) return;
    }
    messenger.showSnackBar(
      SnackBar(
        content: Text(switch (added) {
          true => l10n.cartAdded,
          false => l10n.cartLimitReached,
          null => l10n.commonSomethingWentWrong,
        }),
        action: added == true
            ? SnackBarAction(
                label: l10n.cartView,
                onPressed: () => router.push(CartRoutes.cart),
              )
            : null,
      ),
    );
  }
}
