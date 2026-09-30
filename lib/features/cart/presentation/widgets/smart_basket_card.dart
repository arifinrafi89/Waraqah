import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/smart_basket_providers.dart';
import 'smart_basket_panel.dart';

/// At the top of the cart: used copies that would save money, how far it
/// is to free delivery, and budget mode. Nothing when there's nothing to
/// suggest.
class SmartBasketCard extends ConsumerWidget {
  const SmartBasketCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return AsyncView(
      value: ref.watch(smartBasketProvider),
      errorLabel: l10n.commonSomethingWentWrong,
      retryLabel: l10n.commonRetry,
      onRetry: () => ref.invalidate(smartBasketProvider),
      skeleton: const Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: ShimmerBox(height: 90, radius: Radii.card),
      ),
      builder: (basket) => basket.isEmpty
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.only(bottom: Insets.md),
              child: SmartBasketPanel(basket: basket),
            ),
    );
  }
}
