import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/book.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../cart/domain/entities/cart_item_ref.dart';
import '../../../cart/presentation/widgets/add_to_cart_action.dart';
import '../../wishlist_routes.dart';
import '../providers/wishlist_providers.dart';

/// The one way any page saves a book for later or takes it off:
///
/// ```dart
/// ref.setWishlisted(context, book.id, saved: true, book: book);
/// ```
///
/// Tells the reader what happened, with a View button after saving. Pass
/// [book] when you have it so the heart fills in straight away.
extension WishlistAction on WidgetRef {
  Future<bool> setWishlisted(
    BuildContext context,
    String bookId, {
    required bool saved,
    Book? book,
    String? savedMessage,
  }) async {
    final l10n = AppL10n.of(context)!;
    final messenger = ScaffoldMessenger.of(context);
    final router = GoRouter.of(context);
    final wishlist = read(wishlistProvider.notifier);

    var ok = true;
    try {
      await wishlist.set(bookId, saved: saved, book: book);
    } catch (_) {
      ok = false;
    }

    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            !ok
                ? l10n.commonSomethingWentWrong
                : saved
                ? savedMessage ?? l10n.wishlistSaved
                : l10n.wishlistRemoved,
          ),
          action: ok && saved
              ? SnackBarAction(
                  label: l10n.wishlistView,
                  onPressed: () => router.push(WishlistRoutes.wishlist),
                )
              : null,
        ),
      );
    return ok;
  }

  /// Adds the book's cheapest edition to the cart, then takes it off the
  /// wishlist. The cart's own message says how it went.
  Future<void> moveToCart(BuildContext context, Book book) async {
    final wishlist = read(wishlistProvider.notifier);
    final item = CartItemRef.edition(book.fromEdition.id);
    if (await addToCart(context, item)) {
      await wishlist.set(book.id, saved: false);
    }
  }
}
