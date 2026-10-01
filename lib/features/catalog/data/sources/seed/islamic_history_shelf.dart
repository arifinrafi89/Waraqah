import '../../../../../core/models/book.dart';
import '../../../../../core/models/edition.dart';

/// Seed data for Islamic history and sociology.
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
      isBeneficial: true,
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
  ];
}
