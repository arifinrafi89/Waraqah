import 'package:go_router/go_router.dart';

import '../../core/models/book.dart';
import 'catalog_routes.dart';
import 'domain/entities/catalog_filters.dart';
import 'presentation/pages/author_page.dart';
import 'presentation/pages/category_page.dart';
import 'presentation/pages/collection_page.dart';
import 'presentation/pages/publisher_page.dart';
import 'presentation/pages/search_page.dart';
import 'presentation/pages/section_page.dart';
import 'presentation/pages/series_page.dart';

/// Pages opened from the Catalog tab, nested under `/catalog`.
final List<RouteBase> catalogTabRoutes = [
  GoRoute(
    path: 'section/:section',
    redirect: (_, state) =>
        Section.values.asNameMap()[state.pathParameters['section']] == null
        ? CatalogRoutes.catalog
        : null,
    routes: [
      GoRoute(
        path: ':category',
        builder: (_, state) => CategoryPage(
          section: Section.values.byName(state.pathParameters['section']!),
          categoryId: state.pathParameters['category']!,
        ),
      ),
    ],
    builder: (_, state) => SectionPage(
      section: Section.values.byName(state.pathParameters['section']!),
    ),
  ),
  GoRoute(
    path: 'author/:id',
    builder: (_, state) => AuthorPage(authorId: state.pathParameters['id']!),
  ),
  GoRoute(
    path: 'publisher/:id',
    builder: (_, state) =>
        PublisherPage(publisherId: state.pathParameters['id']!),
  ),
  GoRoute(
    path: 'series/:id',
    builder: (_, state) => SeriesPage(seriesId: state.pathParameters['id']!),
  ),
  GoRoute(
    path: 'collection/:id',
    builder: (_, state) =>
        CollectionPage(collectionId: state.pathParameters['id']!),
  ),
  GoRoute(
    path: 'search',
    builder: (_, state) => SearchPage(
      sort: SearchSort.values.asNameMap()[state.uri.queryParameters['sort']],
      query: state.uri.queryParameters['q'] ?? '',
    ),
  ),
];
