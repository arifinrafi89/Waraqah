import '../../../../core/models/edition.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/cart_line.dart';

/// Reader-facing words for cart lines, in the current language.
extension CartLabels on AppL10n {
  /// "Paperback · English"; empty when the line has no edition details.
  String cartLineEdition(CartLine line) => [
    if (line.format case final format?) switch (format) {
      BookFormat.paperback => bookFormatPaperback,
      BookFormat.hardcover => bookFormatHardcover,
      BookFormat.ebook => bookFormatEbook,
    },
    if (line.language case final language?) switch (language) {
      BookLanguage.bangla => bookLanguageBangla,
      BookLanguage.english => bookLanguageEnglish,
      BookLanguage.arabic => bookLanguageArabic,
    },
  ].join(' · ');
}
