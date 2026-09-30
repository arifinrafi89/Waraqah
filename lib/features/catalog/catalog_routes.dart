import 'package:go_router/go_router.dart';

import '../../core/models/book.dart';
import 'presentation/pages/book_detail_page.dart';
import 'catalog_tab_routes.dart';
import 'presentation/pages/catalog_page.dart';
import 'presentation/pages/look_inside_page.dart';
import 'presentation/pages/questions_page.dart';

abstract final class CatalogRoutes {
  static const String catalog = '/catalog';
  static const String section = '/catalog/section/:section';

  /// A Section's page, inside the Catalog tab so the bottom nav stays.
  static String sectionFor(Section section) =>
      '/catalog/section/${section.name}';

  static const String category = '/catalog/section/:section/:category';

  /// A Category's page, inside the Catalog tab so the bottom nav stays.
  static String categoryFor(Section section, String id) =>
      '/catalog/section/${section.name}/$id';

  static const String author = '/catalog/author/:id';

  /// An Author's page, inside the Catalog tab so the bottom nav stays.
  static String authorFor(String id) => '/catalog/author/$id';

  static const String publisher = '/catalog/publisher/:id';

  /// A Publisher's page, inside the Catalog tab so the bottom nav stays.
  static String publisherFor(String id) => '/catalog/publisher/$id';

  static const String series = '/catalog/series/:id';

  /// A Series' page, inside the Catalog tab so the bottom nav stays.
  static String seriesFor(String id) => '/catalog/series/$id';

  /// The Search page, inside the Catalog tab so the bottom nav stays.
  static const String search = '/catalog/search';

  /// Stand-in for Request this book, until that flow lands.
  static const String requestBook = '/catalog/request-book';

  static const String bookDetail = '/catalog/book/:id';

  /// Concrete location for one title's detail page.
  static String bookDetailFor(String id) => '/catalog/book/$id';

  static const String lookInside = '/catalog/book/:id/look-inside';

  /// A book's table of contents and sample pages.
  static String lookInsideFor(String id) => '/catalog/book/$id/look-inside';

  static const String questions = '/catalog/book/:id/questions';

  /// Every question and answer about a book.
  static String questionsFor(String id) => '/catalog/book/$id/questions';

  static final List<RouteBase> routes = [
    GoRoute(
      path: bookDetail,
      builder: (_, state) =>
          BookDetailPage(bookId: state.pathParameters['id']!),
    ),
    GoRoute(
      path: lookInside,
      builder: (_, state) =>
          LookInsidePage(bookId: state.pathParameters['id']!),
    ),
    GoRoute(
      path: questions,
      builder: (_, state) => QuestionsPage(bookId: state.pathParameters['id']!),
    ),
  ];

  static final StatefulShellBranch branch = StatefulShellBranch(
    routes: [
      GoRoute(
        path: catalog,
        builder: (_, _) => const CatalogPage(),
        routes: [...catalogTabRoutes],
      ),
    ],
  );
}
