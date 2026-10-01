import 'package:freezed_annotation/freezed_annotation.dart';

import 'cart_item_ref.dart';
import 'cart_line.dart';

part 'cart.freezed.dart';

/// The reader's cart. Delivery fees and coupons are added at checkout.
@freezed
abstract class Cart with _$Cart {
  const factory Cart({@Default(<CartLine>[]) List<CartLine> lines}) = _Cart;
}

extension CartX on Cart {
  bool get isEmpty => lines.isEmpty;

  /// Copies, not lines: two of one book count as two.
  int get itemCount => lines.fold(0, (sum, line) => sum + line.quantity);

  int get subtotalBdt => lines.fold(0, (sum, line) => sum + line.totalBdt);

  int get savingsBdt => lines.fold(0, (sum, line) => sum + line.savingsBdt);

  CartLine? lineFor(CartItemRef item) => lines
      .where((line) => line.kind == item.kind && line.itemId == item.id)
      .firstOrNull;

  Cart withQuantity(String lineId, int quantity) => copyWith(
    lines: [
      for (final line in lines)
        line.id == lineId ? line.copyWith(quantity: quantity) : line,
    ],
  );

  Cart without(String lineId) =>
      copyWith(lines: [...lines.where((line) => line.id != lineId)]);
}
