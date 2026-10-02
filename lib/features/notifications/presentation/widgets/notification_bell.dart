import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/app_icon_button.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../notifications_routes.dart';
import '../providers/notification_providers.dart';

/// The bell for a header: opens the notification center, with a badge for
/// unread ones that changes live. Renders nothing for a Guest.
class NotificationBell extends ConsumerWidget {
  const NotificationBell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(sessionProvider) == null) return const SizedBox.shrink();
    final unread = ref.watch(unreadNotificationsProvider);
    return AppIconButton(
      icon: Icons.notifications_none_rounded,
      tooltip: AppL10n.of(context)!.profileNotificationCenter,
      badgeCount: unread > 0 ? unread : null,
      onPressed: () => context.push(NotificationsRoutes.center),
    );
  }
}
