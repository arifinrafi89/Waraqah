import 'package:go_router/go_router.dart';

import 'presentation/pages/bite_compose_page.dart';
import 'presentation/pages/book_bites_page.dart';
import 'presentation/pages/bite_detail_page.dart';
import 'presentation/pages/bites_page.dart';

abstract final class BitesRoutes {
  static const String bites = '/bites';

  /// The composer. Signed-in only (see `RouteAccess.signedInOnly`).
  static const String compose = '/bites/compose';

  /// The composer editing Bite [id], or pre-tagged with [bookId].
  static String composeFor({String? id, String? bookId}) => Uri(
    path: compose,
    queryParameters: {'id': ?id, 'bookId': ?bookId},
  ).toString();

  /// One Bite with its comments; open to guests.
  static const String detail = '/bites/detail';

  static String detailFor(String id) =>
      Uri(path: detail, queryParameters: {'id': id}).toString();

  /// Every Bite about one Book; open to guests.
  static const String book = '/bites/book';

  static String forBook(String bookId) =>
      Uri(path: book, queryParameters: {'id': bookId}).toString();

  static final List<RouteBase> routes = [
    GoRoute(
      path: book,
      builder: (_, state) =>
          BookBitesPage(bookId: state.uri.queryParameters['id'] ?? ''),
    ),
    GoRoute(
      path: detail,
      builder: (_, state) =>
          BiteDetailPage(id: state.uri.queryParameters['id'] ?? ''),
    ),
    GoRoute(
      path: compose,
      builder: (_, state) => BiteComposePage(
        id: state.uri.queryParameters['id'],
        bookId: state.uri.queryParameters['bookId'],
      ),
    ),
  ];

  static final StatefulShellBranch branch = StatefulShellBranch(
    routes: [GoRoute(path: bites, builder: (_, _) => const BitesPage())],
  );
}
