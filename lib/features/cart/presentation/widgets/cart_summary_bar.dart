import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../checkout/checkout_routes.dart';
import '../../domain/entities/cart.dart';

/// Pinned under the cart: subtotal, what the reader saves, and Checkout,
/// which asks guests to log in first.
class CartSummaryBar extends StatelessWidget {
  const CartSummaryBar({super.key, required this.cart});

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surface,
        border: Border(top: BorderSide(color: palette.border)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            Insets.screen,
            Insets.md,
            Insets.screen,
            Insets.md,
          ),
          child: Row(
            spacing: Insets.md,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      l10n.cartSubtotal,
                      style: AppFonts.ui(size: 11, color: palette.textFaint),
                    ),
                    Text(
                      Bdt.format(cart.subtotalBdt),
                      style: AppFonts.numeric(size: 18, color: palette.text),
                    ),
                    if (cart.savingsBdt > 0)
                      Text(
                        l10n.cartYouSave(Bdt.format(cart.savingsBdt)),
                        style: AppFonts.ui(
                          size: 11,
                          weight: FontWeight.w700,
                          color: palette.accent,
                        ),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: PrimaryButton(
                  label: l10n.cartCheckout,
                  onPressed: () => context.push(CheckoutRoutes.checkout),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
