import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/settings/settings_provider.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/screen_app_bar.dart';
import '../../../../core/widgets/segmented_selector.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../alerts/alerts_routes.dart';
import '../../../admin/presentation/widgets/admin_area_button.dart';
import '../../../alerts/presentation/widgets/my_alerts_link.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../../auth/presentation/widgets/session_actions.dart';
import '../../../catalog/presentation/widgets/booklists_links.dart';
import '../../../home/presentation/widgets/ayah_switch_tile.dart';
import '../../../donate/presentation/widgets/donate_link.dart';
import '../../../loyalty/presentation/widgets/points_link.dart';
import '../../../orders/presentation/widgets/my_orders_link.dart';
import '../../../wallet/presentation/widgets/wallet_link.dart';
import '../../../wishlist/presentation/widgets/wishlist_link.dart';
import '../widgets/profile_header.dart';
import '../providers/profile_providers.dart';
import '../widgets/profile_action_tile.dart';
import '../../../p2p/presentation/widgets/my_listings_button.dart';
import '../../../book_request/presentation/widgets/my_requests_link.dart';
import '../../../handled_sale/presentation/widgets/sales_link.dart';
import '../../../sell_back/presentation/widgets/sell_back_link.dart';
import '../../../report/presentation/widgets/blocked_readers_link.dart';
import '../widgets/settings_group.dart';
import 'edit_profile_page.dart';
import 'profile_preferences_page.dart';
import 'saved_addresses_page.dart';

import 'package:go_router/go_router.dart';

/// Screen 5 — Profile. Also the home of the theme and language switchers, both
/// wired to [settingsProvider].
class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final settings = ref.watch(settingsProvider);
    final settingsNotifier = ref.watch(settingsProvider.notifier);
    final user = ref.watch(sessionProvider);
    final profile = ref.watch(profileDetailsProvider);
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          ScreenAppBar(title: l10n.profileTitle),
          Expanded(
            child: ListView(
              padding: EdgeInsets.fromLTRB(
                Insets.screen,
                0,
                Insets.screen,
                Sizes.navClearance,
              ),
              children: [
                ProfileHeader(
                  name: profile.name.isEmpty
                      ? user?.name ?? l10n.authGuestName
                      : profile.name,
                  campus: user?.email ?? l10n.authGuestNote,
                  onEdit: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const EditProfilePage()),
                  ),
                  stats: {
                    l10n.profileBooksRead: '14',
                    l10n.profileBitesPosted: '23',
                    l10n.profileListings: '3',
                  },
                ),
                const SizedBox(height: Insets.md),
                ProfileActionTile(
                  icon: Icons.person_outline_rounded,
                  title: l10n.profileEditProfile,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const EditProfilePage()),
                  ),
                ),
                ProfileActionTile(
                  icon: Icons.location_on_outlined,
                  title: l10n.profileSavedAddresses,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SavedAddressesPage(),
                    ),
                  ),
                ),
                ProfileActionTile(
                  icon: Icons.notifications_none_rounded,
                  title: l10n.profileNotificationCenter,
                  onTap: () => context.push(AlertsRoutes.notifications),
                ),
                ProfileActionTile(
                  icon: Icons.tune_rounded,
                  title: l10n.profileNotifications,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ProfilePreferencesPage(),
                    ),
                  ),
                ),
                const SessionActions(),
                const MyOrdersLink(),
                const WishlistLink(),
                const MyBooklistsLink(),
                const MyAlertsLink(),
                const PointsLink(),
                const DonateLink(),
                const WalletLink(),
                const AdminAreaButton(),
                const MyListingsButton(),
                const SellBackLink(),
                const SalesLink(),
                const MyRequestsLink(),
                const BlockedReadersLink(),
                const SizedBox(height: Insets.xl),
                SettingsGroup(
                  label: l10n.profileAppearance,
                  icon: Icons.contrast_rounded,
                  child: SegmentedSelector<ThemeMode>(
                    options: const [
                      ThemeMode.light,
                      ThemeMode.dark,
                      ThemeMode.system,
                    ],
                    labels: [
                      l10n.profileThemeLight,
                      l10n.profileThemeDark,
                      l10n.profileThemeSystem,
                    ],
                    value: settings.themeMode,
                    onChanged: settingsNotifier.setThemeMode,
                  ),
                ),
                const SizedBox(height: Insets.xl),
                SettingsGroup(
                  label: l10n.profileLanguage,
                  icon: Icons.translate_rounded,
                  child: SegmentedSelector<String>(
                    options: const ['en', 'bn'],
                    labels: [l10n.profileEnglish, l10n.profileBangla],
                    value: Localizations.localeOf(context).languageCode,
                    onChanged: (code) =>
                        settingsNotifier.setLocale(Locale(code)),
                  ),
                ),
                const SizedBox(height: Insets.xl),
                SettingsGroup(
                  label: l10n.homeSettingsTitle,
                  icon: Icons.home_rounded,
                  child: Material(
                    color: context.palette.surface,
                    child: const AyahSwitchTile(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
