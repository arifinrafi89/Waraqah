import 'package:go_router/go_router.dart';

import 'presentation/pages/book_form_page.dart';
import 'presentation/pages/collection_form_page.dart';
import 'presentation/pages/import_page.dart';
import 'presentation/pages/low_stock_page.dart';

/// Admin → Catalog's sub-pages. [routes] are children of `/admin/catalog`,
/// so the `/admin` guard covers them.
abstract final class CatalogAdminRoutes {
  /// The Book form for a new Book.
  static const String newBook = '/admin/catalog/book';

  /// The Book form for an existing Book.
  static String bookFor(String id) =>
      Uri(path: newBook, queryParameters: {'id': id}).toString();

  /// The builder for a new Collection.
  static const String newCollection = '/admin/catalog/collection';

  /// The builder for an existing Collection.
  static String collectionFor(String id) =>
      Uri(path: newCollection, queryParameters: {'id': id}).toString();

  /// The builder for a new Staff Booklist.
  static const String newBooklist = '$newCollection?list=booklist';

  /// The builder for an existing Staff Booklist.
  static String booklistFor(String id) => Uri(
    path: newCollection,
    queryParameters: {'id': id, 'list': 'booklist'},
  ).toString();

  /// Paste CSV rows to add Books.
  static const String importCsv = '/admin/catalog/import';

  /// Printed Editions running low.
  static const String lowStock = '/admin/catalog/low-stock';

  static final List<RouteBase> routes = [
    GoRoute(path: 'import', builder: (_, _) => const ImportPage()),
    GoRoute(path: 'low-stock', builder: (_, _) => const LowStockPage()),
    GoRoute(
      path: 'book',
      builder: (_, state) =>
          BookFormPage(bookId: state.uri.queryParameters['id']),
    ),
    GoRoute(
      path: 'collection',
      builder: (_, state) => CollectionFormPage(
        id: state.uri.queryParameters['id'],
        booklist: state.uri.queryParameters['list'] == 'booklist',
      ),
    ),
  ];
}
