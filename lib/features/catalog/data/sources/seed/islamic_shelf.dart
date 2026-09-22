import '../../../../../core/models/book.dart';

/// Seed data for the Islamic curation shelf.
abstract final class IslamicShelf {
  static const List<Book> books = [
    Book(
      id: 'bk-fiqh',
      title: 'Fiqh us-Sunnah, Vol. 1',
      shortTitle: 'Fiqh us-Sunnah',
      author: 'Sayyid Sabiq',
      priceBdt: 540,
      vendor: 'Wafilife',
      vendorCount: 2,
      rating: 4.9,
      tags: ['Islamic Studies'],
      category: 'Islamic Studies',
      isBeneficial: true,
      coverSeed: 3,
    ),
    Book(
      id: 'bk-nectar',
      title: 'The Sealed Nectar',
      shortTitle: 'Sealed Nectar',
      author: 'Safi-ur-Rahman al-Mubarakpuri',
      priceBdt: 420,
      vendor: 'Wafilife',
      vendorCount: 3,
      rating: 4.9,
      tags: ['Biography'],
      category: 'Islamic Studies',
      isBeneficial: true,
      coverSeed: 1,
    ),
    Book(
      id: 'bk-riyad',
      title: 'Riyad as-Salihin',
      author: 'Imam an-Nawawi',
      priceBdt: 480,
      vendor: 'Wafilife',
      vendorCount: 3,
      rating: 5.0,
      tags: ['Islamic Studies', 'Hadith'],
      category: 'Islamic Studies',
      isBeneficial: true,
      coverSeed: 3,
    ),
  ];
}
