import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../checkout/domain/entities/payment_method.dart';

part 'handled_sale.freezed.dart';

/// Where a Waraqah-handled sale is. Waraqah holds the buyer's money from
/// [paid] until the buyer confirms ([completed]) or a moderator settles a
/// dispute ([refunded] to the buyer, [released] to the seller).
enum SaleStatus {
  paid,
  sent,
  completed,
  disputed,
  refunded,
  released,
  cancelled,
}

/// The signed-in reader's side of the sale.
enum SaleRole { buyer, seller }

/// Why a buyer says the book isn't as described.
enum DisputeReason {
  notAsDescribed,
  damaged,
  photocopy,
  wrongBook,
  notReceived,
}

/// A used book sold through Waraqah: the buyer pays in the app, and the
/// money waits with Waraqah until the book arrives as described.
@freezed
abstract class HandledSale with _$HandledSale {
  const factory HandledSale({
    required String id,
    required String listingId,
    required String title,
    required SaleRole role,
    required String otherName,
    required int priceBdt,
    required int deliveryBdt,
    required int feeBdt,
    required SaleStatus status,
    required PaymentMethod method,
    required DateTime createdAt,
    @Default(0) int coverSeed,
    DisputeReason? disputeReason,
    String? disputeNote,
    @Default(<Uint8List>[]) List<Uint8List> disputePhotos,
  }) = _HandledSale;
}

extension HandledSaleX on HandledSale {
  bool get isBuying => role == SaleRole.buyer;

  int get buyerPaysBdt => priceBdt + deliveryBdt;

  int get sellerGetsBdt => priceBdt - feeBdt;

  /// Waraqah still holds the money.
  bool get isHeld =>
      status == SaleStatus.paid ||
      status == SaleStatus.sent ||
      status == SaleStatus.disputed;
}

/// What the buyer sends when the book isn't as described.
@freezed
abstract class DisputeDraft with _$DisputeDraft {
  const factory DisputeDraft({
    required String saleId,
    required DisputeReason reason,
    String? note,
    @Default(<Uint8List>[]) List<Uint8List> photos,
  }) = _DisputeDraft;
}
