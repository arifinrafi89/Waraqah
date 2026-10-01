import 'package:dio/dio.dart';

import '../models/collection_model.dart';
import 'book_fixtures.dart';
import 'collection_fixtures.dart';
import 'expert_fixtures.dart';

/// Collections' and Experts' fake endpoints, merged into `FakeApiInterceptor`
/// by `app/fake_api_routes.dart`. Each Collection comes with its `books`,
/// hidden ones left out, and its `expert` when it's an Expert Pick.
abstract final class CollectionFakeApi {
  /// Every Collection. Narrow with `?section=<Section name>`,
  /// `?expert=<expertId>` and `?hasExpert=true|false`.
  static const String collections = '/collections';

  /// One Collection: `?id=<collectionId>`, or `null` when unknown.
  static const String detail = '/collections/detail';

  /// Every Expert.
  static const String experts = '/experts';

  /// One Expert with their `collections`: `?id=<expertId>`, or `null`.
  static const String expert = '/experts/detail';

  static final Map<String, Object? Function(RequestOptions)> routes = {
    collections: (options) {
      final q = options.queryParameters;
      final hasExpert = switch (q['hasExpert']) {
        'true' || true => true,
        'false' || false => false,
        _ => null,
      };
      return [
        for (final c in CollectionFixtures.all)
          if ((q['section'] == null || c.section?.name == q['section']) &&
              (q['expert'] == null || c.expertId == q['expert']) &&
              (hasExpert == null || (c.expertId != null) == hasExpert))
            _json(c),
      ];
    },
    detail: (options) {
      final id = options.queryParameters['id'] as String?;
      final found = CollectionFixtures.all.where((c) => c.id == id);
      return found.isEmpty ? null : _json(found.first);
    },
    experts: (_) => [for (final e in ExpertFixtures.all) e.toJson()],
    expert: (options) {
      final id = options.queryParameters['id'] as String?;
      final found = ExpertFixtures.all.where((e) => e.id == id).firstOrNull;
      return found == null
          ? null
          : {
              ...found.toJson(),
              'collections': [
                for (final c in CollectionFixtures.all)
                  if (c.expertId == id) _json(c),
              ],
            };
    },
  };

  static Map<String, dynamic> _json(CollectionModel collection) => {
    ...collection.toJson(),
    'expert': ExpertFixtures.all
        .where((e) => e.id == collection.expertId)
        .firstOrNull
        ?.toJson(),
    'books': [
      for (final id in collection.bookIds)
        ...BookFixtures.all
            .where((b) => b.id == id && !b.hidden)
            .map((b) => b.toJson()),
    ],
  };
}
