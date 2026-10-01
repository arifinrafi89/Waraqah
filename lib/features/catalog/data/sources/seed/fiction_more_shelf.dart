import '../../../../../core/models/book.dart';
import '../../../../../core/models/edition.dart';

/// Seed data for more Fiction titles. The Alchemist is sold out, so the
/// book club Booklist has a Book "Add whole list to cart" skips.
abstract final class FictionMoreShelf {
  static final List<Book> books = [
    Book(
      id: 'bk-sherlock',
      addedAt: DateTime(2026, 5, 7),
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
          isbn: '9789840001071',
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
    Book(
      id: 'bk-alchemist',
      addedAt: DateTime(2026, 5, 20),
      title: 'The Alchemist',
      author: 'Paulo Coelho',
      authorId: 'au-coelho',
      publisherId: 'pub-harpercollins',
      rating: 4.4,
      tags: ['Fiction'],
      categoryId: 'cat-fiction',
      coverSeed: 5,
      section: Section.literature,
      originalLanguage: BookLanguage.english,
      editions: [
        Edition(
          id: 'bk-alchemist-pb-en',
          format: BookFormat.paperback,
          language: BookLanguage.english,
          isbn: '9789840001996',
          priceBdt: 420,
          stock: 0,
        ),
      ],
    ),
  ];
}
