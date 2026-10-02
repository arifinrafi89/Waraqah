import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import 'notification_fake_store.dart';

/// Notifications' fake endpoints, merged into `FakeApiInterceptor` by
/// `app/fake_api_routes.dart`. Changes answer the list, or `null` when
/// refused.
abstract final class NotificationFakeApi {
  /// The signed-in Reader's notifications, newest first.
  static const String notifications = '/notifications';

  /// Body `{id}`.
  static const String read = '/notifications/read';

  static const String readAll = '/notifications/read-all';

  /// Server-sent events: one `data: {"unread": n}` line per change.
  static const String live = '/notifications/live';

  static Map<String, Object? Function(RequestOptions)> routes(
    NotificationFakeStore store,
  ) {
    List<Map<String, dynamic>> mine() => [
      for (final note in store.mine()) note.toJson(),
    ];
    return {
      notifications: (_) => mine(),
      read: (o) {
        final body = o.data as Map<String, dynamic>? ?? const {};
        return store.markRead(body['id'] as String? ?? '') ? mine() : null;
      },
      readAll: (_) {
        store.markAllRead();
        return mine();
      },
      live: (_) => ResponseBody(
        store.changes.map(
          (unread) => Uint8List.fromList(
            utf8.encode('data: ${jsonEncode({'unread': unread})}\n\n'),
          ),
        ),
        200,
        headers: {
          Headers.contentTypeHeader: ['text/event-stream'],
        },
      ),
    };
  }
}
