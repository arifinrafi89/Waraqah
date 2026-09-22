import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/models/profile.dart';
import '../../../../core/providers/book_providers.dart';
import '../../../../core/providers/profile_providers.dart';
import '../../../cart/presentation/controllers/cart_controller.dart';

/// Checkout page: the current profile, book lookup and cart subtotal/total
/// the form and order summary render with.
final checkoutPageProvider = FutureProvider<
    ({
      Profile profile,
      Map<String, Book> books,
      double subtotal,
      double total,
    })>((ref) async {
  final profile = await ref.watch(currentProfileProvider.future);
  final books = {
    for (final b in await ref.watch(booksProvider.future)) b.id: b,
  };
  final subtotal = await ref.watch(cartSubtotalProvider.future);
  final total = await ref.watch(cartTotalProvider.future);
  return (profile: profile, books: books, subtotal: subtotal, total: total);
});
