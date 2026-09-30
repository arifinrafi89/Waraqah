import 'package:dio/dio.dart';

// The fake backend sees the whole catalog, like the real server will.
import '../../../catalog/data/sources/book_fixtures.dart';

/// Wishlist's fake endpoints, merged into `FakeApiInterceptor` by
/// `app/fake_api_routes.dart`. Every endpoint answers with the whole list
/// of saved books, newest first.
abstract final class WishlistFakeApi {
  static const String wishlist = '/wishlist';

  /// Body: `{bookId}`. Saving a book twice keeps one copy, moved to the top.
  static const String save = '/wishlist/save';

  /// Body: `{bookId}`.
  static const String remove = '/wishlist/remove';

  /// A fresh, empty wishlist for each interceptor, so every test starts clean.
  static Map<String, Object? Function(RequestOptions)> routes() {
    final ids = <String>[];
    List<Object?> answer() => [
      for (final id in ids)
        ?BookFixtures.all.where((book) => book.id == id).firstOrNull?.toJson(),
    ];
    return {
      wishlist: (_) => answer(),
      save: (options) {
        final id = _bookId(options);
        if (BookFixtures.all.any((book) => book.id == id)) {
          ids
            ..remove(id)
            ..insert(0, id);
        }
        return answer();
      },
      remove: (options) {
        ids.remove(_bookId(options));
        return answer();
      },
    };
  }

  static String _bookId(RequestOptions options) =>
      (options.data as Map<String, dynamic>? ?? const {})['bookId']
          as String? ??
      '';
}
