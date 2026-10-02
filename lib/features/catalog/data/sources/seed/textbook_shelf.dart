import '../../../../../core/models/book.dart';
import '../../../../../core/models/edition.dart';

/// Seed textbooks and guides for School & College, by Class, Exam and
/// Subject. The rest are in `textbook_more_shelf.dart`.
abstract final class TextbookShelf {
  static final List<Book> books = [
    textbook(
      'bk-class6-english',
      'Class 6 English For Today',
      'ষষ্ঠ শ্রেণি ইংলিশ ফর টুডে',
      classes: [6],
      subjectId: 'sub-english',
      isbn: '9789840004010',
      language: BookLanguage.english,
    ),
    textbook(
      'bk-class7-science',
      'Class 7 General Science',
      'সপ্তম শ্রেণি সাধারণ বিজ্ঞান',
      classes: [7],
      subjectId: 'sub-science',
      isbn: '9789840004027',
    ),
    textbook(
      'bk-class8-math',
      'Class 8 Mathematics',
      'অষ্টম শ্রেণি গণিত',
      classes: [8],
      subjectId: 'sub-math',
      isbn: '9789840004034',
    ),
    textbook(
      'bk-ssc-physics',
      'SSC Physics',
      'এসএসসি পদার্থবিজ্ঞান',
      classes: [9, 10],
      exams: [Exam.ssc],
      subjectId: 'sub-physics',
      isbn: '9789840004041',
    ),
    textbook(
      'bk-ssc-chemistry',
      'SSC Chemistry',
      'এসএসসি রসায়ন',
      classes: [9, 10],
      exams: [Exam.ssc],
      subjectId: 'sub-chemistry',
      isbn: '9789840004058',
    ),
    textbook(
      'bk-ssc-biology',
      'SSC Biology',
      'এসএসসি জীববিজ্ঞান',
      classes: [9, 10],
      exams: [Exam.ssc],
      subjectId: 'sub-biology',
      isbn: '9789840004065',
    ),
  ];
}

/// A Bangla-first textbook or guide. School & College when it has
/// [classes]; otherwise Admission & Job Prep (BCS or University Admission).
Book textbook(
  String id,
  String title,
  String titleBn, {
  List<int> classes = const [],
  List<Exam> exams = const [],
  required String subjectId,
  required String isbn,
  BookLanguage language = BookLanguage.bangla,
}) {
  final school = classes.isNotEmpty;
  return Book(
    id: id,
    addedAt: DateTime(2026, 6, 12),
    title: title,
    titleBn: titleBn,
    author: school ? 'NCTB' : 'Waraqah Editorial Board',
    authorId: school ? 'au-nctb' : 'au-editorial',
    publisherId: school ? 'pub-nctb' : 'pub-waraqah-press',
    rating: 4.2,
    tags: [if (school) 'Textbook' else 'Guide'],
    categoryId: school
        ? 'cat-textbooks'
        : exams.contains(Exam.bcs)
        ? 'cat-bcs-prep'
        : 'cat-admission-test',
    coverSeed: id.length % 6,
    section: school ? Section.schoolCollege : Section.admissionJobPrep,
    originalLanguage: language,
    classes: classes,
    exams: exams,
    subjectId: subjectId,
    editions: [
      Edition(
        id: '$id-pb-${language == BookLanguage.bangla ? 'bn' : 'en'}',
        format: BookFormat.paperback,
        language: language,
        isbn: isbn,
        priceBdt: school ? 420 + 20 * classes.first : 520,
        stock: 40,
      ),
    ],
  );
}
