import '../../../../core/models/edition.dart';

/// A printed Edition running low, for Staff's Low stock list.
typedef LowStockEdition = ({
  String bookId,
  String title,
  int coverSeed,
  String editionId,
  BookFormat format,
  BookLanguage language,
  int stock,
});
