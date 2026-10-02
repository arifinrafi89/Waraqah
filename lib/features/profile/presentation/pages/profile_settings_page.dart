import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/prefs_providers.dart';
import '../widgets/delete_account_tile.dart';
import '../widgets/notification_switches.dart';
import '../widgets/privacy_switches.dart';
import '../widgets/profile_page_scaffold.dart';

/// `/profile/settings`: notifications, privacy and delete account, kept on
/// the server. Theme and language stay on the Profile tab (device
/// settings).
class ProfileSettingsPage extends ConsumerWidget {
  const ProfileSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return ProfilePageScaffold(
      title: l10n.profileSettings,
      body: AsyncView(
        value: ref.watch(prefsProvider),
        errorLabel: l10n.commonSomethingWentWrong,
        retryLabel: l10n.commonRetry,
        onRetry: () => ref.invalidate(prefsProvider),
        skeleton: const Padding(
          padding: EdgeInsets.all(Insets.screen),
          child: Column(
            spacing: Insets.xl,
            children: [ShimmerBox(height: 260), ShimmerBox(height: 140)],
          ),
        ),
        builder: (prefs) => ListView(
          padding: const EdgeInsets.fromLTRB(
            Insets.screen,
            0,
            Insets.screen,
            Insets.xl,
          ),
          children: [
            NotificationSwitches(prefs: prefs),
            const SizedBox(height: Insets.xl),
            PrivacySwitches(prefs: prefs),
            const SizedBox(height: Insets.xl),
            const DeleteAccountTile(),
          ],
        ),
      ),
    );
  }
}
