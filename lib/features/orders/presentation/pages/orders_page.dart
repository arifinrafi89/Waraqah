import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/order_providers.dart';
import '../widgets/order_card.dart';
import '../widgets/orders_empty_view.dart';
import '../widgets/orders_skeleton.dart';
import '../widgets/orders_top_bar.dart';

/// `/orders`: everything the reader has ordered, newest first. Pull down to
/// check for updates.
class OrdersPage extends ConsumerWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final orders = ref.watch(myOrdersProvider);
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            OrdersTopBar(title: l10n.orderMyOrders),
            Expanded(
              child: AsyncView(
                value: orders,
                errorLabel: l10n.commonSomethingWentWrong,
                retryLabel: l10n.commonRetry,
                onRetry: () => ref.invalidate(myOrdersProvider),
                skeleton: const OrdersSkeleton(),
                builder: (orders) => orders.isEmpty
                    ? const OrdersEmptyView()
                    : RefreshIndicator(
                        onRefresh: () => ref.refresh(myOrdersProvider.future),
                        child: ListView.separated(
                          padding: const EdgeInsets.fromLTRB(
                            Insets.screen,
                            0,
                            Insets.screen,
                            Insets.xl,
                          ),
                          itemCount: orders.length,
                          separatorBuilder: (_, _) =>
                              const SizedBox(height: 10),
                          itemBuilder: (_, i) => OrderCard(
                            key: ValueKey(orders[i].number),
                            order: orders[i],
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
