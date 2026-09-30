import '../../../../core/models/edition.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/delivery_area.dart';
import '../../domain/entities/delivery_estimate.dart';

/// Reader-facing words for editions and delivery, in the current language.
extension EditionLabels on AppL10n {
  String formatLabel(BookFormat format) => switch (format) {
    BookFormat.paperback => bookFormatPaperback,
    BookFormat.hardcover => bookFormatHardcover,
    BookFormat.ebook => bookFormatEbook,
  };

  String languageLabel(BookLanguage language) => switch (language) {
    BookLanguage.bangla => bookLanguageBangla,
    BookLanguage.english => bookLanguageEnglish,
    BookLanguage.arabic => bookLanguageArabic,
  };

  /// "Only 2 left" once stock is low; eBooks never run out.
  String editionStock(Edition edition) {
    if (edition.format == BookFormat.ebook) return bookInstantDownload;
    if (edition.stock > 5) return stockInStock;
    if (edition.stock > 0) return bookStockOnlyLeft(edition.stock);
    return edition.isPreorder ? stockPreorder : stockOutOfStock;
  }

  String areaLabel(DeliveryArea area) => switch (area) {
    DeliveryArea.insideDhaka => bookAreaInsideDhaka,
    DeliveryArea.outsideDhaka => bookAreaOutsideDhaka,
  };

  String deliveryLabel(DeliveryEstimate estimate) => switch (estimate) {
    InstantDownload() => bookInstantDownload,
    ShipsOnRelease() => bookShipsOnRelease,
    Unavailable() => bookNotAvailable,
    ShipsInDays(:final minDays, :final maxDays) => bookArrivesInDays(
      minDays,
      maxDays,
    ),
  };
}
