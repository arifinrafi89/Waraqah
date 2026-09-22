import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/book_providers.dart';
import '../../domain/models/cart_item.dart';

class CartController extends Notifier<List<CartItem>> {
  /// Session-scoped cart, seeded so the badge and page are populated on first
  /// open. Not persisted; restarting the app empties the cart (ADR-0001).
  @override
  List<CartItem> build() => const [
        CartItem(bookId: 'book-1', quantity: 1),
        CartItem(bookId: 'book-2', quantity: 1),
      ];

  void add(String bookId) {
    final index = state.indexWhere((item) => item.bookId == bookId);
    if (index == -1) {
      state = [...state, CartItem(bookId: bookId, quantity: 1)];
      return;
    }
    state = [
      for (final item in state)
        if (item.bookId == bookId) item.copyWith(quantity: item.quantity + 1) else item,
    ];
  }

  void setQuantity(String bookId, int quantity) {
    if (quantity <= 0) {
      state = state.where((item) => item.bookId != bookId).toList();
      return;
    }
    state = [
      for (final item in state)
        if (item.bookId == bookId) item.copyWith(quantity: quantity) else item,
    ];
  }

  void remove(String bookId) {
    state = state.where((item) => item.bookId != bookId).toList();
  }

  void clear() => state = const [];
}

final cartItemsProvider =
    NotifierProvider<CartController, List<CartItem>>(CartController.new);

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

final cartTotalProvider = Provider<double>(
  (ref) => ref.watch(cartSubtotalProvider) + deliveryFee,
);
