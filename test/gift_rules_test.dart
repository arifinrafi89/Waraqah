import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/core/models/edition.dart';
import 'package:waraqah/features/cart/domain/entities/cart.dart';
import 'package:waraqah/features/cart/domain/entities/cart_line.dart';
import 'package:waraqah/features/catalog/domain/entities/delivery_area.dart';
import 'package:waraqah/features/checkout/domain/entities/checkout_totals.dart';
import 'package:waraqah/features/checkout/domain/entities/gift.dart';

Cart _cart(BookFormat format) => Cart(
  lines: [
    CartLine(
      id: 'l1',
      kind: CartItemKind.edition,
      itemId: 'e1',
      bookId: 'b1',
      title: 'T',
      author: 'A',
      unitPriceBdt: 500,
      quantity: 1,
      maxQuantity: 10,
      format: format,
    ),
  ],
);

void main() {
  test('gift wrap adds ৳40, only when something is delivered', () {
    const area = DeliveryArea.insideDhaka;
    final printed = CheckoutTotals.of(
      _cart(BookFormat.paperback),
      area,
      giftWrap: true,
    );
    expect((printed.giftWrapBdt, printed.totalBdt), (40, 600));
    final ebook = CheckoutTotals.of(
      _cart(BookFormat.ebook),
      area,
      giftWrap: true,
    );
    expect((ebook.giftWrapBdt, ebook.totalBdt), (0, 500));
  });

  test('a gift needs a name for the card', () {
    expect(const Gift(recipientName: '  ').isReady, isFalse);
    expect(const Gift(recipientName: 'Nabila').isReady, isTrue);
  });
}
