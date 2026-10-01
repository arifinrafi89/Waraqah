import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/content_width.dart';
import '../../../../l10n/app_localizations.dart';
import '../../handled_sale_routes.dart';
import '../providers/handled_sale_providers.dart';
import '../widgets/sale_app_bar.dart';
import '../widgets/sale_tile.dart';
import '../widgets/sales_skeleton.dart';

/// `/sales`: the reader's Waraqah-handled sales, buying and selling, with
/// Earnings in the corner.
class SalesPage extends ConsumerWidget {
  const SalesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: ContentWidth(
          child: Column(
            children: [
              SaleAppBar(
                title: l10n.usedSalesTitle,
                actions: [
                  AppIconButton(
                    icon: Icons.account_balance_wallet_outlined,
                    tooltip: l10n.usedEarningsTitle,
                    onPressed: () => context.push(HandledSaleRoutes.earnings),
                  ),
                ],
              ),
              Expanded(
                child: AsyncView(
                  value: ref.watch(mySalesProvider),
                  errorLabel: l10n.commonSomethingWentWrong,
                  retryLabel: l10n.commonRetry,
                  onRetry: () => ref.invalidate(mySalesProvider),
                  skeleton: const SalesSkeleton(),
                  builder: (sales) => sales.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(Insets.xl),
                          child: Text(
                            l10n.usedSalesEmpty,
                            textAlign: TextAlign.center,
                          ),
                        )
                      : ListView.separated(
                          padding: const EdgeInsets.fromLTRB(
                            Insets.screen,
                            0,
                            Insets.screen,
                            Insets.xl,
                          ),
                          itemCount: sales.length,
                          separatorBuilder: (_, _) =>
                              const SizedBox(height: Insets.md),
                          itemBuilder: (_, i) => SaleTile(sale: sales[i]),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
