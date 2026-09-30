import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../checkout/domain/entities/payment_method.dart';

part 'donation.freezed.dart';

/// What a donor asks for: [quantity] copies of one book a recipient needs,
/// paid now (not on delivery, since the recipient doesn't pay), with an
/// optional note that goes in the parcel.
@freezed
abstract class DonationRequest with _$DonationRequest {
  const factory DonationRequest({
    required String recipientId,
    required String bookId,
    required int quantity,
    required PaymentMethod payment,
    @Default('') String note,
  }) = _DonationRequest;
}

/// A donation that went through: it's an order like any other, delivered
/// free to the recipient.
@freezed
abstract class Donation with _$Donation {
  const factory Donation({
    /// "WQ-100231", tracked in My orders.
    required String orderNumber,
    required int totalBdt,
  }) = _Donation;
}
