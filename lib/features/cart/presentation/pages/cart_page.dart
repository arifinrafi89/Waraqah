import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../home/home_routes.dart';
import '../../domain/entities/cart.dart';
import '../providers/cart_providers.dart';
import '../widgets/cart_empty_view.dart';
import '../widgets/cart_line_tile.dart';
import '../widgets/cart_skeleton.dart';
import '../widgets/cart_summary_bar.dart';

/// `/cart`: what the reader is about to buy, with quantities, the subtotal
/// and what they save. Opened over the shell, like the book page.
class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final cart = ref.watch(cartProvider);
    final data = cart.value;
    final hasItems = data != null && !data.isEmpty;
    return Scaffold(
      bottomNavigationBar: hasItems ? CartSummaryBar(cart: data) : null,
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
                        : context.go(HomeRoutes.home),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(l10n.cartTitle, style: context.texts.titleLarge),
                        if (hasItems)
                          Text(
                            l10n.cartItemCount(data.itemCount),
                            style: AppFonts.ui(
                              size: 11,
                              weight: FontWeight.w700,
                              color: palette.textFaint,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: AsyncView(
                value: cart,
                errorLabel: l10n.commonSomethingWentWrong,
                retryLabel: l10n.commonRetry,
                onRetry: () => ref.invalidate(cartProvider),
                skeleton: const CartSkeleton(),
                builder: (cart) =>
                    cart.isEmpty ? const CartEmptyView() : _Lines(cart: cart),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Lines extends StatelessWidget {
  const _Lines({required this.cart});

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        Insets.screen,
        0,
        Insets.screen,
        Insets.xl,
      ),
      children: [
        for (final line in cart.lines)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CartLineTile(key: ValueKey(line.id), line: line),
          ),
        const SizedBox(height: Insets.sm),
        Text(
          AppL10n.of(context)!.cartDeliveryNote,
          textAlign: TextAlign.center,
          style: AppFonts.ui(size: 11, color: context.palette.textFaint),
        ),
      ],
    );
  }
}
