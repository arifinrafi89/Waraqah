import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/screen_app_bar.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../admin/presentation/widgets/admin_area_button.dart';
import '../../../alerts/presentation/widgets/my_alerts_link.dart';
import '../../../auth/presentation/widgets/session_actions.dart';
import '../../../book_request/presentation/widgets/my_requests_link.dart';
import '../../../catalog/presentation/widgets/booklists_links.dart';
import '../../../donate/presentation/widgets/donate_link.dart';
import '../../../handled_sale/presentation/widgets/sales_link.dart';
import '../../../loyalty/presentation/widgets/points_link.dart';
import '../../../notifications/presentation/widgets/notification_bell.dart';
import '../../../orders/presentation/widgets/my_orders_link.dart';
import '../../../p2p/presentation/widgets/my_listings_button.dart';
import '../../../report/presentation/widgets/blocked_readers_link.dart';
import '../../../sell_back/presentation/widgets/sell_back_link.dart';
import '../../../wallet/presentation/widgets/wallet_link.dart';
import '../../../wishlist/presentation/widgets/wishlist_link.dart';
import '../../../shelves/presentation/widgets/shelves_link.dart';
import '../widgets/profile_account_links.dart';
import '../widgets/profile_device_settings.dart';
import '../widgets/profile_header_card.dart';

/// Screen 5 — Profile: the header, the Reader's pages (each link hides
/// itself for a Guest) and the device settings.
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          ScreenAppBar(
            title: l10n.profileTitle,
            actions: const [NotificationBell()],
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.fromLTRB(
                Insets.screen,
                0,
                Insets.screen,
                Sizes.navClearance,
              ),
              children: const [
                ProfileHeaderCard(),
                SizedBox(height: Insets.md),
                ProfileAccountLinks(),
                SessionActions(),
                ShelvesLink(),
                MyOrdersLink(),
                WishlistLink(),
                MyBooklistsLink(),
                MyAlertsLink(),
                PointsLink(),
                DonateLink(),
                WalletLink(),
                AdminAreaButton(),
                MyListingsButton(),
                SellBackLink(),
                SalesLink(),
                MyRequestsLink(),
                BlockedReadersLink(),
                SizedBox(height: Insets.xl),
                ProfileDeviceSettings(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
