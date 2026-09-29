import '../../l10n/app_localizations.dart';
import '../models/book.dart';

extension StockLabel on AppL10n {
  String stockStatus(CardStockStatus status) => switch (status) {
    CardStockStatus.inStock => stockInStock,
    CardStockStatus.preorder => stockPreorder,
    CardStockStatus.outOfStock => stockOutOfStock,
  };
}
