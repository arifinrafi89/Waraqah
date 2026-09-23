import '../../domain/entities/book.dart';

class BookDto {
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

  const BookDto({
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

  factory BookDto.fromJson(Map<String, dynamic> json) {
    return BookDto(
      id: json['id'] as String,
      googleVolumeId: json['google_volume_id'] as String? ?? '',
      isbn13: json['isbn_13'] as String?,
      isbn10: json['isbn_10'] as String?,
      title: json['title'] as String? ?? 'Untitled',
      subtitle: json['subtitle'] as String?,
      authors: (json['authors'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          const [],
      publisher: json['publisher'] as String?,
      publishedDate: json['published_date'] as String?,
      description: json['description'] as String?,
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          const [],
      pageCount: json['page_count'] as int?,
      language: json['language'] as String?,
      thumbnailUrl: json['thumbnail_url'] as String?,
      previewLink: json['preview_link'] as String?,
      averageRating: (json['average_rating'] as num?)?.toDouble(),
      ratingsCount: json['ratings_count'] as int?,
      lastSyncedAt: json['last_synced_at'] != null
          ? DateTime.tryParse(json['last_synced_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'google_volume_id': googleVolumeId,
      'isbn_13': isbn13,
      'isbn_10': isbn10,
      'title': title,
      'subtitle': subtitle,
      'authors': authors,
      'publisher': publisher,
      'published_date': publishedDate,
      'description': description,
      'categories': categories,
      'page_count': pageCount,
      'language': language,
      'thumbnail_url': thumbnailUrl,
      'preview_link': previewLink,
      'average_rating': averageRating,
      'ratings_count': ratingsCount,
      'last_synced_at': lastSyncedAt?.toIso8601String(),
    };
  }

  Book toDomain() {
    return Book(
      id: id,
      googleVolumeId: googleVolumeId,
      isbn13: isbn13,
      isbn10: isbn10,
      title: title,
      subtitle: subtitle,
      authors: authors,
      publisher: publisher,
      publishedDate: publishedDate,
      description: description,
      categories: categories,
      pageCount: pageCount,
      language: language,
      thumbnailUrl: thumbnailUrl,
      previewLink: previewLink,
      averageRating: averageRating,
      ratingsCount: ratingsCount,
      lastSyncedAt: lastSyncedAt,
    );
  }
}

