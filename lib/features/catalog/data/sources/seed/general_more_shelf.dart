import '../../../../../core/models/book.dart';
import '../../../../../core/models/edition.dart';

/// Seed data for more academic and business titles.
abstract final class GeneralMoreShelf {
  static final List<Book> books = [
    Book(
      id: 'bk-calculus',
      addedAt: DateTime(2026, 1, 22),
      title: 'Calculus: Early Transcendentals',
      shortTitle: 'Calculus',
      author: 'James Stewart',
      authorId: 'au-stewart',
      publisherId: 'pub-cengage',
      rating: 4.2,
      tags: ['Academic'],
      categoryId: 'cat-academic',
      coverSeed: 2,
      section: Section.academic,
      originalLanguage: BookLanguage.english,
      editions: [
        Edition(
          id: 'bk-calculus-hc-en',
          format: BookFormat.hardcover,
          language: BookLanguage.english,
          isbn: '9789840001491',
          priceBdt: 1750,
          stock: 5,
        ),
        Edition(
          id: 'bk-calculus-pb-en',
          format: BookFormat.paperback,
          language: BookLanguage.english,
          isbn: '9789840001569',
          priceBdt: 1400,
          stock: 0,
        ),
      ],
    ),
    Book(
      id: 'bk-zero',
      addedAt: DateTime(2026, 1, 29),
      title: 'Zero to One',
      author: 'Peter Thiel',
      authorId: 'au-thiel',
      publisherId: 'pub-crown',
      rating: 4.4,
      tags: ['Business'],
      categoryId: 'cat-business',
      coverSeed: 1,
      section: Section.nonFiction,
      originalLanguage: BookLanguage.english,
      editions: [
        Edition(
          id: 'bk-zero-pb-en',
          format: BookFormat.paperback,
          language: BookLanguage.english,
          isbn: '9789840001637',
          priceBdt: 520,
          stock: 18,
        ),
        Edition(
          id: 'bk-zero-pb-bn',
          format: BookFormat.paperback,
          language: BookLanguage.bangla,
          isbn: '9789840001705',
          priceBdt: 430,
          stock: 12,
        ),
      ],
    ),
  ];
}
