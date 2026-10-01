import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../core/widgets/tags.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/handled_sale.dart';
import '../../handled_sale_routes.dart';
import 'sale_book_row.dart';
import 'sale_labels.dart';

/// One sale in the list: the book, buying or selling, the money, and
/// where it is.
class SaleTile extends StatelessWidget {
  const SaleTile({super.key, required this.sale});

  final HandledSale sale;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final side = sale.isBuying ? l10n.usedSalesBuying : l10n.usedSalesSelling;
    final money = sale.isBuying ? sale.buyerPaysBdt : sale.sellerGetsBdt;
    return SurfaceCard(
      clip: true,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () => context.push(HandledSaleRoutes.saleFor(sale.id)),
          child: Padding(
            padding: const EdgeInsets.all(Insets.md),
            child: SaleBookRow(
              title: sale.title,
              coverSeed: sale.coverSeed,
              subtitle: '$side · ${sale.otherName} · ${Bdt.format(money)}',
              trailing: MiniTag(
                label: l10n.saleStatus(sale.status),
                fontSize: 10,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
