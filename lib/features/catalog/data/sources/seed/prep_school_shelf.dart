import '../../../../../core/models/book.dart';
import '../../../../../core/models/edition.dart';

/// Seed data for Admission & Job Prep and School & College.
abstract final class PrepSchoolShelf {
  static final List<Book> books = [
    Book(
      id: 'bk-bcs-guide',
      title: 'BCS Preliminary Guide',
      author: 'Waraqah Editorial Board',
      authorId: 'au-editorial',
      publisherId: 'pub-waraqah-press',
      rating: 4.1,
      tags: ['BCS'],
      categoryId: 'cat-bcs-prep',
      coverSeed: 1,
      section: Section.admissionJobPrep,
      originalLanguage: BookLanguage.bangla,
      editions: [
        Edition(
          id: 'bk-bcs-guide-pb-bn',
          format: BookFormat.paperback,
          language: BookLanguage.bangla,
          priceBdt: 550,
          stock: 25,
        ),
      ],
    ),
    Book(
      id: 'bk-admission-guide',
      title: 'University Admission Test Guide',
      author: 'Waraqah Editorial Board',
      authorId: 'au-editorial',
      publisherId: 'pub-waraqah-press',
      rating: 4.0,
      tags: ['Admission'],
      categoryId: 'cat-admission-test',
      coverSeed: 3,
      section: Section.admissionJobPrep,
      originalLanguage: BookLanguage.bangla,
      editions: [
        Edition(
          id: 'bk-admission-guide-pb-bn',
          format: BookFormat.paperback,
          language: BookLanguage.bangla,
          priceBdt: 480,
          stock: 30,
        ),
      ],
    ),
    Book(
      id: 'bk-general-math',
      title: 'General Mathematics, Class 9–10',
      shortTitle: 'General Math',
      author: 'NCTB',
      authorId: 'au-nctb',
      publisherId: 'pub-nctb',
      rating: 4.3,
      tags: ['Textbook'],
      categoryId: 'cat-textbooks',
      coverSeed: 2,
      section: Section.schoolCollege,
      originalLanguage: BookLanguage.bangla,
      editions: [
        Edition(
          id: 'bk-general-math-pb-bn',
          format: BookFormat.paperback,
          language: BookLanguage.bangla,
          priceBdt: 460,
          stock: 40,
        ),
      ],
    ),
    Book(
      id: 'bk-english-grammar',
      title: 'High School English Grammar and Composition',
      shortTitle: 'English Grammar',
      author: 'P. C. Wren & H. Martin',
      authorId: 'au-wren-martin',
      publisherId: 'pub-s-chand',
      rating: 4.6,
      tags: ['Grammar'],
      categoryId: 'cat-school-guides',
      coverSeed: 0,
      section: Section.schoolCollege,
      originalLanguage: BookLanguage.english,
      editions: [
        Edition(
          id: 'bk-english-grammar-pb-en',
          format: BookFormat.paperback,
          language: BookLanguage.english,
          priceBdt: 490,
          stock: 22,
        ),
      ],
    ),
  ];
}
