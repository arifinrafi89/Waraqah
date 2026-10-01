import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../handled_sale/domain/entities/handled_sale.dart';
import '../../../handled_sale/domain/entities/sale_dispute.dart';
import '../../../handled_sale/presentation/widgets/sale_labels.dart';
import 'dispute_settle_actions.dart';

/// A disputed Waraqah-handled sale: who, the money held, the buyer's
/// reason, note and photos, then refund the buyer or pay the seller.
class DisputeCaseCard extends ConsumerWidget {
  const DisputeCaseCard({super.key, required this.dispute});

  final SaleDispute dispute;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final sale = dispute.sale;
    final dim = AppFonts.ui(size: 12, color: palette.textDim);
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: Insets.sm,
        children: [
          Text(sale.title, style: context.texts.titleSmall),
          Text(
            l10n.usedDisputeCase(dispute.buyerName, dispute.sellerName),
            style: dim,
          ),
          Text(
            l10n.usedDisputeHeld(Bdt.format(sale.buyerPaysBdt)),
            style: AppFonts.ui(size: 12.5, color: palette.accent),
          ),
          if (sale.disputeReason case final reason?)
            Text(
              l10n.disputeReason(reason),
              style: AppFonts.ui(
                size: 12.5,
                weight: FontWeight.w800,
                color: palette.danger,
              ),
            ),
          if (sale.disputeNote case final note?) Text(note, style: dim),
          if (sale.disputePhotos.isNotEmpty)
            Wrap(
              spacing: Insets.sm,
              children: [
                for (final photo in sale.disputePhotos)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(Radii.sm),
                    child: SizedBox.square(
                      dimension: 64,
                      child: Image.memory(photo, fit: BoxFit.cover),
                    ),
                  ),
              ],
            ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () =>
                      ref.settleDispute(context, sale, refund: true),
                  child: Text(l10n.usedDisputeRefund),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () =>
                      ref.settleDispute(context, sale, refund: false),
                  child: Text(l10n.usedDisputePaySeller),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
