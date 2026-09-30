import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_alert.freezed.dart';

/// Back in stock, or below a price the reader picked.
enum AlertKind { backInStock, priceDrop }

/// Something a reader asked to hear about for one Edition. The server marks
/// it [isTriggered] once it happens; notifications (Niloy's work) will then
/// tell the reader, and the My alerts page shows it meanwhile.
@freezed
abstract class BookAlert with _$BookAlert {
  const factory BookAlert({
    required String id,
    required AlertKind kind,
    required String bookId,
    required String editionId,
    required String bookTitle,
    required int currentPriceBdt,
    required bool isTriggered,

    /// Only for price drops: alert at this price or less.
    int? targetPriceBdt,
  }) = _BookAlert;
}

/// What to watch: [targetPriceBdt] is required for a price drop.
class AlertRequest {
  const AlertRequest.backInStock({
    required this.bookId,
    required this.editionId,
  }) : kind = AlertKind.backInStock,
       targetPriceBdt = null;

  const AlertRequest.priceDrop({
    required this.bookId,
    required this.editionId,
    required int this.targetPriceBdt,
  }) : kind = AlertKind.priceDrop;

  final AlertKind kind;
  final String bookId;
  final String editionId;
  final int? targetPriceBdt;
}
