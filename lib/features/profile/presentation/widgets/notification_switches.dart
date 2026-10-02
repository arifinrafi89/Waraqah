import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/profile_prefs.dart';
import '../providers/prefs_providers.dart';
import 'preference_group.dart';

/// One switch per notification group. Moderation warnings can't be muted.
class NotificationSwitches extends ConsumerWidget {
  const NotificationSwitches({super.key, required this.prefs});

  final ProfilePrefs prefs;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final notifier = ref.read(prefsProvider.notifier);
    PreferenceSwitch toggle(
      NotificationGroup group,
      String title, [
      String? sub,
    ]) => PreferenceSwitch(
      title: title,
      subtitle: sub,
      value: !prefs.muted.contains(group),
      onChanged: (on) => notifier.setMuted(group, !on).ignore(),
    );
    return PreferenceGroup(
      title: l10n.profileNotifications,
      icon: Icons.notifications_none_rounded,
      children: [
        toggle(NotificationGroup.orders, l10n.profileNotifyOrders),
        toggle(
          NotificationGroup.usedBooks,
          l10n.profileNotifyUsedBooks,
          l10n.profileNotifyUsedBooksSub,
        ),
        toggle(NotificationGroup.alerts, l10n.profileNotifyAlerts),
        toggle(
          NotificationGroup.community,
          l10n.profileNotifyCommunity,
          l10n.profileNotifyCommunitySub,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            l10n.profileNotifyModerationNote,
            style: AppFonts.ui(size: 11, color: context.palette.textFaint),
          ),
        ),
      ],
    );
  }
}
