import '../../../../core/models/book.dart';

enum SearchSort { relevance, priceLow, priceHigh, newest, bestselling }

/// Everything catalog search can be narrowed by. Filters and sort join here.
class CatalogFilters {
  const CatalogFilters({
    this.query = '',
    this.section,
    this.categoryId,
    this.authorId,
    this.publisherId,
    this.sort,
  });

  final String query;
  final Section? section;
  final String? categoryId;
  final String? authorId;
  final String? publisherId;

  /// `null` keeps the repository's default order for the page.
  final SearchSort? sort;

  /// A Section, Category, Author or Publisher page lists newest first.
  bool get isScoped =>
      section != null ||
      categoryId != null ||
      authorId != null ||
      publisherId != null;

  @override
  bool operator ==(Object other) =>
      other is CatalogFilters &&
      other.query == query &&
      other.section == section &&
      other.categoryId == categoryId &&
      other.authorId == authorId &&
      other.publisherId == publisherId &&
      other.sort == sort;

  @override
  int get hashCode =>
      Object.hash(query, section, categoryId, authorId, publisherId, sort);
}
