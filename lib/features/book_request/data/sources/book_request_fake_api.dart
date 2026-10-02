import 'package:dio/dio.dart';

import '../../domain/entities/book_request.dart';
import 'book_request_demand.dart';
import 'book_request_fake_store.dart';

/// Book requests' fake endpoints, merged into `FakeApiInterceptor` by
/// `app/fake_api_routes.dart`. Changes answer `null` when refused.
abstract final class BookRequestFakeApi {
  /// Body `{title, author?, bookId?, maxPriceBdt?, note?}`.
  static const String create = '/requests';

  static const String mine = '/requests/mine';

  /// Body `{id}`: answers the reader's requests.
  static const String close = '/requests/close';

  /// Other readers' requests for books the reader is selling.
  static const String wanted = '/requests/wanted';

  /// Open requests per title, for admins.
  static const String demand = '/requests/demand';

  static Map<String, Object? Function(RequestOptions)> routes(
    BookRequestFakeStore store,
  ) => {
    create: (o) {
      final body = o.data as Map<String, dynamic>? ?? const {};
      return store.create(
        BookRequestDraft(
          title: body['title'] as String? ?? '',
          author: body['author'] as String?,
          bookId: body['bookId'] as String?,
          maxPriceBdt: body['maxPriceBdt'] as int?,
          note: body['note'] as String?,
        ),
      );
    },
    mine: (_) => store.mine(),
    close: (o) => store.close((o.data as Map?)?['id'] as String? ?? '')
        ? store.mine()
        : null,
    wanted: (_) => store.wanted(),
    demand: (_) => store.demand(),
  };
}
