import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/notification_kind.dart';

/// A follow, comment or reply notification's title and line.
({String title, String body}) communityText(
  AppL10n l10n,
  NotificationKind kind,
  Map<String, String> p,
) {
  final name = p['name'] ?? '';
  return switch (kind) {
    NotificationKind.newFollower => (
      title: l10n.notificationNewFollower(name),
      body: l10n.notificationNewFollowerBody,
    ),
    NotificationKind.biteComment => (
      title: l10n.notificationBiteComment(name),
      body: p['excerpt'] ?? '',
    ),
    _ => (
      title: l10n.notificationCommentReply(name),
      body: l10n.notificationCommentReplyBody,
    ),
  };
}
