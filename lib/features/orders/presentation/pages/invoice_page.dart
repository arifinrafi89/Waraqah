import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/order_providers.dart';
import '../widgets/invoice_view.dart';
import '../widgets/orders_skeleton.dart';
import '../widgets/orders_top_bar.dart';

/// `/orders/:number/invoice`: the order as a receipt, with who sold it,
/// where it went, each book's price and how it was paid.
class InvoicePage extends ConsumerWidget {
  const InvoicePage({super.key, required this.number});

  final String number;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            OrdersTopBar(title: l10n.orderInvoice, subtitle: number),
            Expanded(
              child: AsyncView(
                value: ref.watch(orderProvider(number)),
                errorLabel: l10n.commonSomethingWentWrong,
                retryLabel: l10n.commonRetry,
                onRetry: () => ref.invalidate(orderProvider(number)),
                skeleton: const OrdersSkeleton(rows: 3),
                builder: (order) => order == null
                    ? Center(child: Text(l10n.orderNotFound))
                    : ListView(
                        padding: const EdgeInsets.fromLTRB(
                          Insets.screen,
                          0,
                          Insets.screen,
                          Insets.xl,
                        ),
                        children: [InvoiceView(order: order)],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
