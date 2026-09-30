import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/features/cart/data/models/cart_model.dart';
import 'package:waraqah/features/cart/data/sources/cart_fake_store.dart';
import 'package:waraqah/features/cart/domain/entities/cart.dart';
import 'package:waraqah/features/cart/domain/entities/cart_line.dart';
import 'package:waraqah/features/catalog/data/sources/book_fixtures.dart';
import 'package:waraqah/features/catalog/data/sources/used_options_fixtures.dart';
import 'package:waraqah/features/p2p/domain/entities/p2p_listing.dart';

void main() {
  group('resale estimate', () {
    test('about 45% of the cheapest printed edition, to the nearest ৳10', () {
      final atomic = BookFixtures.all.firstWhere((b) => b.id == 'bk-atomic');
      // Paperback ৳590 × 0.45 = 265.5 → ৳270.
      expect(UsedOptionsFixtures.resaleValue(atomic), 270);
    });
  });

  group('used copies in the cart', () {
    late CartFakeStore store;
    Cart cart() => CartModel.fromJson(store.toJson()).toEntity();
    setUp(() => store = CartFakeStore());

    test('a Certified Used copy goes in once, priced against new', () {
      store
        ..add('certifiedUsed', 'cu-atomic-1')
        ..add('certifiedUsed', 'cu-atomic-1');

      final line = cart().lines.single;
      expect(line.kind, CartItemKind.certifiedUsed);
      expect(line.condition, BookCondition.veryGood);
      expect((line.quantity, line.maxQuantity), (1, 1));
      // ৳380 used against ৳590 new.
      expect(line.savingsBdt, 210);
    });

    test("readers' listings don't go in the cart", () {
      store
        ..add('listing', 'cu-atomic-1')
        ..add('listing', 'p2p-1')
        ..add('certifiedUsed', 'nope');
      expect(cart().isEmpty, isTrue);
    });
  });
}
