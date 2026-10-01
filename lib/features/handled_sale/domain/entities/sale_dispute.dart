import 'package:freezed_annotation/freezed_annotation.dart';

import 'handled_sale.dart';

part 'sale_dispute.freezed.dart';

/// A disputed sale, as a moderator sees it: both sides, the money held,
/// and the buyer's reason and photos.
@freezed
abstract class SaleDispute with _$SaleDispute {
  const factory SaleDispute({
    required HandledSale sale,
    required String buyerName,
    required String sellerName,
  }) = _SaleDispute;
}
