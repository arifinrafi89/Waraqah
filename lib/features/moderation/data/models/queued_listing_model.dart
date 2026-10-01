import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../domain/entities/queued_listing.dart';

part 'queued_listing_model.freezed.dart';
part 'queued_listing_model.g.dart';

/// JSON shape of a [QueuedListing].
@freezed
abstract class QueuedListingModel with _$QueuedListingModel {
  const factory QueuedListingModel({
    required String id,
    required String title,
    required String sellerId,
    required String sellerName,
    required int priceBdt,
    required BookCondition condition,
    @Default(<String>[]) List<String> flags,
    @Default(<String>[]) List<String> photos,
    @Default(0) int coverSeed,
    @Default(0) int sellerStrikes,
    int? newPriceBdt,
    String? note,
  }) = _QueuedListingModel;

  factory QueuedListingModel.fromJson(Map<String, dynamic> json) =>
      _$QueuedListingModelFromJson(json);
}

extension QueuedListingModelX on QueuedListingModel {
  QueuedListing toEntity() => QueuedListing(
    id: id,
    title: title,
    sellerId: sellerId,
    sellerName: sellerName,
    priceBdt: priceBdt,
    condition: condition,
    flags: flags,
    photos: photos,
    coverSeed: coverSeed,
    sellerStrikes: sellerStrikes,
    newPriceBdt: newPriceBdt,
    note: note,
  );
}
