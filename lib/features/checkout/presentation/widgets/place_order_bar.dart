import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/checkout_totals.dart';
import '../providers/checkout_providers.dart';
import 'place_order_action.dart';

/// Pinned under checkout: the total, and Place order taking the rest of the
/// width so its label never gets squeezed.
class PlaceOrderBar extends ConsumerWidget {
  const PlaceOrderBar({super.key, required this.totals});

  final CheckoutTotals totals;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final canPlace = ref.canPlaceOrder;
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    l10n.checkoutTotal,
                    style: AppFonts.ui(size: 11, color: palette.textFaint),
                  ),
                  Text(
                    Bdt.format(totals.totalBdt),
                    style: AppFonts.numeric(size: 18, color: palette.text),
                  ),
                ],
              ),
              Expanded(
                child: PrimaryButton(
                  label: l10n.checkoutPlaceOrder,
                  isBusy: ref.watch(placingOrderProvider),
                  onPressed: canPlace ? () => ref.placeOrder(context) : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
