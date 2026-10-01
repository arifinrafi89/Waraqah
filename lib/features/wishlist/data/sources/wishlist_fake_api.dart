import 'package:dio/dio.dart';

// The fake backend sees the whole catalog, like the real server will.
import '../../../catalog/data/sources/book_fixtures.dart';

/// Wishlist's fake endpoints, merged into `FakeApiInterceptor` by
/// `app/fake_api_routes.dart`. The list endpoints answer the whole list of
/// saved books, newest first.
abstract final class WishlistFakeApi {
  static const String wishlist = '/wishlist';

  /// Body: `{bookId}`. Saving a book twice keeps one copy, moved to the top.
  static const String save = '/wishlist/save';

  /// Body: `{bookId}`.
  static const String remove = '/wishlist/remove';

  /// Body: `{ownerName}`, the name friends see (there are no auth tokens
  /// yet to tell the server who is asking). Answers `{id, ownerName, books}`.
  static const String share = '/wishlist/share';

  /// `?id=wl-nabila`; answers `{id, ownerName, books}` or `null`.
  static const String shared = '/wishlist/shared';

  static const String _mine = 'wl-mine';

  /// A friend's list, so a shared link can be tried on a fresh start.
  static const Map<String, (String, List<String>)> _demo = {
    'wl-nabila': ('Nabila', ['bk-atomic', 'bk-sapiens', 'bk-cleancode']),
  };

  /// A fresh, empty wishlist for each interceptor, so every test starts clean.
  static Map<String, Object? Function(RequestOptions)> routes() {
    final ids = <String>[];
    String? myName;
    List<Object?> books(List<String> ids) => [
      for (final id in ids)
        ?BookFixtures.all.where((book) => book.id == id).firstOrNull?.toJson(),
    ];
    Map<String, Object?> list(String id, String name, List<String> ids) => {
      'id': id,
      'ownerName': name,
      'books': books(ids),
    };
    return {
      wishlist: (_) => books(ids),
      save: (options) {
        final id = _field(options, 'bookId');
        if (BookFixtures.all.any((book) => book.id == id)) {
          ids
            ..remove(id)
            ..insert(0, id);
        }
        return books(ids);
      },
      remove: (options) {
        ids.remove(_field(options, 'bookId'));
        return books(ids);
      },
      share: (options) {
        final name = _field(options, 'ownerName');
        if (name.isEmpty) return null;
        myName = name;
        return list(_mine, name, ids);
      },
      shared: (options) {
        final id = options.queryParameters['id'] as String? ?? '';
        if (id == _mine) return myName == null ? null : list(id, myName!, ids);
        final (name, demoIds) = _demo[id] ?? ('', const <String>[]);
        return name.isEmpty ? null : list(id, name, demoIds);
      },
    };
  }

  static String _field(RequestOptions options, String key) =>
      (options.data as Map<String, dynamic>? ?? const {})[key] as String? ?? '';
}
