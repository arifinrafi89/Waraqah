import 'package:dio/dio.dart';

import '../../domain/entities/catalog_record.dart';
import 'catalog_admin_fake_banners.dart';
import 'catalog_admin_fake_records.dart';
import 'catalog_admin_fake_store.dart';
import 'record_counts.dart';

/// Admin → Catalog's fake endpoints, merged into `FakeApiInterceptor` by
/// `app/fake_api_routes.dart`. Every POST takes JSON in the body; a refused
/// change answers `null`.
abstract final class CatalogAdminFakeApi {
  static const String _base = '/admin/catalog';

  /// Body: a `BookDraft` (no `id` = new) → the saved Book.
  static const String saveBook = '$_base/books/save';

  /// Body `{id, hidden}` → the Book.
  static const String hideBook = '$_base/books/hide';

  /// `/admin/catalog/categories`, `/authors` or `/publishers`: every one,
  /// with `bookCount`. Add `/save` (body: the record, no `id` = new) or
  /// `/delete` (body `{id}`, refused while a Book uses it).
  static String records(RecordKind kind) => switch (kind) {
    RecordKind.category => '$_base/categories',
    RecordKind.author => '$_base/authors',
    RecordKind.publisher => '$_base/publishers',
  };

  /// Body: a Banner (empty `id` = new) → every Banner.
  static const String saveBanner = '$_base/banners/save';

  /// Body `{id}` → every Banner.
  static const String deleteBanner = '$_base/banners/delete';

  /// Body `{id, by: -1 | 1}` → every Banner.
  static const String moveBanner = '$_base/banners/move';

  static Map<String, Object? Function(RequestOptions)> routes(
    CatalogAdminFakeStore store,
  ) => {
    saveBook: (o) => store.saveBook(_body(o))?.toJson(),
    hideBook: (o) =>
        store.setHidden(_id(o), hidden: _body(o)['hidden'] == true)?.toJson(),
    for (final kind in RecordKind.values) ...{
      records(kind): (_) => RecordCounts.list(kind),
      '${records(kind)}/save': (o) =>
          CatalogAdminFakeRecords.save(kind, _body(o)),
      '${records(kind)}/delete': (o) =>
          CatalogAdminFakeRecords.delete(kind, _id(o)),
    },
    saveBanner: (o) => CatalogAdminFakeBanners.save(_body(o)),
    deleteBanner: (o) => CatalogAdminFakeBanners.delete(_id(o)),
    moveBanner: (o) =>
        CatalogAdminFakeBanners.move(_id(o), _body(o)['by'] as int? ?? 0),
  };

  static Map<String, dynamic> _body(RequestOptions options) =>
      options.data as Map<String, dynamic>? ?? const {};

  static String _id(RequestOptions options) =>
      _body(options)['id'] as String? ?? '';
}
