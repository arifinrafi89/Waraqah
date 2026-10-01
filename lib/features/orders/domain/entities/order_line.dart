import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/edition.dart';

part 'order_line.freezed.dart';

/// One book in an order, as it was when the order was placed.
@freezed
abstract class OrderLine with _$OrderLine {
  const factory OrderLine({
    required String bookId,
    required String title,
    required String author,
    required int quantity,
    required int unitPriceBdt,
    BookFormat? format,
    BookLanguage? language,
    @Default(0) int coverSeed,
  }) = _OrderLine;
}
