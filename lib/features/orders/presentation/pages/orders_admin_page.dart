import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/screen_app_bar.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../admin/admin_routes.dart';
import '../../../checkout/presentation/widgets/coupons_admin_tab.dart';
import '../widgets/admin_orders_tab.dart';
import '../widgets/admin_returns_tab.dart';

/// The Admin area's Orders section (support staff): move orders along,
/// decide returns and manage coupons. Laid out like the Moderation Center.
class OrdersAdminPage extends StatelessWidget {
  const OrdersAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final palette = context.palette;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
                    Flexible(
                      child: Text(
                        l10n.adminOrderTitle,
                        style: context.texts.titleLarge,
                      ),
                    ),
                  ],
                ),
              ),
              TabBar(
                labelColor: palette.text,
                unselectedLabelColor: palette.textFaint,
                indicatorColor: palette.accent,
                dividerColor: palette.border,
                labelStyle: context.texts.titleSmall,
                unselectedLabelStyle: context.texts.titleSmall,
                tabs: [
                  Tab(text: l10n.adminOrderTabOrders),
                  Tab(text: l10n.adminOrderTabReturns),
                  Tab(text: l10n.adminOrderTabCoupons),
                ],
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    AdminOrdersTab(),
                    AdminReturnsTab(),
                    CouponsAdminTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
