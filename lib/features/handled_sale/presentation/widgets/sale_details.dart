import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../core/widgets/tags.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/handled_sale.dart';
import 'money_rows.dart';
import 'sale_action_bar.dart';
import 'sale_book_row.dart';
import 'sale_labels.dart';

/// The sale: book and the other reader, its status and what happens next,
/// the money, and the reader's next step.
class SaleDetails extends StatelessWidget {
  const SaleDetails({super.key, required this.sale});

  final HandledSale sale;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final buying = sale.isBuying;
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(
        Insets.screen,
        0,
        Insets.screen,
        Insets.xl,
      ),
      children: [
        SaleBookRow(
          title: sale.title,
          coverSeed: sale.coverSeed,
          subtitle: buying
              ? l10n.usedSaleFrom(sale.otherName)
              : l10n.usedSaleTo(sale.otherName),
          trailing: MiniTag(label: l10n.saleStatus(sale.status), fontSize: 10),
        ),
        const SizedBox(height: Insets.lg),
        SurfaceCard(
          padding: const EdgeInsets.all(Insets.md),
          child: Text(
            l10n.saleHint(sale),
            style: AppFonts.ui(size: 13, height: 1.45, color: palette.text),
          ),
        ),
        const SizedBox(height: Insets.lg),
        MoneyRows(
          rows: buying
              ? [
                  (l10n.usedBuyBook, sale.priceBdt),
                  (l10n.usedBuyDelivery, sale.deliveryBdt),
                  (l10n.usedBuyTotal, sale.buyerPaysBdt),
                ]
              : [
                  (l10n.usedBuyBook, sale.priceBdt),
                  (l10n.usedSaleFee, sale.feeBdt),
                  (l10n.usedSaleYouGet, sale.sellerGetsBdt),
                ],
        ),
        if (sale.disputeReason case final reason?) ...[
          const SizedBox(height: Insets.lg),
          Text(
            [l10n.disputeReason(reason), ?sale.disputeNote].join(' · '),
            style: AppFonts.ui(size: 12.5, color: palette.danger),
          ),
        ],
        const SizedBox(height: Insets.lg),
        SaleActionBar(sale: sale),
      ],
    );
  }
}
