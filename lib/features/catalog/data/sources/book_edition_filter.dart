import '../../../../core/models/book.dart';
import '../../../../core/models/edition.dart';

/// Fake-API filters on a Book's rating, Editions, Class, Exam and Subject.
abstract final class BookEditionFilter {
  /// Books in [books] passing the `/books` query [params]. Format, language,
  /// price and `inStock` must all hold for one single Edition; an in-stock
  /// Edition has stock above zero (pre-orders don't count).
  static Iterable<Book> apply(
    Iterable<Book> books,
    Map<String, dynamic> params,
  ) {
    final formats = _names(params['format']);
    final languages = _names(params['language']);
    final minPrice = _int(params['minPrice']);
    final maxPrice = _int(params['maxPrice']);
    final minRating = (params['minRating'] as num?)?.toDouble();
    final inStock = params['inStock'] == true;
    final classLevel = _int(params['class']);
    final exam = params['exam'] as String?;
    final subject = params['subject'] as String?;
    bool fits(Edition e) =>
        (formats.isEmpty || formats.contains(e.format.name)) &&
        (languages.isEmpty || languages.contains(e.language.name)) &&
        (minPrice == null || e.priceBdt >= minPrice) &&
        (maxPrice == null || e.priceBdt < maxPrice) &&
        (!inStock || e.stock > 0);
    return books.where(
      (b) =>
          (minRating == null || b.rating >= minRating) &&
          (classLevel == null || b.classes.contains(classLevel)) &&
          (exam == null || b.exams.any((e) => e.name == exam)) &&
          (subject == null || b.subjectId == subject) &&
          b.editions.any(fits),
    );
  }

  static Set<String> _names(Object? value) =>
      value == null ? {} : (value as String).split(',').toSet();

  static int? _int(Object? value) =>
      value is String ? int.tryParse(value) : (value as num?)?.toInt();
}
