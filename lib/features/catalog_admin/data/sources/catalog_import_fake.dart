import '../../domain/entities/catalog_record.dart';
import 'catalog_admin_fake_records.dart';
import 'catalog_admin_fake_store.dart';
import 'record_counts.dart';

/// `POST /admin/catalog/import` on the fake backend.
abstract final class CatalogImportFake {
  /// Saves each Book in [books] (`{row, author, publisher, ...BookDraft}`)
  /// through [store], which checks it again. An Author or Publisher no
  /// record is named is created, and removed again if its Book is refused.
  static Map<String, Object> run(
    CatalogAdminFakeStore store,
    List<dynamic> books,
  ) {
    var imported = 0;
    final skipped = <Map<String, Object?>>[];
    for (final json in books.cast<Map<String, dynamic>>()) {
      final made = <(RecordKind, String)>[];
      String idFor(RecordKind kind, String name) {
        final key = name.trim().toLowerCase();
        final known = RecordCounts.list(kind).where(
          (r) => [
            r['name'],
            r['nameBn'],
          ].any((n) => (n as String?)?.toLowerCase() == key),
        );
        if (known.isNotEmpty) return known.first['id'] as String;
        final id = CatalogAdminFakeRecords.save(kind, {'name': name})?['id'];
        if (id is String) made.add((kind, id));
        return id as String? ?? '';
      }

      final saved = store.saveBook({
        ...json,
        'id': null,
        'authorId': idFor(RecordKind.author, json['author'] as String? ?? ''),
        'publisherId': idFor(
          RecordKind.publisher,
          json['publisher'] as String? ?? '',
        ),
      });
      if (saved != null) {
        imported++;
        continue;
      }
      for (final (kind, id) in made) {
        CatalogAdminFakeRecords.delete(kind, id);
      }
      skipped.add({'row': json['row'], 'reason': 'refused'});
    }
    return {'imported': imported, 'skipped': skipped};
  }
}
