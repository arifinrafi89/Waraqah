import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../orders_routes.dart';

/// "My orders" row for Profile: drop in `const MyOrdersLink()`. Guests are
/// asked to log in when they tap it.
class MyOrdersLink extends StatelessWidget {
  const MyOrdersLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Insets.md),
      child: SecondaryButton(
        label: AppL10n.of(context)!.orderMyOrders,
        icon: const Icon(Icons.receipt_long_outlined, size: 18),
        onPressed: () => context.push(OrdersRoutes.orders),
      ),
    );
  }
}
