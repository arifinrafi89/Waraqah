import '../../../../../core/models/book.dart';
import '../../../../../core/models/edition.dart';

/// Seed data for more Fiction titles.
abstract final class FictionMoreShelf {
  static final List<Book> books = [
    Book(
      id: 'bk-sherlock',
      title: 'Sherlock Holmes: A Study in Scarlet',
      shortTitle: 'Sherlock Holmes',
      author: 'Arthur Conan Doyle',
      authorId: 'au-doyle',
      publisherId: 'pub-penguin',
      rating: 4.6,
      tags: ['Fiction'],
      categoryId: 'cat-fiction',
      coverSeed: 3,
      section: Section.literature,
      originalLanguage: BookLanguage.english,
      editions: [
        Edition(
          id: 'bk-sherlock-pb-en',
          format: BookFormat.paperback,
          language: BookLanguage.english,
          priceBdt: 380,
          stock: 30,
        ),
        Edition(
          id: 'bk-sherlock-eb-en',
          format: BookFormat.ebook,
          language: BookLanguage.english,
          priceBdt: 150,
          stock: 999,
        ),
      ],
    ),
  ];
}
