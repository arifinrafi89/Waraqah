import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/filter_chip_bar.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/order_status.dart';
import '../providers/order_admin_providers.dart';
import 'admin_order_tile.dart';
import 'order_labels.dart';
import 'orders_skeleton.dart';

/// Every order, filtered by status, each with its next step one tap away.
class AdminOrdersTab extends ConsumerWidget {
  const AdminOrdersTab({super.key});

  static const List<OrderStatus?> _filters = [null, ...OrderStatus.values];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final filter = ref.watch(adminOrderFilterProvider);
    final orders = ref.watch(allOrdersProvider);
    return Column(
      children: [
        const SizedBox(height: Insets.md),
        FilterChipBar(
          labels: [
            for (final status in _filters)
              status == null ? l10n.adminOrderAll : l10n.orderStatus(status),
          ],
          selectedIndex: _filters.indexOf(filter),
          onSelected: (i) =>
              ref.read(adminOrderFilterProvider.notifier).select(_filters[i]),
        ),
        const SizedBox(height: Insets.md),
        Expanded(
          child: AsyncView(
            value: orders,
            errorLabel: l10n.commonSomethingWentWrong,
            retryLabel: l10n.commonRetry,
            onRetry: () => ref.invalidate(allOrdersProvider),
            skeleton: const OrdersSkeleton(),
            builder: (all) {
              final shown = [
                for (final order in all)
                  if (filter == null || order.status == filter) order,
              ];
              if (shown.isEmpty) {
                return Center(
                  child: Text(
                    l10n.adminOrderNoOrders,
                    style: context.texts.bodyMedium,
                  ),
                );
              }
              return ListView.separated(
                padding: const EdgeInsets.fromLTRB(
                  Insets.screen,
                  0,
                  Insets.screen,
                  Insets.xl,
                ),
                itemCount: shown.length,
                separatorBuilder: (_, _) => const SizedBox(height: 10),
                itemBuilder: (_, i) => AdminOrderTile(
                  key: ValueKey(shown[i].number),
                  order: shown[i],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
