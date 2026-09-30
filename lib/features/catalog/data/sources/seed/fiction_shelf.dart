import '../../../../../core/models/book.dart';
import '../../../../../core/models/edition.dart';

/// Seed data for the Fiction shelf.
abstract final class FictionShelf {
  static final List<Book> books = [
    Book(
      id: 'bk-hobbit',
      title: 'The Hobbit',
      shortTitle: 'Hobbit',
      author: 'J. R. R. Tolkien',
      authorId: 'au-tolkien',
      publisherId: 'pub-harpercollins',
      rating: 4.8,
      tags: ['Fiction'],
      categoryId: 'cat-fiction',
      coverSeed: 0,
      section: Section.literature,
      originalLanguage: BookLanguage.english,
      editions: [
        Edition(
          id: 'bk-hobbit-pb-en',
          format: BookFormat.paperback,
          language: BookLanguage.english,
          priceBdt: 550,
          listPriceBdt: 650,
          stock: 20,
        ),
        Edition(
          id: 'bk-hobbit-pb-bn',
          format: BookFormat.paperback,
          language: BookLanguage.bangla,
          priceBdt: 380,
          stock: 9,
        ),
      ],
    ),
    Book(
      id: 'bk-hpstone',
      title: "Harry Potter and the Philosopher's Stone",
      shortTitle: 'Harry Potter',
      author: 'J. K. Rowling',
      authorId: 'au-rowling',
      publisherId: 'pub-bloomsbury',
      rating: 4.9,
      tags: ['Fiction'],
      categoryId: 'cat-fiction',
      coverSeed: 1,
      section: Section.literature,
      originalLanguage: BookLanguage.english,
      editions: [
        Edition(
          id: 'bk-hpstone-pb-en',
          format: BookFormat.paperback,
          language: BookLanguage.english,
          priceBdt: 620,
          stock: 25,
        ),
        Edition(
          id: 'bk-hpstone-hc-en',
          format: BookFormat.hardcover,
          language: BookLanguage.english,
          priceBdt: 1100,
          stock: 3,
        ),
      ],
    ),
    Book(
      id: 'bk-davinci',
      title: 'The Da Vinci Code',
      shortTitle: 'Da Vinci Code',
      author: 'Dan Brown',
      authorId: 'au-brown',
      publisherId: 'pub-doubleday',
      rating: 4.3,
      tags: ['Fiction'],
      categoryId: 'cat-fiction',
      coverSeed: 2,
      section: Section.literature,
      originalLanguage: BookLanguage.english,
      editions: [
        Edition(
          id: 'bk-davinci-pb-en',
          format: BookFormat.paperback,
          language: BookLanguage.english,
          priceBdt: 450,
          listPriceBdt: 520,
          stock: 14,
        ),
      ],
    ),
  ];
}
