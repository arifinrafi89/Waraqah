import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/sale_math.dart';
import '../../handled_sale_routes.dart';

/// On a used copy that's for sale: buy it through Waraqah instead of
/// arranging it with the seller.
class HandledSaleCard extends StatelessWidget {
  const HandledSaleCard({
    super.key,
    required this.listingId,
    required this.priceBdt,
  });

  final String listingId;
  final int priceBdt;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: Insets.sm,
        children: [
          Row(
            spacing: Insets.sm,
            children: [
              Icon(Icons.verified_user_outlined, color: palette.accent),
              Text(l10n.usedHandledTitle, style: context.texts.titleSmall),
            ],
          ),
          Text(
            l10n.usedHandledBody,
            style: AppFonts.ui(size: 12.5, height: 1.4, color: palette.textDim),
          ),
          SecondaryButton(
            label: l10n.usedHandledBuy(
              Bdt.format(SaleMath.buyerPays(priceBdt)),
            ),
            onPressed: () => context.push(HandledSaleRoutes.buyFor(listingId)),
          ),
        ],
      ),
    );
  }
}
