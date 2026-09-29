import '../../../../../core/models/book.dart';
import '../../../../../core/models/edition.dart';

/// Seed data for Islamic history and sociology.
abstract final class IslamicHistoryShelf {
  static const List<Book> books = [
    Book(
      id: 'bk-muqaddimah',
      title: 'Al-Muqaddimah',
      author: 'Ibn Khaldun',
      priceBdt: 780,
      vendor: 'Rokomari',
      vendorCount: 3,
      rating: 4.5,
      tags: ['Islamic Studies', 'History'],
      category: 'Islamic Studies',
      isBeneficial: true,
      coverSeed: 2,
      section: Section.religious,
      originalLanguage: BookLanguage.arabic,
      editions: [
        Edition(
          id: 'bk-muqaddimah-pb-en',
          format: BookFormat.paperback,
          language: BookLanguage.english,
          priceBdt: 780,
          stock: 12,
        ),
      ],
    ),
  ];
}
