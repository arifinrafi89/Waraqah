import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/order.dart';
import '../providers/order_providers.dart';
import '../widgets/order_actions.dart';
import '../widgets/order_info_card.dart';
import '../widgets/order_labels.dart';
import '../widgets/order_lines_card.dart';
import '../widgets/order_links.dart';
import '../widgets/order_timeline.dart';
import '../widgets/orders_skeleton.dart';
import '../widgets/orders_top_bar.dart';

/// `/orders/:number`: where the order is, what's in it, where it goes and
/// what it cost, with cancel or return when those are allowed, buy again,
/// the invoice and the return policy.
class OrderDetailsPage extends ConsumerWidget {
  const OrderDetailsPage({super.key, required this.number});

  final String number;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final order = ref.watch(orderProvider(number));
    final placedAt = order.value?.placedAt;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            OrdersTopBar(
              title: number,
              subtitle: placedAt == null
                  ? null
                  : l10n.orderPlacedOn(context.orderDate(placedAt)),
            ),
            Expanded(
              child: AsyncView(
                value: order,
                errorLabel: l10n.commonSomethingWentWrong,
                retryLabel: l10n.commonRetry,
                onRetry: () => ref.invalidate(orderProvider(number)),
                skeleton: const OrdersSkeleton(rows: 4),
                builder: (order) => order == null
                    ? Center(child: Text(l10n.orderNotFound))
                    : _Details(order: order),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Details extends StatelessWidget {
  const _Details({required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    Widget title(String text) => Padding(
      padding: const EdgeInsets.only(top: Insets.xl, bottom: Insets.sm),
      child: Text(text, style: context.texts.titleMedium),
    );
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        Insets.screen,
        0,
        Insets.screen,
        Insets.xl,
      ),
      children: [
        OrderTimeline(order: order),
        title(l10n.checkoutItems(order.itemCount)),
        OrderLinesCard(order: order),
        const SizedBox(height: Insets.md),
        OrderInfoCard(order: order),
        const SizedBox(height: Insets.xl),
        OrderActions(order: order),
        const SizedBox(height: Insets.sm),
        OrderLinks(order: order),
      ],
    );
  }
}
