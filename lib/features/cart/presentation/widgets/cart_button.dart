import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/app_icon_button.dart';
import '../../../../l10n/app_localizations.dart';
import '../../cart_routes.dart';
import '../providers/cart_providers.dart';

/// The bag icon for any app bar: opens the cart and shows how many copies
/// are in it. Drop in `const CartButton()`.
class CartButton extends ConsumerWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(cartCountProvider);
    return AppIconButton(
      icon: Icons.shopping_bag_outlined,
      tooltip: AppL10n.of(context)!.cartTitle,
      badgeCount: count == 0 ? null : count,
      onPressed: () => context.push(CartRoutes.cart),
    );
  }
}
