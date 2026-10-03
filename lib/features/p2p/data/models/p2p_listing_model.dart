import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/book.dart';

import '../../domain/entities/p2p_listing.dart';

part 'p2p_listing_model.freezed.dart';
part 'p2p_listing_model.g.dart';

/// JSON shape of a [P2pListing], as every listing endpoint sends it.
@freezed
abstract class P2pListingModel with _$P2pListingModel {
  const factory P2pListingModel({
    required String id,
    required String title,
    required String sellerId,
    required String sellerName,
    required int priceBdt,
    @Default(BookCondition.good) BookCondition condition,
    @Default(<String>[]) List<String> flags,
    @Default(<String>[]) List<String> photos,
    @Default(false) bool isNegotiable,
    @Default(HandoverMethod.meetInPerson) HandoverMethod handover,
    @Default(P2pListingStatus.live) P2pListingStatus status,
    @Default(false) bool isMine,
    @Default(false) bool isMyDeal,
    String? rejectionReason,
    String? bookId,
    @Default(0) int coverSeed,
    String? district,
    String? area,

    /// The catalog Category, and its Section, the server files it under.
    String? categoryId,
    Section? section,
    int? newPriceBdt,
    String? note,
  }) = _P2pListingModel;

  factory P2pListingModel.fromJson(Map<String, dynamic> json) =>
      _$P2pListingModelFromJson(json);
}

extension P2pListingModelX on P2pListingModel {
  P2pListing toEntity() => P2pListing(
    id: id,
    title: title,
    sellerId: sellerId,
    sellerName: sellerName,
    priceBdt: priceBdt,
    condition: condition,
    flags: flags,
    photos: photos,
    isNegotiable: isNegotiable,
    handover: handover,
    status: status,
    isMine: isMine,
    isMyDeal: isMyDeal,
    rejectionReason: rejectionReason,
    bookId: bookId,
    coverSeed: coverSeed,
    district: district,
    area: area,
    categoryId: categoryId,
    section: section,
    newPriceBdt: newPriceBdt,
    note: note,
  );
}
