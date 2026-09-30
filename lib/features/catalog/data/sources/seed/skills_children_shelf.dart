import '../../../../../core/models/book.dart';
import '../../../../../core/models/edition.dart';

/// Seed data for Skills & Tech and Children.
abstract final class SkillsChildrenShelf {
  static final List<Book> books = [
    Book(
      id: 'bk-pragmatic',
      addedAt: DateTime(2026, 6, 11),
      title: 'The Pragmatic Programmer',
      shortTitle: 'Pragmatic Programmer',
      author: 'Andrew Hunt & David Thomas',
      authorId: 'au-hunt-thomas',
      publisherId: 'pub-addison-wesley',
      rating: 4.7,
      tags: ['Programming'],
      categoryId: 'cat-programming',
      coverSeed: 1,
      section: Section.skillsTech,
      originalLanguage: BookLanguage.english,
      editions: [
        Edition(
          id: 'bk-pragmatic-pb-en',
          format: BookFormat.paperback,
          language: BookLanguage.english,
          priceBdt: 1450,
          stock: 9,
        ),
      ],
    ),
    Book(
      id: 'bk-ddia',
      addedAt: DateTime(2026, 6, 18),
      title: 'Designing Data-Intensive Applications',
      shortTitle: 'Data-Intensive Apps',
      author: 'Martin Kleppmann',
      authorId: 'au-kleppmann',
      publisherId: 'pub-oreilly',
      rating: 4.8,
      tags: ['Data'],
      categoryId: 'cat-data-systems',
      coverSeed: 2,
      section: Section.skillsTech,
      originalLanguage: BookLanguage.english,
      editions: [
        Edition(
          id: 'bk-ddia-pb-en',
          format: BookFormat.paperback,
          language: BookLanguage.english,
          priceBdt: 1900,
          stock: 6,
        ),
      ],
    ),
    Book(
      id: 'bk-caterpillar',
      addedAt: DateTime(2026, 6, 25),
      title: 'The Very Hungry Caterpillar',
      shortTitle: 'Hungry Caterpillar',
      author: 'Eric Carle',
      authorId: 'au-carle',
      publisherId: 'pub-philomel',
      rating: 4.9,
      tags: ['Picture book'],
      categoryId: 'cat-picture-books',
      coverSeed: 3,
      section: Section.children,
      originalLanguage: BookLanguage.english,
      editions: [
        Edition(
          id: 'bk-caterpillar-hc-en',
          format: BookFormat.hardcover,
          language: BookLanguage.english,
          priceBdt: 650,
          stock: 14,
        ),
      ],
    ),
    Book(
      id: 'bk-matilda',
      addedAt: DateTime(2026, 7, 2),
      title: 'Matilda',
      author: 'Roald Dahl',
      authorId: 'au-dahl',
      publisherId: 'pub-puffin',
      rating: 4.8,
      tags: ['Story'],
      categoryId: 'cat-kids-stories',
      coverSeed: 0,
      section: Section.children,
      originalLanguage: BookLanguage.english,
      editions: [
        Edition(
          id: 'bk-matilda-pb-en',
          format: BookFormat.paperback,
          language: BookLanguage.english,
          priceBdt: 480,
          stock: 20,
        ),
      ],
    ),
  ];
}
