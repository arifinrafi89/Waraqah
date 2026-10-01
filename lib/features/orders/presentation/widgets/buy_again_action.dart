import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../cart/cart_routes.dart';
import '../../../cart/presentation/providers/cart_providers.dart';
import '../../domain/entities/order.dart';
import '../providers/order_providers.dart';

extension BuyAgainAction on WidgetRef {
  /// Puts the order's books back in the cart and opens it, saying how many
  /// made it and how many can't be bought again right now.
  Future<void> buyAgain(BuildContext context, Order order) async {
    final l10n = AppL10n.of(context)!;
    final messenger = ScaffoldMessenger.of(context);
    final router = GoRouter.of(context);
    try {
      final result = await read(reorderOrderProvider).call(order.number);
      invalidate(cartProvider);
      final message = result.added == 0
          ? l10n.orderNoneAvailable
          : [
              l10n.orderBackInCart(result.added),
              if (result.skipped > 0) l10n.orderSomeUnavailable(result.skipped),
            ].join(' ');
      messenger.showSnackBar(SnackBar(content: Text(message)));
      if (result.added > 0) router.push(CartRoutes.cart);
    } catch (_) {
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.commonSomethingWentWrong)),
      );
    }
  }
}
