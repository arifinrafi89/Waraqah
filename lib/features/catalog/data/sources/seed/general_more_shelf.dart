import '../../../../../core/models/book.dart';
import '../../../../../core/models/edition.dart';

/// Seed data for more academic and business titles.
abstract final class GeneralMoreShelf {
  static const List<Book> books = [
    Book(
      id: 'bk-calculus',
      title: 'Calculus: Early Transcendentals',
      shortTitle: 'Calculus',
      author: 'James Stewart',
      priceBdt: 1750,
      vendor: 'Rokomari',
      vendorCount: 2,
      rating: 4.2,
      tags: ['Academic'],
      category: 'Mathematics',
      isBeneficial: true,
      coverSeed: 2,
      section: Section.academic,
      originalLanguage: BookLanguage.english,
      editions: [
        Edition(
          id: 'bk-calculus-hc-en',
          format: BookFormat.hardcover,
          language: BookLanguage.english,
          priceBdt: 1750,
          stock: 5,
        ),
        Edition(
          id: 'bk-calculus-pb-en',
          format: BookFormat.paperback,
          language: BookLanguage.english,
          priceBdt: 1400,
          stock: 0,
        ),
      ],
    ),
    Book(
      id: 'bk-zero',
      title: 'Zero to One',
      author: 'Peter Thiel',
      priceBdt: 520,
      vendor: 'Rokomari',
      vendorCount: 3,
      rating: 4.4,
      tags: ['Business'],
      category: 'Business',
      coverSeed: 1,
      section: Section.nonFiction,
      originalLanguage: BookLanguage.english,
      editions: [
        Edition(
          id: 'bk-zero-pb-en',
          format: BookFormat.paperback,
          language: BookLanguage.english,
          priceBdt: 520,
          stock: 18,
        ),
        Edition(
          id: 'bk-zero-pb-bn',
          format: BookFormat.paperback,
          language: BookLanguage.bangla,
          priceBdt: 430,
          stock: 12,
        ),
      ],
    ),
  ];
}
