import '../../../../../core/models/book.dart';
import '../../../../../core/models/edition.dart';

/// Seed data for the Islamic curation shelf.
abstract final class IslamicShelf {
  static final List<Book> books = [
    Book(
      id: 'bk-fiqh',
      title: 'Fiqh us-Sunnah, Vol. 1',
      shortTitle: 'Fiqh us-Sunnah',
      author: 'Sayyid Sabiq',
      authorId: 'au-sayyid-sabiq',
      publisherId: 'pub-american-trust',
      rating: 4.9,
      tags: ['Islamic Studies'],
      categoryId: 'cat-islamic-studies',
      isBeneficial: true,
      coverSeed: 3,
      section: Section.religious,
      originalLanguage: BookLanguage.arabic,
      editions: [
        Edition(
          id: 'bk-fiqh-hc-bn',
          format: BookFormat.hardcover,
          language: BookLanguage.bangla,
          priceBdt: 540,
          stock: 14,
        ),
        Edition(
          id: 'bk-fiqh-hc-en',
          format: BookFormat.hardcover,
          language: BookLanguage.english,
          priceBdt: 780,
          stock: 6,
        ),
      ],
    ),
    Book(
      id: 'bk-nectar',
      title: 'The Sealed Nectar',
      shortTitle: 'Sealed Nectar',
      author: 'Safi-ur-Rahman al-Mubarakpuri',
      authorId: 'au-mubarakpuri',
      publisherId: 'pub-darussalam',
      rating: 4.9,
      tags: ['Biography'],
      categoryId: 'cat-islamic-studies',
      isBeneficial: true,
      coverSeed: 1,
      section: Section.religious,
      originalLanguage: BookLanguage.arabic,
      editions: [
        Edition(
          id: 'bk-nectar-pb-bn',
          format: BookFormat.paperback,
          language: BookLanguage.bangla,
          priceBdt: 420,
          stock: 22,
        ),
        Edition(
          id: 'bk-nectar-pb-en',
          format: BookFormat.paperback,
          language: BookLanguage.english,
          priceBdt: 520,
          stock: 10,
        ),
      ],
    ),
    Book(
      id: 'bk-riyad',
      title: 'Riyad as-Salihin',
      author: 'Imam an-Nawawi',
      authorId: 'au-nawawi',
      publisherId: 'pub-darussalam',
      rating: 5.0,
      tags: ['Islamic Studies', 'Hadith'],
      categoryId: 'cat-islamic-studies',
      isBeneficial: true,
      coverSeed: 3,
      section: Section.religious,
      originalLanguage: BookLanguage.arabic,
      editions: [
        Edition(
          id: 'bk-riyad-hc-bn',
          format: BookFormat.hardcover,
          language: BookLanguage.bangla,
          priceBdt: 480,
          stock: 9,
        ),
        Edition(
          id: 'bk-riyad-hc-ar',
          format: BookFormat.hardcover,
          language: BookLanguage.arabic,
          priceBdt: 690,
          stock: 3,
        ),
      ],
    ),
  ];
}
