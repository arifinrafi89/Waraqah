import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../profile/presentation/widgets/profile_page_scaffold.dart';
import '../../domain/entities/app_notification.dart';
import '../providers/notification_providers.dart';
import '../widgets/notification_route.dart';
import '../widgets/notification_tile.dart';
import '../widgets/notifications_empty_view.dart';
import '../widgets/notifications_skeleton.dart';

/// `/notifications`: what happened to the Reader, newest first. Tapping
/// one marks it read and opens its page. Signed-in only.
class NotificationCenterPage extends ConsumerWidget {
  const NotificationCenterPage({super.key});

  void _open(BuildContext context, WidgetRef ref, AppNotification n) {
    if (!n.read) {
      ref.read(notificationsProvider.notifier).markRead(n.id).ignore();
    }
    if (n.target case final target?) context.push(notificationRoute(target));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final unread = ref.watch(unreadNotificationsProvider);
    return ProfilePageScaffold(
      title: l10n.profileNotificationCenter,
      actions: [
        if (unread > 0)
          IconButton(
            tooltip: l10n.profileMarkAllRead,
            icon: const Icon(Icons.done_all_rounded),
            onPressed: () =>
                ref.read(notificationsProvider.notifier).markAllRead().ignore(),
          ),
      ],
      body: AsyncView(
        value: ref.watch(notificationsProvider),
        errorLabel: l10n.commonSomethingWentWrong,
        retryLabel: l10n.commonRetry,
        onRetry: () => ref.invalidate(notificationsProvider),
        skeleton: const NotificationsSkeleton(),
        builder: (notifications) => notifications.isEmpty
            ? const NotificationsEmptyView()
            : ListView.separated(
                padding: const EdgeInsets.fromLTRB(
                  Insets.screen,
                  0,
                  Insets.screen,
                  Insets.xl,
                ),
                itemCount: notifications.length,
                separatorBuilder: (_, _) => const SizedBox(height: Insets.sm),
                itemBuilder: (_, i) => NotificationTile(
                  notification: notifications[i],
                  onTap: () => _open(context, ref, notifications[i]),
                ),
              ),
      ),
    );
  }
}
