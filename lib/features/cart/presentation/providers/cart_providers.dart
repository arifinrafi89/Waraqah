import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../../../core/state/selection_notifier.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/cart_repository_impl.dart';
import '../../data/sources/cart_remote_source.dart';
import '../../domain/entities/cart.dart';
import '../../domain/entities/cart_item_ref.dart';
import '../../domain/repositories/cart_repository.dart';
import '../../domain/usecases/add_to_cart.dart';
import '../../domain/usecases/change_quantity.dart';
import '../../domain/usecases/get_cart.dart';

final cartRepositoryProvider = Provider<CartRepository>(
  (ref) => CartRepositoryImpl(CartRemoteSource(ref.watch(dioProvider))),
);

final getCartProvider = Provider<GetCart>(
  (ref) => GetCart(ref.watch(cartRepositoryProvider)),
);

final addToCartProvider = Provider<AddToCart>(
  (ref) => AddToCart(ref.watch(cartRepositoryProvider)),
);

final changeQuantityProvider = Provider<ChangeQuantity>(
  (ref) => ChangeQuantity(ref.watch(cartRepositoryProvider)),
);

/// The reader's cart. Other features add to it with `ref.addToCart(...)`
/// (see `add_to_cart_action.dart`) rather than calling this directly.
class CartNotifier extends AsyncNotifier<Cart> {
  @override
  Future<Cart> build() => ref.read(getCartProvider).call(const NoParams());

  /// Adds one copy of [item]. `false` when the cart couldn't take another:
  /// the most per order is already there, or the item can't be ordered.
  Future<bool> add(CartItemRef item) async {
    final before = (await future).lineFor(item)?.quantity ?? 0;
    final cart = await ref.read(addToCartProvider).call(item);
    state = AsyncData(cart);
    return (cart.lineFor(item)?.quantity ?? 0) > before;
  }

  /// Shows the new quantity straight away, then syncs with the server and
  /// puts the old cart back if that fails. Zero removes the line.
  Future<void> setQuantity(String lineId, int quantity) async {
    final previous = state.value;
    if (previous != null) {
      state = AsyncData(
        quantity <= 0
            ? previous.without(lineId)
            : previous.withQuantity(lineId, quantity),
      );
    }
    try {
      state = AsyncData(
        await ref
            .read(changeQuantityProvider)
            .call(ChangeQuantityParams(lineId: lineId, quantity: quantity)),
      );
    } catch (_) {
      if (previous != null) state = AsyncData(previous);
      rethrow;
    }
  }

  Future<void> remove(String lineId) => setQuantity(lineId, 0);
}

final cartProvider = AsyncNotifierProvider<CartNotifier, Cart>(
  CartNotifier.new,
);

/// Copies in the cart, for the badge on cart buttons. 0 while loading.
final cartCountProvider = Provider<int>(
  (ref) => ref.watch(cartProvider).value?.itemCount ?? 0,
);

/// True while an add-to-cart request is on its way, so buttons can show it.
final addingToCartProvider = selectionProvider<bool>(false);
