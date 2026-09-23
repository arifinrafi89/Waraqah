import '../../../../core/domain/entities/book.dart';
import '../../domain/entities/primary_listing.dart';

abstract class CatalogSeedData {
  static final List<Book> sampleBooks = [
    Book(
      id: 'book-1',
      googleVolumeId: 'yv_fAAAAMAAJ',
      title: 'Lost Islamic History',
      subtitle: 'Reclaiming Muslim Civilisation from the Past',
      authors: const ['Firas Alkhateeb'],
      publisher: 'Hurst Publishers',
      publishedDate: '2014',
      description:
          'Islam has been one of the most powerful religious, social and political forces in history. Over the last 1400 years, from its origins in Arabia, a succession of empires and civilizations developed across the globe.',
      categories: const ['History', 'Islamic Studies'],
      pageCount: 240,
      language: 'en',
      thumbnailUrl:
          'https://books.google.com/books/content?id=yv_fAAAAMAAJ&printsec=frontcover&img=1&zoom=1',
      previewLink: 'https://books.google.com/books?id=yv_fAAAAMAAJ',
      averageRating: 4.8,
      ratingsCount: 320,
    ),
    Book(
      id: 'book-2',
      googleVolumeId: 'ngVqDwAAQBAJ',
      title: 'Atomic Habits',
      subtitle: 'An Easy & Proven Way to Build Good Habits & Break Bad Ones',
      authors: const ['James Clear'],
      publisher: 'Penguin',
      publishedDate: '2018',
      description:
          'No matter your goals, Atomic Habits offers a proven framework for improving--every day. James Clear reveals practical strategies to form good habits, break bad ones, and master tiny behaviors.',
      categories: const ['Self-Help', 'Psychology'],
      pageCount: 320,
      language: 'en',
      thumbnailUrl:
          'https://books.google.com/books/content?id=ngVqDwAAQBAJ&printsec=frontcover&img=1&zoom=1',
      previewLink: 'https://books.google.com/books?id=ngVqDwAAQBAJ',
      averageRating: 4.9,
      ratingsCount: 1540,
    ),
    Book(
      id: 'book-3',
      googleVolumeId: 'wrOQLV6xB-wC',
      title: 'The Sealed Nectar',
      subtitle: 'Biography of the Noble Prophet',
      authors: const ['Safiur Rahman Mubarakpuri'],
      publisher: 'Darussalam',
      publishedDate: '2002',
      description:
          'A complete authoritative book on the life of Prophet Muhammad (S) by Sheikh Safiur-Rahman Mubarakpuri. Honored by the World Muslim League as first prize winner.',
      categories: const ['Biography', 'Religion'],
      pageCount: 588,
      language: 'en',
      thumbnailUrl:
          'https://books.google.com/books/content?id=wrOQLV6xB-wC&printsec=frontcover&img=1&zoom=1',
      previewLink: 'https://books.google.com/books?id=wrOQLV6xB-wC',
      averageRating: 4.9,
      ratingsCount: 890,
    ),
  ];

  static final List<PrimaryListing> sampleListings = [
    // Lost Islamic History
    const PrimaryListing(
      id: 'list-1-pb',
      bookId: 'book-1',
      format: 'Paperback',
      priceAmount: 420.0,
      priceSource: 'google',
      stockStatus: 'in_stock',
    ),
    const PrimaryListing(
      id: 'list-1-hc',
      bookId: 'book-1',
      format: 'Hardcover',
      priceAmount: 680.0,
      priceSource: 'mock', // REQ-3.1.4 mock price fallback
      stockStatus: 'in_stock',
    ),
    const PrimaryListing(
      id: 'list-1-eb',
      bookId: 'book-1',
      format: 'eBook',
      priceAmount: 250.0,
      priceSource: 'google',
      stockStatus: 'in_stock',
    ),
    // Atomic Habits
    const PrimaryListing(
      id: 'list-2-pb',
      bookId: 'book-2',
      format: 'Paperback',
      priceAmount: 480.0,
      priceSource: 'google',
      stockStatus: 'in_stock',
    ),
    const PrimaryListing(
      id: 'list-2-eb',
      bookId: 'book-2',
      format: 'eBook',
      priceAmount: 320.0,
      priceSource: 'google',
      stockStatus: 'in_stock',
    ),
    // The Sealed Nectar
    const PrimaryListing(
      id: 'list-3-hc',
      bookId: 'book-3',
      format: 'Hardcover',
      priceAmount: 650.0,
      priceSource: 'mock',
      stockStatus: 'in_stock',
    ),
  ];
}

