import '../../../../core/models/book.dart';
import '../../../../l10n/app_localizations.dart';

/// Reader-facing names for Exams, in the current language.
extension ExamLabels on AppL10n {
  String examLabel(Exam exam) => switch (exam) {
    Exam.ssc => sectionExamSsc,
    Exam.hsc => sectionExamHsc,
    Exam.admission => sectionExamAdmission,
    Exam.bcs => sectionExamBcs,
  };
}
