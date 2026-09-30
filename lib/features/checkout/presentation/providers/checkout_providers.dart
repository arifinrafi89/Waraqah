import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../../../core/state/selection_notifier.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../cart/domain/entities/cart.dart';
import '../../../cart/presentation/providers/cart_providers.dart';
import '../../../loyalty/presentation/providers/points_providers.dart';
import '../../data/repositories/checkout_repository_impl.dart';
import '../../data/sources/checkout_remote_source.dart';
import '../../domain/entities/checkout_totals.dart';
import '../../domain/entities/coupon.dart';
import '../../domain/entities/order_receipt.dart';
import '../../domain/entities/payment_method.dart';
import '../../domain/entities/saved_address.dart';
import '../../domain/repositories/checkout_repository.dart';
import '../../domain/usecases/apply_coupon.dart';
import '../../domain/usecases/get_addresses.dart';
import '../../domain/usecases/place_order.dart';

final checkoutRepositoryProvider = Provider<CheckoutRepository>(
  (ref) => CheckoutRepositoryImpl(CheckoutRemoteSource(ref.watch(dioProvider))),
);

final getAddressesProvider = Provider<GetAddresses>(
  (ref) => GetAddresses(ref.watch(checkoutRepositoryProvider)),
);

final applyCouponProvider = Provider<ApplyCoupon>(
  (ref) => ApplyCoupon(ref.watch(checkoutRepositoryProvider)),
);

final placeOrderProvider = Provider<PlaceOrder>(
  (ref) => PlaceOrder(ref.watch(checkoutRepositoryProvider)),
);

/// The reader's saved addresses, once the cart and points have loaded too
/// (all three at once), so the page has everything before it stops
/// shimmering.
final checkoutAddressesProvider = FutureProvider<List<SavedAddress>>((
  ref,
) async {
  final (_, _, addresses) = await (
    ref.watch(cartProvider.future),
    ref.watch(pointsProvider.future),
    ref.watch(getAddressesProvider).call(const NoParams()),
  ).wait;
  return addresses;
});

final chosenAddressIdProvider = selectionProvider<String?>(null);

/// The address the reader picked, or their first one.
final chosenAddressProvider = Provider<SavedAddress?>((ref) {
  final addresses = ref.watch(checkoutAddressesProvider).value ?? const [];
  final id = ref.watch(chosenAddressIdProvider);
  return addresses.where((a) => a.id == id).firstOrNull ??
      addresses.firstOrNull;
});

final paymentMethodProvider = selectionProvider<PaymentMethod>(
  PaymentMethod.bkash,
);

/// The coupon in use: `null` for none, an error when a code was turned down.
class CouponNotifier extends AsyncNotifier<Coupon?> {
  @override
  Future<Coupon?> build() async => null;

  Future<void> apply(String code) async {
    final subtotal = ref.read(cartProvider).value?.subtotalBdt ?? 0;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref
          .read(applyCouponProvider)
          .call(ApplyCouponParams(code: code, subtotalBdt: subtotal)),
    );
  }

  void remove() => state = const AsyncData(null);
}

final couponProvider = AsyncNotifierProvider<CouponNotifier, Coupon?>(
  CouponNotifier.new,
);

/// What the order costs right now; `null` until the cart and addresses load.
final checkoutTotalsProvider = Provider<CheckoutTotals?>((ref) {
  final cart = ref.watch(cartProvider).value;
  final address = ref.watch(chosenAddressProvider);
  if (cart == null || address == null) return null;
  return CheckoutTotals.of(
    cart,
    address.area,
    coupon: ref.watch(couponProvider).value,
    pointsBalance: ref.watch(pointsProvider).value?.balance ?? 0,
    usePoints: ref.watch(usePointsProvider),
  );
});

/// Whether the reader chose to pay part of the books with points.
final usePointsProvider = selectionProvider<bool>(false);

final placingOrderProvider = selectionProvider<bool>(false);

/// The order just placed, for the confirmation page.
final lastReceiptProvider = selectionProvider<OrderReceipt?>(null);
