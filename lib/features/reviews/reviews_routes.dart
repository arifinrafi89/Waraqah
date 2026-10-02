import 'package:go_router/go_router.dart';

import 'presentation/pages/book_reviews_page.dart';

abstract final class ReviewsRoutes {
  /// Every review of one Book; open to guests.
  static const String reviews = '/reviews';

  static String forBook(String bookId) =>
      Uri(path: reviews, queryParameters: {'bookId': bookId}).toString();

  static final List<RouteBase> routes = [
    GoRoute(
      path: reviews,
      builder: (_, state) =>
          BookReviewsPage(bookId: state.uri.queryParameters['bookId'] ?? ''),
    ),
  ];
}
