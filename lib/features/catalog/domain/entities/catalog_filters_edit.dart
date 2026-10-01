import '../../../../core/models/book.dart';
import '../../../../core/models/edition.dart';
import 'catalog_filters.dart';

const Object _keep = Object();

/// Changing one Search filter at a time. Pass `null` to clear a filter;
/// leave a parameter out to keep it.
extension CatalogFiltersEdit on CatalogFilters {
  CatalogFilters copyWith({
    Object? section = _keep,
    Object? minPrice = _keep,
    Object? maxPrice = _keep,
    Set<BookFormat>? formats,
    Set<BookLanguage>? languages,
    Object? minRating = _keep,
    bool? inStockOnly,
  }) => CatalogFilters(
    query: query,
    section: identical(section, _keep) ? this.section : section as Section?,
    categoryId: categoryId,
    authorId: authorId,
    publisherId: publisherId,
    sort: sort,
    minPrice: identical(minPrice, _keep) ? this.minPrice : minPrice as int?,
    maxPrice: identical(maxPrice, _keep) ? this.maxPrice : maxPrice as int?,
    formats: formats ?? this.formats,
    languages: languages ?? this.languages,
    minRating: identical(minRating, _keep)
        ? this.minRating
        : minRating as double?,
    inStockOnly: inStockOnly ?? this.inStockOnly,
  );
}
