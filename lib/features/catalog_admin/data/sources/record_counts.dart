import '../../../../core/models/book.dart';
import '../../../catalog/data/sources/author_fixtures.dart';
import '../../../catalog/data/sources/book_fixtures.dart';
import '../../../catalog/data/sources/category_fixtures.dart';
import '../../../catalog/data/sources/publisher_fixtures.dart';
import '../../domain/entities/catalog_record.dart';

/// Categories, Authors and Publishers as the admin endpoints send them,
/// each with how many Books use it.
abstract final class RecordCounts {
  static List<Map<String, dynamic>> list(RecordKind kind) => switch (kind) {
    RecordKind.category => [
      for (final c in CategoryFixtures.all)
        _json(kind, c.id, c.nameEn, c.nameBn, c.section),
    ],
    RecordKind.author => [
      for (final a in AuthorFixtures.all) _json(kind, a.id, a.name, a.nameBn),
    ],
    RecordKind.publisher => [
      for (final p in PublisherFixtures.all)
        _json(kind, p.id, p.name, p.nameBn),
    ],
  };

  static Map<String, dynamic> _json(
    RecordKind kind,
    String id,
    String name,
    String? nameBn, [
    Section? section,
  ]) => {
    'id': id,
    'name': name,
    'nameBn': ?nameBn,
    'section': ?section?.name,
    'bookCount': count(kind, id),
  };

  static int count(RecordKind kind, String id) => BookFixtures.all
      .where(
        (b) =>
            switch (kind) {
              RecordKind.category => b.categoryId,
              RecordKind.author => b.authorId,
              RecordKind.publisher => b.publisherId,
            } ==
            id,
      )
      .length;
}
