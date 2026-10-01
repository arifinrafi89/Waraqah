import 'package:dio/dio.dart';

import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../domain/entities/sell_back.dart';
import 'sell_back_books.dart';
import 'sell_back_fake_store.dart';

/// Sell Back's fake endpoints, merged into `FakeApiInterceptor` by
/// `app/fake_api_routes.dart`. Changes answer `null` when refused.
abstract final class SellBackFakeApi {
  /// `?q=`: catalog Books Waraqah buys back.
  static const String books = '/sell-back/books';

  /// `?id=bk-zero`.
  static const String book = '/sell-back/book';

  /// Body `{bookId, condition, flags, pickupAddress}`.
  static const String create = '/sell-back';
  static const String mine = '/sell-back/mine';

  /// Picked-up books waiting to be graded, for staff.
  static const String queue = '/sell-back/queue';

  /// Body `{id, condition, accept, by}`: answers the queue.
  static const String grade = '/sell-back/grade';

  static Map<String, Object? Function(RequestOptions)> routes(
    SellBackFakeStore store,
  ) {
    String q(RequestOptions o, String key) =>
        o.queryParameters[key] as String? ?? '';
    Map<String, dynamic> body(RequestOptions o) =>
        o.data as Map<String, dynamic>? ?? const {};
    List<Object?> all(Iterable<dynamic> models) => [
      for (final m in models) m.toJson(),
    ];
    return {
      books: (o) => all(SellBackBooks.search(q(o, 'q'))),
      book: (o) => SellBackBooks.find(q(o, 'id'))?.toJson(),
      create: (o) => store
          .create(
            SellBackDraft(
              bookId: body(o)['bookId'] as String? ?? '',
              condition: BookCondition.values.byName(
                body(o)['condition'] as String,
              ),
              flags: body(o)['flags'] as int? ?? 0,
              pickupAddress: body(o)['pickupAddress'] as String? ?? '',
            ),
          )
          ?.toJson(),
      mine: (_) => all(store.mine()),
      queue: (_) => all(store.queue()),
      grade: (o) =>
          store.grade(
            body(o)['id'] as String? ?? '',
            BookCondition.values.byName(body(o)['condition'] as String),
            accept: body(o)['accept'] == true,
          )
          ? all(store.queue())
          : null,
    };
  }
}
