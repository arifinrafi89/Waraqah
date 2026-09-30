import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/book.dart';
import '../../domain/entities/donation.dart';
import '../../domain/entities/recipient.dart';

part 'recipient_model.freezed.dart';
part 'recipient_model.g.dart';

@freezed
abstract class RecipientModel with _$RecipientModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory RecipientModel({
    required String id,
    required String name,
    required RecipientKind kind,
    required String district,
    required String area,
    required String story,
    required List<RecipientNeedModel> needs,
  }) = _RecipientModel;

  factory RecipientModel.fromJson(Map<String, dynamic> json) =>
      _$RecipientModelFromJson(json);
}

@freezed
abstract class RecipientNeedModel with _$RecipientNeedModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory RecipientNeedModel({
    required Book book,
    required String editionId,
    required int priceBdt,
    required int wanted,
    required int received,
  }) = _RecipientNeedModel;

  factory RecipientNeedModel.fromJson(Map<String, dynamic> json) =>
      _$RecipientNeedModelFromJson(json);
}

@freezed
abstract class DonationModel with _$DonationModel {
  const factory DonationModel({
    required String orderNumber,
    required int totalBdt,
  }) = _DonationModel;

  factory DonationModel.fromJson(Map<String, dynamic> json) =>
      _$DonationModelFromJson(json);
}

extension RecipientModelX on RecipientModel {
  Recipient toEntity() => Recipient(
    id: id,
    name: name,
    kind: kind,
    district: district,
    area: area,
    story: story,
    needs: [
      for (final need in needs)
        RecipientNeed(
          book: need.book,
          editionId: need.editionId,
          priceBdt: need.priceBdt,
          wanted: need.wanted,
          received: need.received,
        ),
    ],
  );
}

extension DonationModelX on DonationModel {
  Donation toEntity() => Donation(orderNumber: orderNumber, totalBdt: totalBdt);
}
