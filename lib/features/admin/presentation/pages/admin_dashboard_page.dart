import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/screen_app_bar.dart';
import '../../../../l10n/app_localizations.dart';
import '../../admin_routes.dart';
import '../providers/dashboard_providers.dart';
import '../widgets/dashboard_ranked_list.dart';
import '../widgets/dashboard_skeleton.dart';
import '../widgets/dashboard_stats_grid.dart';

/// Admin → Dashboard: today's orders and sales, what waits for Staff, and
/// what readers search for and ask for most.
class AdminDashboardPage extends ConsumerWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ScreenAppBar(
              leading: Row(
                spacing: Insets.md,
                children: [
                  AppIconButton(
                    icon: Icons.arrow_back_rounded,
                    tooltip: MaterialLocalizations.of(context)
                        .backButtonTooltip,
                    onPressed: () => context.canPop()
                        ? context.pop()
                        : context.go(AdminRoutes.admin),
                  ),
                  Text(l10n.adminDashboard, style: context.texts.titleLarge),
                ],
              ),
            ),
            Expanded(
              child: AsyncView(
                value: ref.watch(dashboardProvider),
                skeleton: const DashboardSkeleton(),
                errorLabel: l10n.commonSomethingWentWrong,
                retryLabel: l10n.commonRetry,
                onRetry: () => ref.invalidate(dashboardProvider),
                builder: (data) => RefreshIndicator(
                  onRefresh: () => ref.refresh(dashboardProvider.future),
                  child: ListView(
                    padding: const EdgeInsets.all(Insets.screen),
                    children: [
                      DashboardStatsGrid(data: data),
                      const SizedBox(height: Insets.md),
                      DashboardRankedList(
                        title: l10n.adminDashboardTopSearches,
                        rows: [
                          for (final s in data.topSearches)
                            (s.term, l10n.adminDashboardSearches(s.count)),
                        ],
                      ),
                      const SizedBox(height: Insets.md),
                      DashboardRankedList(
                        title: l10n.adminDashboardTopRequested,
                        rows: [
                          for (final r in data.topRequested)
                            (r.title, l10n.adminDashboardRequests(r.requests)),
                        ],
                      ),
                    ],
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
