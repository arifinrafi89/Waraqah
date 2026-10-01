import 'package:go_router/go_router.dart';

import 'presentation/pages/book_form_page.dart';

/// Admin → Catalog's sub-pages. [routes] are children of `/admin/catalog`,
/// so the `/admin` guard covers them.
abstract final class CatalogAdminRoutes {
  /// The Book form for a new Book.
  static const String newBook = '/admin/catalog/book';

  /// The Book form for an existing Book.
  static String bookFor(String id) =>
      Uri(path: newBook, queryParameters: {'id': id}).toString();

  static final List<RouteBase> routes = [
    GoRoute(
      path: 'book',
      builder: (_, state) =>
          BookFormPage(bookId: state.uri.queryParameters['id']),
    ),
  ];
}
