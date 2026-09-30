import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../cart/presentation/providers/cart_providers.dart';
import '../../../loyalty/presentation/providers/points_providers.dart';
import '../../checkout_routes.dart';
import '../../domain/entities/payment_method.dart';
import '../../domain/repositories/checkout_repository.dart';
import '../providers/checkout_providers.dart';
import '../providers/gift_providers.dart';

extension PlaceOrderAction on WidgetRef {
  /// Cash on delivery needs something to deliver; a gift needs a name.
  bool get canPlaceOrder {
    final totals = watch(checkoutTotalsProvider);
    final payment = watch(paymentMethodProvider);
    final gift = watch(giftProvider);
    if (totals == null) return false;
    if (!totals.needsDelivery) return payment != PaymentMethod.cashOnDelivery;
    return gift == null || gift.isReady;
  }

  /// Places the order, then shows the confirmation page. The server has
  /// emptied the cart, so it is loaded again.
  Future<void> placeOrder(BuildContext context) async {
    final address = read(chosenAddressProvider);
    if (address == null) return;
    final messenger = ScaffoldMessenger.of(context);
    final router = GoRouter.of(context);
    final error = AppL10n.of(context)!.commonSomethingWentWrong;
    final busy = read(placingOrderProvider.notifier);
    final request = PlaceOrderRequest(
      addressId: address.id,
      payment: read(paymentMethodProvider),
      couponCode: read(couponProvider).value?.code,
      usePoints: read(usePointsProvider),
      gift: read(checkoutTotalsProvider)?.needsDelivery == true
          ? read(giftProvider)
          : null,
    );

    busy.select(true);
    try {
      final receipt = await read(placeOrderProvider).call(request);
      read(lastReceiptProvider.notifier).select(receipt);
      read(couponProvider.notifier).remove();
      read(usePointsProvider.notifier).select(false);
      read(giftProvider.notifier).clear();
      invalidate(cartProvider);
      invalidate(pointsProvider);
      router.go(CheckoutRoutes.placed);
    } catch (_) {
      messenger.showSnackBar(SnackBar(content: Text(error)));
    } finally {
      busy.select(false);
    }
  }
}
