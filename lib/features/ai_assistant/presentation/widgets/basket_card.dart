import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../cart/cart_routes.dart';
import '../../../cart/domain/entities/cart_item_ref.dart';
import '../../../cart/presentation/providers/cart_providers.dart';
import '../../domain/entities/chat_message.dart';

/// Under a basket reply: the total, and Add all to cart.
class BasketCard extends ConsumerWidget {
  const BasketCard({super.key, required this.basket});

  final AssistantBasket basket;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: Insets.sm,
        children: [
          Text(
            l10n.aiBasketTotal(
              basket.editionIds.length,
              Bdt.format(basket.totalBdt),
            ),
            style: AppFonts.ui(
              size: 12,
              weight: FontWeight.w700,
              color: context.palette.text,
            ),
          ),
          PrimaryButton(
            label: l10n.aiBasketAddAll,
            icon: Icons.add_shopping_cart_rounded,
            isBusy: ref.watch(addingToCartProvider),
            onPressed: () => _addAll(context, ref),
          ),
        ],
      ),
    );
  }

  Future<void> _addAll(BuildContext context, WidgetRef ref) async {
    final l10n = AppL10n.of(context)!;
    final messenger = ScaffoldMessenger.of(context);
    final router = GoRouter.of(context);
    final busy = ref.read(addingToCartProvider.notifier);
    final cart = ref.read(cartProvider.notifier);
    var added = 0;
    var failed = false;
    busy.select(true);
    try {
      for (final id in basket.editionIds) {
        if (await cart.add(CartItemRef.edition(id))) added++;
      }
    } catch (_) {
      failed = true;
    } finally {
      busy.select(false);
    }
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        content: Text(
          failed ? l10n.commonSomethingWentWrong : l10n.aiBasketAdded(added),
        ),
        action: added > 0
            ? SnackBarAction(
                label: l10n.cartView,
                onPressed: () => router.push(CartRoutes.cart),
              )
            : null,
        persist: false,
      ),
    );
  }
}
