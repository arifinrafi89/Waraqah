import '../../../../core/models/book.dart';
import '../../../../core/models/edition.dart';
import '../../domain/entities/book_draft.dart';

/// The body of `/admin/catalog/books/save`.
extension BookDraftJson on BookDraft {
  Map<String, dynamic> toJson() => {
    'id': ?id,
    'title': title,
    'titleBn': titleBn,
    'authorId': authorId,
    'publisherId': publisherId,
    'section': section.name,
    'categoryId': categoryId,
    'originalLanguage': originalLanguage.name,
    'coverSeed': coverSeed,
    'editions': [for (final e in editions) e.toJson()],
  };

  static BookDraft fromJson(Map<String, dynamic> json) => BookDraft(
    id: json['id'] as String?,
    title: json['title'] as String? ?? '',
    titleBn: json['titleBn'] as String? ?? '',
    authorId: json['authorId'] as String? ?? '',
    publisherId: json['publisherId'] as String? ?? '',
    section: Section.values.byName(json['section'] as String),
    categoryId: json['categoryId'] as String? ?? '',
    originalLanguage: BookLanguage.values.byName(
      json['originalLanguage'] as String,
    ),
    coverSeed: json['coverSeed'] as int? ?? 0,
    editions: [
      for (final e in json['editions'] as List<dynamic>? ?? const [])
        Edition.fromJson(e as Map<String, dynamic>),
    ],
  );
}
