import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../profile/profile_routes.dart';
import '../../domain/entities/app_notification.dart';
import '../providers/notification_providers.dart';

class NotificationCenterPage extends ConsumerWidget {
  const NotificationCenterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final notifications = ref.watch(notificationCenterProvider);
    final actions = ref.read(notificationCenterProvider.notifier);
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(Insets.md, 6, Insets.md, 10),
              child: Row(
                spacing: Insets.md,
                children: [
                  AppIconButton(
                    icon: Icons.arrow_back_rounded,
                    onPressed: () => context.canPop()
                        ? context.pop()
                        : context.go(ProfileRoutes.profile),
                  ),
                  Expanded(
                    child: Text(
                      l10n.profileNotificationCenter,
                      style: context.texts.titleLarge,
                    ),
                  ),
                  TextButton(
                    onPressed: notifications.any((item) => !item.isRead)
                        ? actions.markAllRead
                        : null,
                    child: Text(l10n.profileMarkAllRead),
                  ),
                ],
              ),
            ),
            Expanded(
              child: notifications.isEmpty
                  ? Center(child: Text(l10n.profileNoNotifications))
                  : ListView.separated(
                      padding: const EdgeInsets.fromLTRB(
                        Insets.screen,
                        0,
                        Insets.screen,
                        Insets.xl,
                      ),
                      itemCount: notifications.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 8),
                      itemBuilder: (_, index) => _NotificationTile(
                        notification: notifications[index],
                        onTap: () => actions.markRead(notifications[index].id),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  const _NotificationTile({required this.notification, required this.onTap});

  final AppNotification notification;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Material(
      color: notification.isRead
          ? palette.surface
          : palette.accent.withAlpha(18),
      borderRadius: BorderRadius.circular(Radii.card),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(Radii.card),
        child: Padding(
          padding: const EdgeInsets.all(Insets.md),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: Insets.md,
            children: [
              Icon(_iconFor(notification.kind), color: palette.accent),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text(
                      notification.title,
                      style: AppFonts.ui(
                        size: 13,
                        weight: notification.isRead
                            ? FontWeight.w600
                            : FontWeight.w800,
                        color: palette.text,
                      ),
                    ),
                    Text(
                      notification.message,
                      style: AppFonts.ui(size: 12, color: palette.textDim),
                    ),
                    Text(
                      _dateLabel(notification.createdAt),
                      style: AppFonts.ui(size: 10, color: palette.textFaint),
                    ),
                  ],
                ),
              ),
              if (!notification.isRead)
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: palette.accent,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _iconFor(NotificationKind kind) => switch (kind) {
    NotificationKind.orderUpdate => Icons.local_shipping_outlined,
    NotificationKind.listingApproved => Icons.verified_outlined,
    NotificationKind.newMessage => Icons.chat_bubble_outline_rounded,
    NotificationKind.general => Icons.notifications_none_rounded,
  };

  String _dateLabel(DateTime date) =>
      '${date.day.toString().padLeft(2, '0')}/'
      '${date.month.toString().padLeft(2, '0')}/${date.year}';
}
