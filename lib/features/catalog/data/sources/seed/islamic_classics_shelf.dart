import '../../../../../core/models/book.dart';
import '../../../../../core/models/edition.dart';

/// Seed data for more classical Islamic works.
abstract final class IslamicClassicsShelf {
  static const List<Book> books = [
    Book(
      id: 'bk-adabmufrad',
      title: 'Al-Adab al-Mufrad',
      author: 'Imam al-Bukhari',
      priceBdt: 480,
      vendor: 'Wafilife',
      vendorCount: 3,
      rating: 4.6,
      tags: ['Islamic Studies', 'Hadith'],
      category: 'Islamic Studies',
      isBeneficial: true,
      coverSeed: 3,
      section: Section.religious,
      originalLanguage: BookLanguage.arabic,
      editions: [
        Edition(
          id: 'bk-adabmufrad-pb-bn',
          format: BookFormat.paperback,
          language: BookLanguage.bangla,
          priceBdt: 480,
          stock: 16,
        ),
      ],
    ),
    Book(
      id: 'bk-ihya',
      title: 'Ihya Ulum al-Din',
      author: 'Imam al-Ghazali',
      priceBdt: 890,
      vendor: 'Rokomari',
      vendorCount: 2,
      rating: 4.7,
      tags: ['Islamic Studies'],
      category: 'Islamic Studies',
      isBeneficial: true,
      coverSeed: 0,
      section: Section.religious,
      originalLanguage: BookLanguage.arabic,
      editions: [
        Edition(
          id: 'bk-ihya-hc-bn',
          format: BookFormat.hardcover,
          language: BookLanguage.bangla,
          priceBdt: 890,
          stock: 6,
        ),
      ],
    ),
    Book(
      id: 'bk-madarij',
      title: 'Madarij as-Salikin',
      author: 'Ibn Qayyim al-Jawziyya',
      priceBdt: 1050,
      originalPriceBdt: 1200,
      vendor: 'Wafilife',
      vendorCount: 2,
      rating: 4.8,
      tags: ['Islamic Studies'],
      category: 'Islamic Studies',
      isBeneficial: true,
      coverSeed: 1,
      section: Section.religious,
      originalLanguage: BookLanguage.arabic,
      editions: [
        Edition(
          id: 'bk-madarij-hc-bn',
          format: BookFormat.hardcover,
          language: BookLanguage.bangla,
          priceBdt: 1050,
          listPriceBdt: 1200,
          stock: 5,
        ),
      ],
    ),
  ];
}
