import 'package:dio/dio.dart';

import '../models/collection_model.dart';
import 'book_fixtures.dart';
import 'collection_fixtures.dart';

/// Collections' fake endpoints, merged into `FakeApiInterceptor` by
/// `app/fake_api_routes.dart`. Each Collection comes with its `books`.
abstract final class CollectionFakeApi {
  /// Every Collection, or one Section's: `?section=<Section name>`.
  static const String collections = '/collections';

  /// One Collection: `?id=<collectionId>`, or `null` when unknown.
  static const String detail = '/collections/detail';

  static final Map<String, Object? Function(RequestOptions)> routes = {
    collections: (options) {
      final section = options.queryParameters['section'] as String?;
      return [
        for (final c in CollectionFixtures.all)
          if (section == null || c.section?.name == section) _json(c),
      ];
    },
    detail: (options) {
      final id = options.queryParameters['id'] as String?;
      final found = CollectionFixtures.all.where((c) => c.id == id);
      return found.isEmpty ? null : _json(found.first);
    },
  };

  static Map<String, dynamic> _json(CollectionModel collection) => {
    ...collection.toJson(),
    'books': [
      for (final id in collection.bookIds)
        ...BookFixtures.all.where((b) => b.id == id).map((b) => b.toJson()),
    ],
  };
}
