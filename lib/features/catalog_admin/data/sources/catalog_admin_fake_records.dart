// Edits the catalog's fixture lists in place; see CatalogAdminFakeStore.
import '../../../../core/models/book.dart';
import '../../../catalog/data/models/catalog_record_models.dart';
import '../../../catalog/data/sources/author_fixtures.dart';
import '../../../catalog/data/sources/book_fixtures.dart';
import '../../../catalog/data/sources/category_fixtures.dart';
import '../../../catalog/data/sources/publisher_fixtures.dart';
import '../../domain/entities/catalog_admin_rules.dart';
import '../../domain/entities/catalog_record.dart';
import 'record_counts.dart';
import 'unique_id.dart';

/// Staff's changes to Categories, Authors and Publishers on the fake backend.
abstract final class CatalogAdminFakeRecords {
  /// Adds (no `id`) or updates one; `null` when refused. A used Category
  /// keeps its Section, so its Books stay in theirs.
  static Map<String, dynamic>? save(RecordKind kind, Map<String, dynamic> j) {
    final name = (j['name'] as String? ?? '').trim();
    final nameBn = (j['nameBn'] as String? ?? '').trim();
    final section = switch (j['section']) {
      final String s => Section.values.byName(s),
      _ => null,
    };
    final ids = [for (final r in RecordCounts.list(kind)) r['id'] as String];
    final id = j['id'] as String? ?? _newId(kind, name, ids);
    final record = CatalogRecord(name: name, nameBn: nameBn);
    if (CatalogAdminRules.record(kind, record).isNotEmpty ||
        (j['id'] != null && !ids.contains(id))) {
      return null;
    }
    switch (kind) {
      case RecordKind.category:
        final old = CategoryFixtures.all.where((c) => c.id == id).firstOrNull;
        if (section == null ||
            (old != null &&
                old.section != section &&
                RecordCounts.count(kind, id) > 0)) {
          return null;
        }
        _put(CategoryFixtures.all, (c) => c.id == id, (_) {
          return CategoryModel(
            id: id,
            section: section,
            nameEn: name,
            nameBn: nameBn,
          );
        });
      case RecordKind.author:
        _put(AuthorFixtures.all, (a) => a.id == id, (old) {
          return AuthorModel(
            id: id,
            name: name,
            nameBn: _orNull(nameBn),
          ).copyWith(bio: old?.bio);
        });
        for (final (i, b) in BookFixtures.all.indexed) {
          if (b.authorId == id) BookFixtures.all[i] = b.copyWith(author: name);
        }
      case RecordKind.publisher:
        _put(PublisherFixtures.all, (p) => p.id == id, (_) {
          return PublisherModel(id: id, name: name, nameBn: _orNull(nameBn));
        });
    }
    return RecordCounts.list(kind).firstWhere((r) => r['id'] == id);
  }

  /// Deletes one no Book uses; `null` when refused.
  static Object? delete(RecordKind kind, String id) {
    if (RecordCounts.count(kind, id) > 0) return null;
    final before = RecordCounts.list(kind).length;
    switch (kind) {
      case RecordKind.category:
        CategoryFixtures.all.removeWhere((c) => c.id == id);
      case RecordKind.author:
        AuthorFixtures.all.removeWhere((a) => a.id == id);
      case RecordKind.publisher:
        PublisherFixtures.all.removeWhere((p) => p.id == id);
    }
    return RecordCounts.list(kind).length < before ? {'id': id} : null;
  }

  static String _newId(RecordKind kind, String name, List<String> ids) =>
      uniqueId(
        switch (kind) {
          RecordKind.category => 'cat',
          RecordKind.author => 'au',
          RecordKind.publisher => 'pub',
        },
        name,
        ids,
      );

  static String? _orNull(String text) => text.isEmpty ? null : text;

  static void _put<T>(
    List<T> list,
    bool Function(T) same,
    T Function(T?) make,
  ) {
    final i = list.indexWhere(same);
    i < 0 ? list.add(make(null)) : list[i] = make(list[i]);
  }
}
