import '../../../../core/models/edition.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/presentation/widgets/used_labels.dart';
import '../../domain/entities/cart_line.dart';

/// Reader-facing words for cart lines, in the current language.
extension CartLabels on AppL10n {
  /// "Paperback · English", or "Certified Used · Very good" for a used
  /// copy; empty when the line has no details.
  String cartLineEdition(CartLine line) => [
    if (line.kind == CartItemKind.certifiedUsed) cartCertifiedUsed,
    if (line.kind == CartItemKind.listing) cartFromReader,
    if (line.kind == CartItemKind.bundle) cartBundle,
    if (line.condition case final condition?) conditionLabel(condition),
    if (line.format case final format?)
      switch (format) {
        BookFormat.paperback => bookFormatPaperback,
        BookFormat.hardcover => bookFormatHardcover,
        BookFormat.ebook => bookFormatEbook,
      },
    if (line.language case final language?)
      switch (language) {
        BookLanguage.bangla => bookLanguageBangla,
        BookLanguage.english => bookLanguageEnglish,
        BookLanguage.arabic => bookLanguageArabic,
      },
  ].join(' · ');
}
