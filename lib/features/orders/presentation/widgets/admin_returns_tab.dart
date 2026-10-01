import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/order_return.dart';
import '../providers/order_admin_providers.dart';
import 'admin_return_tile.dart';
import 'orders_skeleton.dart';

/// Returns waiting for a decision: the order, the reason and the reader's
/// note, with Reject and Approve.
class AdminReturnsTab extends ConsumerWidget {
  const AdminReturnsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return AsyncView(
      value: ref.watch(allOrdersProvider),
      errorLabel: l10n.commonSomethingWentWrong,
      retryLabel: l10n.commonRetry,
      onRetry: () => ref.invalidate(allOrdersProvider),
      skeleton: const OrdersSkeleton(),
      builder: (all) {
        final waiting = [
          for (final order in all)
            if (order.returnRequest?.status == ReturnStatus.requested) order,
        ];
        if (waiting.isEmpty) {
          return Center(
            child: Text(
              l10n.adminOrderNoReturns,
              style: context.texts.bodyMedium,
            ),
          );
        }
        return ListView(
          padding: const EdgeInsets.all(Insets.screen),
          children: [
            for (final order in waiting) AdminReturnTile(order: order),
          ],
        );
      },
    );
  }
}
