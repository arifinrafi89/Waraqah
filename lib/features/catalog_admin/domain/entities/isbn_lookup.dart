import '../../../../core/models/edition.dart';

/// What looking up an ISBN found.
sealed class IsbnLookup {
  const IsbnLookup();
}

/// The ISBN is on an Edition of [bookId] already.
final class IsbnInCatalog extends IsbnLookup {
  const IsbnInCatalog(this.bookId);

  final String bookId;
}

/// A Book from outside the catalog, to fill a new Book's form.
final class IsbnFound extends IsbnLookup {
  const IsbnFound({
    required this.isbn,
    required this.title,
    this.titleBn,
    required this.author,
    required this.publisher,
    required this.language,
    required this.format,
    this.listPriceBdt,
  });

  final String isbn;
  final String title;
  final String? titleBn;
  final String author;
  final String publisher;
  final BookLanguage language;
  final BookFormat format;
  final int? listPriceBdt;
}
