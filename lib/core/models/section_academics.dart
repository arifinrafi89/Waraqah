import 'book.dart';

/// Which Class, Exam and Subject choices a [Section] offers, on its page and
/// on Staff's Book form.
extension SectionAcademics on Section {
  /// School years a Book here can be for: 6–12 in School & College only.
  List<int> get classLevels =>
      this == Section.schoolCollege ? const [6, 7, 8, 9, 10, 11, 12] : const [];

  List<Exam> get allowedExams => switch (this) {
    Section.schoolCollege => const [Exam.ssc, Exam.hsc],
    Section.admissionJobPrep => const [Exam.admission, Exam.bcs],
    _ => const [],
  };

  bool get hasSubjects =>
      this == Section.academic ||
      this == Section.schoolCollege ||
      this == Section.admissionJobPrep;
}
