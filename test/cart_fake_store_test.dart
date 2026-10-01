import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/features/cart/data/models/cart_model.dart';
import 'package:waraqah/features/cart/data/sources/cart_fake_store.dart';
import 'package:waraqah/features/cart/domain/entities/cart.dart';

/// Seed editions: Atomic Habits paperback (৳590, list ৳650, 30 in stock) and
/// hardcover (৳890, 2 in stock); the Sapiens eBook; a pre-order with no
/// stock; and a Calculus paperback that's out of stock.
const _paperback = 'bk-atomic-pb-en';
const _hardcover = 'bk-atomic-hc-en';
const _ebook = 'bk-sapiens-eb-en';
const _preorder = 'bk-bidayah-hc-bn';
const _soldOut = 'bk-calculus-pb-en';

void main() {
  late CartFakeStore store;
  Cart cart() => CartModel.fromJson(store.toJson()).toEntity();

  setUp(() => store = CartFakeStore());

  test('adding an edition makes a line with its book and price', () {
    store.add('edition', _paperback);

    final line = cart().lines.single;
    expect(line.title, 'Atomic Habits');
    expect(line.bookId, 'bk-atomic');
    expect(
      (line.unitPriceBdt, line.listPriceBdt, line.quantity),
      (590, 650, 1),
    );
  });

  test('adding it again adds a copy, up to the stock', () {
    for (var i = 0; i < 4; i++) {
      store.add('edition', _hardcover);
    }
    expect(cart().lines.single.quantity, 2);
  });

  test('one copy of an eBook at most', () {
    store
      ..add('edition', _ebook)
      ..add('edition', _ebook);
    expect(cart().lines.single.quantity, 1);
  });

  test('pre-orders can be added and are marked', () {
    store.add('edition', _preorder);
    final line = cart().lines.single;
    expect(line.isPreorder, isTrue);
    expect(line.maxQuantity, CartFakeStore.perOrderCap);
  });

  test('sold-out editions, unknown ids and used items are not added yet', () {
    store
      ..add('edition', _soldOut)
      ..add('edition', 'nope')
      ..add('listing', 'ls-1');
    expect(cart().isEmpty, isTrue);
  });

  test('quantities are kept between 1 and the most per order', () {
    store.add('edition', _hardcover);
    final id = cart().lines.single.id;

    store.setQuantity(id, 9);
    expect(cart().lines.single.quantity, 2);
    store.setQuantity(id, 0);
    expect(cart().lines.single.quantity, 1);
  });

  test('removing a line empties it out', () {
    store.add('edition', _paperback);
    store.remove(cart().lines.single.id);
    expect(cart().isEmpty, isTrue);
  });
}
