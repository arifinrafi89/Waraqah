import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../p2p/domain/entities/p2p_listing.dart';

part 'used_options.freezed.dart';

/// A Certified Used copy: a used book Waraqah bought back, checked and
/// resells itself, so it goes in the cart like a new one.
@freezed
abstract class UsedCopy with _$UsedCopy {
  const factory UsedCopy({
    required String id,
    required int priceBdt,
    required BookCondition condition,
  }) = _UsedCopy;
}

/// Waraqah's own used offer for a book, and what a used copy resells for.
///
/// Readers' copies aren't here: they come from the P2P marketplace
/// (`listingsForBookProvider`) and are bought by making an offer to the
/// seller, not through the cart. Certified Used and the resale value are
/// Arifin's pieces too; until they land, the book page fakes them here
/// with the same fields.
@freezed
abstract class UsedOptions with _$UsedOptions {
  const factory UsedOptions({
    UsedCopy? certifiedUsed,

    /// What a used copy usually sells back for, if we know.
    int? resaleValueBdt,
  }) = _UsedOptions;
}
