import 'package:go_router/go_router.dart';

import 'presentation/pages/my_requests_page.dart';
import 'presentation/pages/new_request_page.dart';

abstract final class BookRequestRoutes {
  /// The signed-in reader's requests. Signed-in only (see
  /// `RouteAccess.signedInOnly`).
  static const String requests = '/requests';

  /// The request form. Open to guests, who log in to send it.
  static const String newRequest = '/request-book';

  /// The form with what the reader searched for or scanned filled in.
  static String newFor({String? title, String? bookId}) => Uri(
    path: newRequest,
    queryParameters: {'title': ?title, 'bookId': ?bookId},
  ).toString();

  static final List<RouteBase> routes = [
    GoRoute(path: requests, builder: (_, _) => const MyRequestsPage()),
    GoRoute(
      path: newRequest,
      builder: (_, state) => NewRequestPage(
        title: state.uri.queryParameters['title'] ?? '',
        bookId: state.uri.queryParameters['bookId'],
      ),
    ),
  ];
}
