import '../../../../../core/models/book.dart';
import '../../../../../core/models/edition.dart';

/// Seed data for more classical Islamic works.
abstract final class IslamicClassicsShelf {
  static final List<Book> books = [
    Book(
      id: 'bk-adabmufrad',
      addedAt: DateTime(2026, 3, 19),
      title: 'Al-Adab al-Mufrad',
      author: 'Imam al-Bukhari',
      authorId: 'au-bukhari',
      publisherId: 'pub-darussalam',
      rating: 4.6,
      tags: ['Islamic Studies', 'Hadith'],
      categoryId: 'cat-islamic-studies',
      coverSeed: 3,
      section: Section.religious,
      originalLanguage: BookLanguage.arabic,
      editions: [
        Edition(
          id: 'bk-adabmufrad-pb-bn',
          format: BookFormat.paperback,
          language: BookLanguage.bangla,
          isbn: '9789840002122',
          priceBdt: 480,
          stock: 16,
        ),
      ],
    ),
    Book(
      id: 'bk-ihya',
      addedAt: DateTime(2026, 3, 26),
      title: 'Ihya Ulum al-Din',
      author: 'Imam al-Ghazali',
      authorId: 'au-ghazali',
      publisherId: 'pub-ibt',
      rating: 4.7,
      tags: ['Islamic Studies'],
      categoryId: 'cat-islamic-studies',
      coverSeed: 0,
      section: Section.religious,
      originalLanguage: BookLanguage.arabic,
      editions: [
        Edition(
          id: 'bk-ihya-hc-bn',
          format: BookFormat.hardcover,
          language: BookLanguage.bangla,
          isbn: '9789840002191',
          priceBdt: 890,
          stock: 6,
        ),
      ],
    ),
    Book(
      id: 'bk-madarij',
      addedAt: DateTime(2026, 4, 2),
      title: 'Madarij as-Salikin',
      author: 'Ibn Qayyim al-Jawziyya',
      authorId: 'au-ibn-qayyim',
      publisherId: 'pub-dar-al-taqwa',
      rating: 4.8,
      tags: ['Islamic Studies'],
      categoryId: 'cat-islamic-studies',
      coverSeed: 1,
      section: Section.religious,
      originalLanguage: BookLanguage.arabic,
      editions: [
        Edition(
          id: 'bk-madarij-hc-bn',
          format: BookFormat.hardcover,
          language: BookLanguage.bangla,
          isbn: '9789840002269',
          priceBdt: 1050,
          listPriceBdt: 1200,
          stock: 5,
        ),
      ],
    ),
  ];
}
