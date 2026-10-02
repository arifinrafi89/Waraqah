import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/profile_prefs.dart';
import '../providers/prefs_providers.dart';
import 'preference_group.dart';

/// Who sees the Reader's page and reading activity.
class PrivacySwitches extends ConsumerWidget {
  const PrivacySwitches({super.key, required this.prefs});

  final ProfilePrefs prefs;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final notifier = ref.read(prefsProvider.notifier);
    return PreferenceGroup(
      title: l10n.profilePrivacy,
      icon: Icons.lock_outline_rounded,
      children: [
        PreferenceSwitch(
          title: l10n.profileProfileVisibility,
          value: prefs.profileVisible,
          onChanged: (on) => notifier
              .change((now) => now.copyWith(profileVisible: on))
              .ignore(),
        ),
        PreferenceSwitch(
          title: l10n.profileActivityVisibility,
          value: prefs.activityVisible,
          onChanged: (on) => notifier
              .change((now) => now.copyWith(activityVisible: on))
              .ignore(),
        ),
      ],
    );
  }
}
