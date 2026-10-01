import 'package:flutter/foundation.dart';

import '../../../../core/models/book.dart';
import '../../../../core/models/edition.dart';

enum SearchSort { relevance, priceLow, priceHigh, newest, bestselling }

/// Everything catalog search can be narrowed by: a query, Section, Category,
/// Author, Publisher, sort, and the Search page's filters.
///
/// [formats], [languages], [minPrice], [maxPrice] and [inStockOnly] must all
/// hold for ONE Edition of a Book.
class CatalogFilters {
  const CatalogFilters({
    this.query = '',
    this.section,
    this.categoryId,
    this.authorId,
    this.publisherId,
    this.sort,
    this.minPrice,
    this.maxPrice,
    this.formats = const {},
    this.languages = const {},
    this.minRating,
    this.inStockOnly = false,
    this.includeHidden = false,
  });

  final String query;
  final Section? section;
  final String? categoryId;
  final String? authorId;
  final String? publisherId;

  /// `null` keeps the repository's default order for the page.
  final SearchSort? sort;

  /// Edition price in taka: [minPrice] included, [maxPrice] excluded.
  final int? minPrice;
  final int? maxPrice;
  final Set<BookFormat> formats;
  final Set<BookLanguage> languages;
  final double? minRating;
  final bool inStockOnly;

  /// Staff's list: hidden Books too.
  final bool includeHidden;

  /// A Section, Category, Author or Publisher page lists newest first.
  bool get isScoped =>
      section != null ||
      categoryId != null ||
      authorId != null ||
      publisherId != null;

  /// How many Search-sheet filters are set (price counts once).
  int get activeCount =>
      (section == null ? 0 : 1) +
      (minPrice != null || maxPrice != null ? 1 : 0) +
      (formats.isEmpty ? 0 : 1) +
      (languages.isEmpty ? 0 : 1) +
      (minRating == null ? 0 : 1) +
      (inStockOnly ? 1 : 0);

  /// These filters with the Search page's [query] and [sort] added.
  CatalogFilters withSearch(String query, SearchSort sort) => CatalogFilters(
    query: query,
    section: section,
    sort: sort,
    minPrice: minPrice,
    maxPrice: maxPrice,
    formats: formats,
    languages: languages,
    minRating: minRating,
    inStockOnly: inStockOnly,
  );

  /// Distinguishes every combination, for repository caches.
  String get cacheKey =>
      '$categoryId:$section:$authorId:$publisherId:$query:${sort?.name}:'
      '$minPrice:$maxPrice:${formats.map((f) => f.name).toList()..sort()}:'
      '${languages.map((l) => l.name).toList()..sort()}:$minRating:$inStockOnly:'
      '$includeHidden';

  @override
  bool operator ==(Object other) =>
      other is CatalogFilters &&
      other.cacheKey == cacheKey &&
      setEquals(other.formats, formats) &&
      setEquals(other.languages, languages);

  @override
  int get hashCode => cacheKey.hashCode;
}
