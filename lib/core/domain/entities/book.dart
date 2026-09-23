/// Canonical Book domain entity shared across all features.
class Book {
  final String id;
  final String googleVolumeId;
  final String? isbn13;
  final String? isbn10;
  final String title;
  final String? subtitle;
  final List<String> authors;
  final String? publisher;
  final String? publishedDate;
  final String? description;
  final List<String> categories;
  final int? pageCount;
  final String? language;
  final String? thumbnailUrl;
  final String? previewLink;
  final double? averageRating;
  final int? ratingsCount;
  final DateTime? lastSyncedAt;

  const Book({
    required this.id,
    required this.googleVolumeId,
    this.isbn13,
    this.isbn10,
    required this.title,
    this.subtitle,
    this.authors = const [],
    this.publisher,
    this.publishedDate,
    this.description,
    this.categories = const [],
    this.pageCount,
    this.language,
    this.thumbnailUrl,
    this.previewLink,
    this.averageRating,
    this.ratingsCount,
    this.lastSyncedAt,
  });

  String get authorsDisplay =>
      authors.isEmpty ? 'Unknown Author' : authors.join(', ');

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          googleVolumeId == other.googleVolumeId;

  @override
  int get hashCode => id.hashCode ^ googleVolumeId.hashCode;
}
