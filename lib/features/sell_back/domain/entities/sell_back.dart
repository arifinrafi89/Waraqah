import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../p2p/domain/entities/p2p_listing.dart';

part 'sell_back.freezed.dart';

/// Where a Sell Back is: a courier picks the book up, staff grade it, and
/// Waraqah pays into the reader's wallet (or sends the book back).
enum SellBackStatus { scheduled, pickedUp, paid, returned }

/// A catalog Book Waraqah will buy back, with its new price.
@freezed
abstract class SellBackBook with _$SellBackBook {
  const factory SellBackBook({
    required String bookId,
    required String title,
    required String author,
    required int newPriceBdt,
    @Default(0) int coverSeed,
  }) = _SellBackBook;
}

/// A reader selling a used book to Waraqah for an instant quote.
@freezed
abstract class SellBack with _$SellBack {
  const factory SellBack({
    required String id,
    required SellBackBook book,
    required BookCondition condition,
    required int quoteBdt,
    required SellBackStatus status,
    required String pickupAddress,
    required DateTime createdAt,
    @Default(0) int flags,

    /// Staff's grade, and what Waraqah paid for it.
    BookCondition? gradedCondition,
    int? paidBdt,

    /// Who's selling, for staff.
    String? readerName,
  }) = _SellBack;
}

/// What the reader sends to get the book picked up.
@freezed
abstract class SellBackDraft with _$SellBackDraft {
  const factory SellBackDraft({
    required String bookId,
    required BookCondition condition,
    required String pickupAddress,
    @Default(0) int flags,
  }) = _SellBackDraft;
}
