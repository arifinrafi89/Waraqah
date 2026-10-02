import '../../domain/entities/notification_kind.dart';
import 'notification_fake_store.dart';
import 'notification_sends.dart';

/// Bites' and follows' notifications, one call per event. Likes send
/// nothing.
extension NotificationCommunitySends on NotificationFakeStore {
  /// [followerId] started following [readerId].
  void followed(String readerId, String followerId, String followerName) =>
      send(
        readerId,
        NotificationKind.newFollower,
        params: {'name': followerName},
        target: notificationTo(NotificationTargetKind.reader, followerId),
      );

  /// Someone commented on [authorId]'s Bite.
  void biteCommented(
    String authorId,
    String biteId,
    String name,
    String excerpt,
  ) => send(
    authorId,
    NotificationKind.biteComment,
    params: {'name': name, 'excerpt': excerpt},
    target: notificationTo(NotificationTargetKind.bite, biteId),
  );

  /// Someone replied to [authorId]'s comment on a Bite.
  void commentReplied(String authorId, String biteId, String name) => send(
    authorId,
    NotificationKind.commentReply,
    params: {'name': name},
    target: notificationTo(NotificationTargetKind.bite, biteId),
  );
}
