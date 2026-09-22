import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/book_providers.dart';
import '../../domain/models/cart_item.dart';

/// Session-scoped cart, seeded so the badge and page are populated on first
/// open. Not persisted; restarting the app empties the cart (ADR-0001).
final cartItemsProvider = StateProvider<List<CartItem>>(
  (ref) => const [
    CartItem(bookId: 'book-1', quantity: 1),
    CartItem(bookId: 'book-2', quantity: 1),
  ],
);

void addToCart(WidgetRef ref, String bookId) {
  final items = ref.read(cartItemsProvider);
  final index = items.indexWhere((item) => item.bookId == bookId);
  if (index == -1) {
    ref.read(cartItemsProvider.notifier).state = [
      ...items,
      CartItem(bookId: bookId, quantity: 1),
    ];
    return;
  }
  ref.read(cartItemsProvider.notifier).state = [
    for (final item in items)
      if (item.bookId == bookId) item.copyWith(quantity: item.quantity + 1) else item,
  ];
}

void setQuantity(WidgetRef ref, String bookId, int quantity) {
  final items = ref.read(cartItemsProvider);
  if (quantity <= 0) {
    ref.read(cartItemsProvider.notifier).state =
        items.where((item) => item.bookId != bookId).toList();
    return;
  }
  ref.read(cartItemsProvider.notifier).state = [
    for (final item in items)
      if (item.bookId == bookId) item.copyWith(quantity: quantity) else item,
  ];
}

void removeFromCart(WidgetRef ref, String bookId) {
  final items = ref.read(cartItemsProvider);
  ref.read(cartItemsProvider.notifier).state =
      items.where((item) => item.bookId != bookId).toList();
}

void clearCart(WidgetRef ref) {
  ref.read(cartItemsProvider.notifier).state = const [];
}

final cartCountProvider = Provider<int>(
  (ref) => ref
      .watch(cartItemsProvider)
      .fold(0, (total, item) => total + item.quantity),
);

final cartSubtotalProvider = Provider<double>((ref) {
  final books = {for (final book in ref.watch(booksProvider)) book.id: book};
  return ref.watch(cartItemsProvider).fold(0.0, (total, item) {
    final book = books[item.bookId];
    if (book == null) return total;
    return total + book.price * item.quantity;
  });
});
