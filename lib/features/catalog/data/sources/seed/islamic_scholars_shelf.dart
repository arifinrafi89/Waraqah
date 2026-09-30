import '../../../../../core/models/book.dart';
import '../../../../../core/models/edition.dart';

/// Seed data for classical scholarship added to the Islamic shelf.
abstract final class IslamicScholarsShelf {
  static final List<Book> books = [
    Book(
      id: 'bk-tafsir-ibnkathir',
      title: 'Tafsir Ibn Kathir',
      author: 'Ibn Kathir',
      rating: 4.8,
      tags: ['Islamic Studies', 'Tafsir'],
      category: 'Islamic Studies',
      isBeneficial: true,
      coverSeed: 0,
      section: Section.religious,
      originalLanguage: BookLanguage.arabic,
      editions: [
        Edition(
          id: 'bk-tafsir-ibnkathir-hc-bn',
          format: BookFormat.hardcover,
          language: BookLanguage.bangla,
          priceBdt: 950,
          listPriceBdt: 1100,
          stock: 7,
        ),
        Edition(
          id: 'bk-tafsir-ibnkathir-eb-en',
          format: BookFormat.ebook,
          language: BookLanguage.english,
          priceBdt: 600,
          stock: 999,
        ),
      ],
    ),
    Book(
      id: 'bk-bidayah',
      title: 'Al-Bidayah wan-Nihayah',
      shortTitle: 'Al-Bidayah',
      author: 'Ibn Kathir',
      rating: 4.7,
      tags: ['Islamic Studies', 'History'],
      category: 'Islamic Studies',
      isBeneficial: true,
      coverSeed: 1,
      section: Section.religious,
      originalLanguage: BookLanguage.arabic,
      editions: [
        Edition(
          id: 'bk-bidayah-hc-bn',
          format: BookFormat.hardcover,
          language: BookLanguage.bangla,
          priceBdt: 1400,
          stock: 0,
          isPreorder: true,
        ),
      ],
    ),
    Book(
      id: 'bk-bukhari',
      title: 'Sahih al-Bukhari',
      author: 'Imam al-Bukhari',
      rating: 4.9,
      tags: ['Islamic Studies', 'Hadith'],
      category: 'Islamic Studies',
      isBeneficial: true,
      coverSeed: 2,
      section: Section.religious,
      originalLanguage: BookLanguage.arabic,
      editions: [
        Edition(
          id: 'bk-bukhari-hc-bn',
          format: BookFormat.hardcover,
          language: BookLanguage.bangla,
          priceBdt: 1200,
          listPriceBdt: 1350,
          stock: 11,
        ),
        Edition(
          id: 'bk-bukhari-hc-ar',
          format: BookFormat.hardcover,
          language: BookLanguage.arabic,
          priceBdt: 1800,
          stock: 4,
        ),
      ],
    ),
  ];
}
