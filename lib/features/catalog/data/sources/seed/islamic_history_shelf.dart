import '../../../../../core/models/book.dart';
import '../../../../../core/models/edition.dart';

/// Seed data for Islamic history, sociology and Seerah.
abstract final class IslamicHistoryShelf {
  static final List<Book> books = [
    Book(
      id: 'bk-muqaddimah',
      addedAt: DateTime(2026, 4, 9),
      title: 'Al-Muqaddimah',
      author: 'Ibn Khaldun',
      authorId: 'au-ibn-khaldun',
      publisherId: 'pub-princeton',
      rating: 4.5,
      tags: ['Islamic Studies', 'History'],
      categoryId: 'cat-islamic-studies',
      coverSeed: 2,
      section: Section.religious,
      originalLanguage: BookLanguage.arabic,
      editions: [
        Edition(
          id: 'bk-muqaddimah-pb-en',
          format: BookFormat.paperback,
          language: BookLanguage.english,
          isbn: '9789840002337',
          priceBdt: 780,
          stock: 12,
        ),
      ],
    ),
    Book(
      id: 'bk-lings-muhammad',
      addedAt: DateTime(2026, 3, 18),
      title: 'Muhammad: His Life Based on the Earliest Sources',
      shortTitle: 'Muhammad',
      author: 'Martin Lings',
      authorId: 'au-lings',
      publisherId: 'pub-inner-traditions',
      rating: 4.8,
      tags: ['Biography'],
      categoryId: 'cat-islamic-studies',
      coverSeed: 0,
      section: Section.religious,
      originalLanguage: BookLanguage.english,
      editions: [
        Edition(
          id: 'bk-lings-muhammad-pb-en',
          format: BookFormat.paperback,
          language: BookLanguage.english,
          isbn: '9789840003662',
          priceBdt: 690,
          stock: 9,
        ),
      ],
    ),
    Book(
      id: 'bk-moon-split',
      addedAt: DateTime(2026, 3, 2),
      title: 'When the Moon Split',
      author: 'Safi-ur-Rahman al-Mubarakpuri',
      authorId: 'au-mubarakpuri',
      publisherId: 'pub-darussalam',
      rating: 4.7,
      tags: ['Biography'],
      categoryId: 'cat-islamic-studies',
      coverSeed: 3,
      section: Section.religious,
      originalLanguage: BookLanguage.english,
      editions: [
        Edition(
          id: 'bk-moon-split-pb-en',
          format: BookFormat.paperback,
          language: BookLanguage.english,
          isbn: '9789840003730',
          priceBdt: 380,
          stock: 15,
        ),
      ],
    ),
  ];
}
