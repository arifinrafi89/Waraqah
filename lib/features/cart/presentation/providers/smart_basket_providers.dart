import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../catalog/presentation/providers/used_options_providers.dart';
import '../../../checkout/domain/entities/checkout_totals.dart';
import '../../domain/entities/smart_basket.dart';
import 'cart_providers.dart';

/// Savings for the cart as it is now: used copies of its new books, and
/// how far it is from free delivery. Loads the used copies of every book
/// in the cart at once.
final smartBasketProvider = FutureProvider<SmartBasket>((ref) async {
  final cart = await ref.watch(cartProvider.future);
  final bookIds = {for (final line in cart.lines) line.bookId};
  final options = await Future.wait([
    for (final id in bookIds) ref.watch(usedOptionsProvider(id).future),
  ]);
  return SmartBasket.of(
    cart,
    Map.fromIterables(bookIds, options),
    freeDeliveryFromBdt: CheckoutTotals.freeDeliveryFromBdt,
  );
});
