import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/profile_providers.dart';

class ProfilePreferencesPage extends ConsumerWidget {
  const ProfilePreferencesPage({super.key});

  Future<void> _deleteAccount(BuildContext context) async {
    final l10n = AppL10n.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialog) => AlertDialog(
        title: Text(l10n.profileDeleteAccount),
        content: Text(l10n.profileDeleteAccountMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialog, false),
            child: Text(l10n.profileCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialog, true),
            child: Text(l10n.profileDeleteConfirm),
          ),
        ],
      ),
    );
    if (confirmed == true && context.mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(l10n.profileDeleteAccount)));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final notifications = ref.watch(notificationPreferencesProvider);
    final privacy = ref.watch(privacyPreferencesProvider);
    final notificationActions = ref.read(
      notificationPreferencesProvider.notifier,
    );
    final privacyActions = ref.read(privacyPreferencesProvider.notifier);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBar(title: Text(l10n.profileNotifications)),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(Insets.screen),
                children: [
                  _PreferenceGroup(
                    title: l10n.profileNotifications,
                    icon: Icons.notifications_none_rounded,
                    children: [
                      _switchTile(
                        l10n.profilePushNotifications,
                        notifications.push,
                        notificationActions.setPush,
                      ),
                      _switchTile(
                        l10n.profileOrderUpdates,
                        notifications.orders,
                        notificationActions.setOrders,
                      ),
                      _switchTile(
                        l10n.profilePromotions,
                        notifications.promotions,
                        notificationActions.setPromotions,
                      ),
                    ],
                  ),
                  const SizedBox(height: Insets.xl),
                  _PreferenceGroup(
                    title: l10n.profilePrivacy,
                    icon: Icons.lock_outline_rounded,
                    children: [
                      _switchTile(
                        l10n.profileProfileVisibility,
                        privacy.profileVisible,
                        privacyActions.setProfileVisible,
                      ),
                      _switchTile(
                        l10n.profileActivityVisibility,
                        privacy.activityVisible,
                        privacyActions.setActivityVisible,
                      ),
                    ],
                  ),
                  const SizedBox(height: Insets.xl),
                  SurfaceCard(
                    padding: const EdgeInsets.all(Insets.md),
                    child: Material(
                      color: context.palette.surface,
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(
                          Icons.delete_outline_rounded,
                          color: Theme.of(context).colorScheme.error,
                        ),
                        title: Text(l10n.profileDeleteAccount),
                        onTap: () => _deleteAccount(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _switchTile(String title, bool value, ValueChanged<bool> onChanged) =>
      SwitchListTile.adaptive(
        contentPadding: EdgeInsets.zero,
        title: Text(title),
        value: value,
        onChanged: onChanged,
      );
}

class _PreferenceGroup extends StatelessWidget {
  const _PreferenceGroup({
    required this.title,
    required this.icon,
    required this.children,
  });

  final String title;
  final IconData icon;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) => SurfaceCard(
    padding: const EdgeInsets.fromLTRB(
      Insets.md,
      Insets.sm,
      Insets.md,
      Insets.sm,
    ),
    child: Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(icon, color: context.palette.accent),
          title: Text(title, style: context.texts.titleSmall),
        ),
        for (final child in children)
          Material(color: context.palette.surface, child: child),
      ],
    ),
  );
}
