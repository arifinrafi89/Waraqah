import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../orders/presentation/widgets/order_labels.dart';
import '../../domain/entities/app_notification.dart';
import '../../domain/entities/notification_kind.dart';
import 'notification_text.dart';

/// One notification: an icon for its kind, the title (bold with an accent
/// dot while unread), its line and when it happened.
class NotificationTile extends StatelessWidget {
  const NotificationTile({
    super.key,
    required this.notification,
    required this.onTap,
  });

  final AppNotification notification;
  final VoidCallback onTap;

  static IconData _icon(NotificationKind kind) => switch (kind) {
    NotificationKind.orderStatus ||
    NotificationKind.returnDecided => Icons.local_shipping_outlined,
    NotificationKind.moderationWarning ||
    NotificationKind.banned => Icons.gavel_rounded,
    NotificationKind.alertTriggered => Icons.trending_down_rounded,
    NotificationKind.bookWanted => Icons.person_search_outlined,
    NotificationKind.sellBackPaid ||
    NotificationKind.sellBackReturned => Icons.autorenew_rounded,
    _ => Icons.menu_book_outlined,
  };

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final text = notificationText(AppL10n.of(context)!, notification);
    final unread = !notification.read;
    return SurfaceCard(
      padding: EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(Insets.md),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: Insets.md,
            children: [
              Icon(_icon(notification.kind), color: palette.accent),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 2,
                  children: [
                    Text(
                      text.title,
                      style: AppFonts.ui(
                        size: 13.5,
                        weight: unread ? FontWeight.w800 : FontWeight.w500,
                        color: palette.text,
                      ),
                    ),
                    if (text.body.isNotEmpty)
                      Text(
                        text.body,
                        style: AppFonts.ui(size: 12, color: palette.textDim),
                      ),
                    Text(
                      context.orderTime(notification.createdAt),
                      style: AppFonts.ui(size: 10.5, color: palette.textFaint),
                    ),
                  ],
                ),
              ),
              if (unread)
                Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.only(top: 5),
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
}
