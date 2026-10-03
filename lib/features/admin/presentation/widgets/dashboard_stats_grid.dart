import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../admin_routes.dart';
import '../../domain/entities/admin_dashboard.dart';
import '../../domain/entities/admin_section.dart';
import 'dashboard_stat_tile.dart';

/// The day's numbers. Each opens the Admin section that handles it, when
/// the viewer's role may open it.
class DashboardStatsGrid extends ConsumerWidget {
  const DashboardStatsGrid({super.key, required this.data});

  final AdminDashboard data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final role = ref.watch(sessionProvider)?.role;
    VoidCallback? open(AdminSection section) =>
        role != null && section.canOpen(role)
        ? () => context.push(AdminRoutes.section(section))
        : null;
    final orders = open(AdminSection.orders);
    final moderation = open(AdminSection.moderation);
    return GridView.extent(
      maxCrossAxisExtent: 200,
      childAspectRatio: 1.35,
      mainAxisSpacing: Insets.sm,
      crossAxisSpacing: Insets.sm,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        for (final (icon, label, value, tap) in [
          (
            Icons.receipt_long_outlined,
            l10n.adminDashboardOrdersToday,
            '${data.ordersToday}',
            orders,
          ),
          (
            Icons.payments_outlined,
            l10n.adminDashboardSalesToday,
            Bdt.format(data.salesTodayBdt),
            orders,
          ),
          (
            Icons.local_shipping_outlined,
            l10n.adminDashboardToShip,
            '${data.ordersToShip}',
            orders,
          ),
          (
            Icons.fact_check_outlined,
            l10n.adminDashboardListings,
            '${data.listingsWaiting}',
            moderation,
          ),
          (
            Icons.flag_outlined,
            l10n.adminDashboardReports,
            '${data.openReports}',
            moderation,
          ),
          (
            Icons.gavel_rounded,
            l10n.adminDashboardDisputes,
            '${data.openDisputes}',
            moderation,
          ),
        ])
          DashboardStatTile(icon: icon, label: label, value: value, onTap: tap),
      ],
    );
  }
}
