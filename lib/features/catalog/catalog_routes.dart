import 'package:go_router/go_router.dart';

import 'presentation/pages/book_detail_page.dart';
import 'presentation/pages/catalog_page.dart';

abstract final class CatalogRoutes {
  static const String catalog = '/catalog';
  static const String bookDetail = '/catalog/book/:id';

  /// Concrete location for one title's detail page.
  static String bookDetailFor(String id) => '/catalog/book/$id';

  static final List<RouteBase> routes = [
    GoRoute(
      path: bookDetail,
      builder: (_, state) =>
          BookDetailPage(bookId: state.pathParameters['id']!),
    ),
  ];

  static final StatefulShellBranch branch = StatefulShellBranch(
    routes: [GoRoute(path: catalog, builder: (_, _) => const CatalogPage())],
  );
}
