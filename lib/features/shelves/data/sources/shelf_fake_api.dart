import 'package:dio/dio.dart';

import '../../domain/entities/shelf_entry.dart';
import 'shelf_fake_store.dart';

/// The shelves' fake endpoints, merged into `FakeApiInterceptor` by
/// `app/fake_api_routes.dart`.
abstract final class ShelfFakeApi {
  /// The signed-in reader's shelves, newest first.
  static const String mine = '/shelves';

  /// Body `{bookId, shelf}`; no `shelf` takes the Book off. Answers the
  /// shelves, or `null` for a Book the catalog doesn't have.
  static const String move = '/shelves/move';

  static Map<String, Object? Function(RequestOptions)> routes(
    ShelfFakeStore store,
  ) => {
    mine: (_) => store.mine(),
    move: (options) {
      final body = options.data as Map<String, dynamic>? ?? const {};
      final shelf = Shelf.values
          .where((s) => s.name == body['shelf'])
          .firstOrNull;
      return store.move(body['bookId'] as String? ?? '', shelf)
          ? store.mine()
          : null;
    },
  };
}
