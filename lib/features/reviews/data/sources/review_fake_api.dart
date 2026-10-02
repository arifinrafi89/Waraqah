import 'package:dio/dio.dart';

// Reviewers' names come from the marketplace's readers.
import '../../../p2p/data/sources/p2p_people.dart';
import '../models/review_model.dart';
import 'review_fake_store.dart';
import 'review_record.dart';

/// Reviews' fake endpoints, merged into `FakeApiInterceptor` by
/// `app/fake_api_routes.dart`. Each answers the Book's reviews
/// (`{average, count, mine?, reviews[]}`), or `null` when refused.
abstract final class ReviewFakeApi {
  /// `?bookId=`.
  static const String reviews = '/reviews';

  /// Body `{bookId, stars, text}`.
  static const String save = '/reviews/save';

  /// Body `{bookId}`: deletes "me"'s review.
  static const String delete = '/reviews/delete';

  static Map<String, Object? Function(RequestOptions)> routes(
    ReviewFakeStore store,
  ) {
    ReviewModel model(ReviewRecord r) => ReviewModel(
      id: r.id,
      bookId: r.bookId,
      authorId: r.authorId,
      authorName: P2pPeople.find(r.authorId)?.name ?? '?',
      stars: r.stars,
      createdAt: r.createdAt,
      text: r.text,
      editedAt: r.editedAt,
      verified: store.verified(r),
      isMine: r.authorId == P2pPeople.me,
    );
    Map<String, dynamic> summary(String bookId) {
      final list = store.forBook(bookId);
      final mine = store.mine(bookId);
      return BookReviewsModel(
        average: store.average(bookId),
        count: list.length,
        mine: mine == null ? null : model(mine),
        reviews: [for (final r in list) model(r)],
      ).toJson();
    }

    String bookOf(RequestOptions o) =>
        (o.data as Map<String, dynamic>?)?['bookId'] as String? ?? '';
    return {
      reviews: (o) => summary(o.queryParameters['bookId'] as String? ?? ''),
      save: (o) {
        final body = o.data as Map<String, dynamic>? ?? const {};
        final saved = store.save(
          bookOf(o),
          body['stars'] as int? ?? 0,
          body['text'] as String? ?? '',
        );
        return saved == null ? null : summary(saved.bookId);
      },
      delete: (o) => store.delete(bookOf(o)) ? summary(bookOf(o)) : null,
    };
  }
}
