import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/booklist.dart';

extension BooklistKindLabel on BooklistKind {
  String label(AppL10n l10n) => switch (this) {
    BooklistKind.classList => l10n.booklistKindClassList,
    BooklistKind.examPrep => l10n.booklistKindExamPrep,
    BooklistKind.bookClub => l10n.booklistKindBookClub,
    BooklistKind.personal => l10n.booklistKindPersonal,
  };
}
