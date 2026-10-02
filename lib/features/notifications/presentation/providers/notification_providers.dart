import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../data/repositories/notification_repository_impl.dart';
import '../../data/sources/notification_live_source.dart';
import '../../data/sources/notification_remote_source.dart';
import '../../domain/entities/app_notification.dart';
import '../../domain/repositories/notification_repository.dart';
import '../../domain/usecases/get_notifications.dart';
import '../../domain/usecases/mark_all_read.dart';
import '../../domain/usecases/mark_read.dart';
import '../../domain/usecases/watch_notifications.dart';

final notificationRepositoryProvider = Provider<NotificationRepository>(
  (ref) => NotificationRepositoryImpl(
    NotificationRemoteSource(ref.watch(dioProvider)),
    NotificationLiveSource(ref.watch(dioProvider)),
  ),
);

final getNotificationsProvider = Provider<GetNotifications>(
  (ref) => GetNotifications(ref.watch(notificationRepositoryProvider)),
);

final markReadProvider = Provider<MarkRead>(
  (ref) => MarkRead(ref.watch(notificationRepositoryProvider)),
);

final markAllReadProvider = Provider<MarkAllRead>(
  (ref) => MarkAllRead(ref.watch(notificationRepositoryProvider)),
);

final watchNotificationsProvider = Provider<WatchNotifications>(
  (ref) => WatchNotifications(ref.watch(notificationRepositoryProvider)),
);

/// The live connection: the unread count each time it changes, while
/// signed in. Empty for a Guest.
final notificationChangesProvider = StreamProvider<int>((ref) {
  if (ref.watch(sessionProvider.select((u) => u?.id)) == null) {
    return const Stream.empty();
  }
  final watch = ref.watch(watchNotificationsProvider);
  return Stream.fromFuture(watch(const NoParams()))
      .asyncExpand((changes) => changes);
});

/// The Reader's notifications, newest first; reloads when a change
/// arrives. Empty for a Guest.
class NotificationsNotifier extends AsyncNotifier<List<AppNotification>> {
  @override
  Future<List<AppNotification>> build() async {
    if (ref.watch(sessionProvider.select((u) => u?.id)) == null) return [];
    ref.listen(notificationChangesProvider, (_, next) {
      if (next.hasValue) _reload();
    });
    return ref.read(getNotificationsProvider).call(const NoParams());
  }

  Future<void> _reload() async {
    try {
      state = AsyncData(
        await ref.read(getNotificationsProvider).call(const NoParams()),
      );
    } catch (_) {
      // Keep what's shown; the next change tries again.
    }
  }

  Future<void> markRead(String id) async =>
      state = AsyncData(await ref.read(markReadProvider).call(id));

  Future<void> markAllRead() async => state = AsyncData(
    await ref.read(markAllReadProvider).call(const NoParams()),
  );
}

final notificationsProvider =
    AsyncNotifierProvider<NotificationsNotifier, List<AppNotification>>(
      NotificationsNotifier.new,
    );

/// How many notifications the Reader hasn't read; 0 for a Guest.
final unreadNotificationsProvider = Provider<int>(
  (ref) =>
      ref.watch(notificationsProvider).value?.where((n) => !n.read).length ?? 0,
);
