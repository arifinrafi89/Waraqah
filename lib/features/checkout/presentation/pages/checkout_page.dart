import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../cart/cart_routes.dart';
import '../../../cart/domain/entities/cart.dart';
import '../../../cart/presentation/providers/cart_providers.dart';
import '../../../profile/domain/entities/saved_address.dart';
import '../providers/checkout_providers.dart';
import '../widgets/address_picker.dart';
import '../widgets/checkout_skeleton.dart';
import '../widgets/checkout_step_header.dart';
import '../widgets/coupon_field.dart';
import '../widgets/delivery_card.dart';
import '../widgets/gift_card.dart';
import '../widgets/order_summary_card.dart';
import '../widgets/payment_picker.dart';
import '../widgets/place_order_bar.dart';
import '../widgets/points_card.dart';
import '../widgets/wallet_card.dart';

/// `/checkout`: address, delivery, payment, then Place order. One page with
/// numbered steps, so the reader sees the whole order before paying.
class CheckoutPage extends ConsumerWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final addresses = ref.watch(checkoutAddressesProvider);
    final totals = ref.watch(checkoutTotalsProvider);
    final cart = ref.watch(cartProvider).value;
    final canPay = totals != null && cart != null && !cart.isEmpty;
    return Scaffold(
      bottomNavigationBar: canPay ? PlaceOrderBar(totals: totals) : null,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(Insets.md, 6, Insets.md, 10),
              child: Row(
                spacing: Insets.md,
                children: [
                  AppIconButton(
                    icon: Icons.arrow_back_rounded,
                    onPressed: () => context.canPop()
                        ? context.pop()
                        : context.go(CartRoutes.cart),
                  ),
                  Text(l10n.checkoutTitle, style: context.texts.titleLarge),
                ],
              ),
            ),
            Expanded(
              child: AsyncView(
                value: addresses,
                errorLabel: l10n.commonSomethingWentWrong,
                retryLabel: l10n.commonRetry,
                onRetry: () => ref.invalidate(checkoutAddressesProvider),
                skeleton: const CheckoutSkeleton(),
                builder: (addresses) => cart == null || cart.isEmpty
                    ? Center(child: Text(l10n.cartEmptyTitle))
                    : _Steps(addresses: addresses, cart: cart),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Steps extends ConsumerWidget {
  const _Steps({required this.addresses, required this.cart});

  final List<SavedAddress> addresses;
  final Cart cart;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final totals = ref.watch(checkoutTotalsProvider);
    const gap = SizedBox(height: Insets.xl);
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        Insets.screen,
        0,
        Insets.screen,
        Insets.xl,
      ),
      children: [
        CheckoutStepHeader(step: 1, title: l10n.checkoutStepAddress),
        AddressPicker(addresses: addresses),
        gap,
        CheckoutStepHeader(step: 2, title: l10n.checkoutStepDelivery),
        const DeliveryCard(),
        const GiftCard(),
        gap,
        CheckoutStepHeader(step: 3, title: l10n.checkoutStepPayment),
        const PaymentPicker(),
        gap,
        const CouponField(),
        const SizedBox(height: Insets.md),
        const PointsCard(),
        const WalletCard(),
        const SizedBox(height: Insets.md),
        if (totals != null)
          OrderSummaryCard(totals: totals, itemCount: cart.itemCount),
      ],
    );
  }
}
