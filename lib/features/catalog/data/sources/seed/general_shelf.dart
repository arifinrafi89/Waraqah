import '../../../../../core/models/book.dart';
import '../../../../../core/models/edition.dart';

/// Seed data for the academic, self-help and business shelves.
abstract final class GeneralShelf {
  static final List<Book> books = [
    Book(
      id: 'bk-sapiens',
      title: 'Sapiens: A Brief History of Humankind',
      shortTitle: 'Sapiens',
      author: 'Yuval Noah Harari',
      rating: 4.3,
      tags: ['Non-Fiction'],
      category: 'History',
      coverSeed: 0,
      section: Section.academic,
      originalLanguage: BookLanguage.english,
      editions: [
        Edition(
          id: 'bk-sapiens-pb-en',
          format: BookFormat.paperback,
          language: BookLanguage.english,
          priceBdt: 650,
          listPriceBdt: 780,
          stock: 24,
        ),
        Edition(
          id: 'bk-sapiens-pb-bn',
          format: BookFormat.paperback,
          language: BookLanguage.bangla,
          priceBdt: 520,
          stock: 15,
        ),
        Edition(
          id: 'bk-sapiens-eb-en',
          format: BookFormat.ebook,
          language: BookLanguage.english,
          priceBdt: 399,
          stock: 999,
        ),
      ],
    ),
    Book(
      id: 'bk-atomic',
      title: 'Atomic Habits',
      author: 'James Clear',
      rating: 4.7,
      tags: ['Self-Help'],
      category: 'Self-Help',
      coverSeed: 2,
      section: Section.nonFiction,
      originalLanguage: BookLanguage.english,
      editions: [
        Edition(
          id: 'bk-atomic-pb-en',
          format: BookFormat.paperback,
          language: BookLanguage.english,
          priceBdt: 590,
          listPriceBdt: 650,
          stock: 30,
        ),
        Edition(
          id: 'bk-atomic-hc-en',
          format: BookFormat.hardcover,
          language: BookLanguage.english,
          priceBdt: 890,
          stock: 2,
        ),
      ],
    ),
    Book(
      id: 'bk-cleancode',
      title: 'Clean Code',
      author: 'Robert C. Martin',
      rating: 4.6,
      tags: ['Academic', 'Software'],
      category: 'Computer Science',
      isBeneficial: true,
      coverSeed: 0,
      section: Section.academic,
      originalLanguage: BookLanguage.english,
      editions: [
        Edition(
          id: 'bk-cleancode-pb-en',
          format: BookFormat.paperback,
          language: BookLanguage.english,
          priceBdt: 1150,
          listPriceBdt: 1320,
          stock: 8,
        ),
        Edition(
          id: 'bk-cleancode-eb-en',
          format: BookFormat.ebook,
          language: BookLanguage.english,
          priceBdt: 700,
          stock: 999,
        ),
      ],
    ),
  ];
}
