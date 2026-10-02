// Edits the catalog's Collection and Booklist fixtures in place; see
// CatalogAdminFakeStore.
import '../../../../core/models/book.dart';
import '../../../catalog/data/models/booklist_model.dart';
import '../../../catalog/data/models/collection_model.dart';
import '../../../catalog/data/sources/book_fixtures.dart';
import '../../../catalog/data/sources/booklist_fixtures.dart';
import '../../../catalog/data/sources/collection_fixtures.dart';
import '../../../catalog/data/sources/expert_fixtures.dart';
import '../../../catalog/domain/entities/booklist.dart';
import '../../domain/entities/list_draft.dart';
import '../../domain/entities/list_rules.dart';
import 'unique_id.dart';

/// Staff's Collections and Booklists on the fake backend. Each answers
/// `{id}`, or `null` when refused.
abstract final class CatalogAdminFakeLists {
  static Object? saveCollection(Map<String, dynamic> json) {
    final d = _draft(json);
    final ids = [for (final c in CollectionFixtures.all) c.id];
    if (!_ok(d, ids) ||
        d.kind != null ||
        (d.expertId != null &&
            !ExpertFixtures.all.any((e) => e.id == d.expertId))) {
      return null;
    }
    final id = d.id ?? uniqueId('col', d.titleEn, ids);
    _put(
      CollectionFixtures.all,
      ids.indexOf(id),
      CollectionModel(
        id: id,
        titleEn: d.titleEn.trim(),
        titleBn: d.titleBn.trim(),
        noteEn: d.noteEn.trim(),
        noteBn: d.noteBn.trim(),
        bookIds: d.bookIds,
        section: d.section,
        expertId: d.expertId,
      ),
    );
    return {'id': id};
  }

  static Object? deleteCollection(String id) {
    final before = CollectionFixtures.all.length;
    CollectionFixtures.all.removeWhere((c) => c.id == id);
    return CollectionFixtures.all.length < before ? {'id': id} : null;
  }

  /// Staff's only: a Reader's own lists aren't theirs to change.
  static Object? saveBooklist(Map<String, dynamic> json) {
    final d = _draft(json);
    final ids = [
      for (final b in BooklistFixtures.all)
        if (!b.isMine) b.id,
    ];
    if (!_ok(d, ids) || d.kind == null || d.kind == BooklistKind.personal) {
      return null;
    }
    final id = d.id ?? uniqueId('bl', d.titleEn, ids);
    _put(
      BooklistFixtures.all,
      BooklistFixtures.all.indexWhere((b) => b.id == id),
      BooklistModel(
        id: id,
        titleEn: d.titleEn.trim(),
        titleBn: d.titleBn.trim(),
        noteEn: d.noteEn.trim().isEmpty ? null : d.noteEn.trim(),
        noteBn: d.noteBn.trim().isEmpty ? null : d.noteBn.trim(),
        kind: d.kind!,
        bookIds: d.bookIds,
      ),
    );
    return {'id': id};
  }

  static Object? deleteBooklist(String id) {
    final before = BooklistFixtures.all.length;
    BooklistFixtures.all.removeWhere((b) => b.id == id && !b.isMine);
    return BooklistFixtures.all.length < before ? {'id': id} : null;
  }

  static ListDraft _draft(Map<String, dynamic> j) => ListDraft(
    id: j['id'] as String?,
    titleEn: j['titleEn'] as String? ?? '',
    titleBn: j['titleBn'] as String? ?? '',
    noteEn: j['noteEn'] as String? ?? '',
    noteBn: j['noteBn'] as String? ?? '',
    section: Section.values.asNameMap()[j['section']],
    expertId: j['expertId'] as String?,
    kind: BooklistKind.values.asNameMap()[j['kind']],
    bookIds: [...?(j['bookIds'] as List<dynamic>?)?.cast<String>()],
  );

  /// Passes [ListRules], every book exists, and an [ids] one when it has
  /// an id.
  static bool _ok(ListDraft d, List<String> ids) =>
      ListRules.check(d).isEmpty &&
      (d.id == null || ids.contains(d.id)) &&
      d.bookIds.every((id) => BookFixtures.all.any((b) => b.id == id));

  static void _put<T>(List<T> list, int at, T item) =>
      at < 0 ? list.add(item) : list[at] = item;
}
