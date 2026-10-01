import '../../../../../core/models/book.dart';
import 'textbook_shelf.dart';

/// Seed HSC textbooks and the Admission and BCS guides.
abstract final class TextbookMoreShelf {
  static final List<Book> books = [
    textbook(
      'bk-hsc-physics-1',
      'HSC Physics 1st Paper',
      'এইচএসসি পদার্থবিজ্ঞান ১ম পত্র',
      classes: [11, 12],
      exams: [Exam.hsc],
      subjectId: 'sub-physics',
      isbn: '9789840004072',
    ),
    textbook(
      'bk-hsc-higher-math',
      'HSC Higher Mathematics',
      'এইচএসসি উচ্চতর গণিত',
      classes: [11, 12],
      exams: [Exam.hsc],
      subjectId: 'sub-higher-math',
      isbn: '9789840004089',
    ),
    textbook(
      'bk-hsc-ict',
      'HSC ICT',
      'এইচএসসি তথ্য ও যোগাযোগ প্রযুক্তি',
      classes: [11, 12],
      exams: [Exam.hsc],
      subjectId: 'sub-ict',
      isbn: '9789840004096',
    ),
    textbook(
      'bk-admission-physics',
      'Admission Physics Question Bank',
      'ভর্তি পদার্থবিজ্ঞান প্রশ্নব্যাংক',
      exams: [Exam.admission],
      subjectId: 'sub-physics',
      isbn: '9789840004102',
    ),
    textbook(
      'bk-bcs-gk',
      'BCS General Knowledge Digest',
      'বিসিএস সাধারণ জ্ঞান ডাইজেস্ট',
      exams: [Exam.bcs],
      subjectId: 'sub-gk',
      isbn: '9789840004119',
    ),
  ];
}
