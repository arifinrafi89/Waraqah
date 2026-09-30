import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../domain/entities/used_options.dart';

part 'used_options_model.freezed.dart';
part 'used_options_model.g.dart';

@freezed
abstract class UsedCopyModel with _$UsedCopyModel {
  const factory UsedCopyModel({
    required String id,
    required int priceBdt,
    required BookCondition condition,
    String? sellerName,
    String? area,
  }) = _UsedCopyModel;

  factory UsedCopyModel.fromJson(Map<String, dynamic> json) =>
      _$UsedCopyModelFromJson(json);
}

@freezed
abstract class UsedOptionsModel with _$UsedOptionsModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory UsedOptionsModel({
    UsedCopyModel? certifiedUsed,
    @Default(<UsedCopyModel>[]) List<UsedCopyModel> listings,
    int? resaleValueBdt,
  }) = _UsedOptionsModel;

  factory UsedOptionsModel.fromJson(Map<String, dynamic> json) =>
      _$UsedOptionsModelFromJson(json);
}

extension UsedCopyModelX on UsedCopyModel {
  UsedCopy toEntity() => UsedCopy(
    id: id,
    priceBdt: priceBdt,
    condition: condition,
    sellerName: sellerName,
    area: area,
  );
}

extension UsedOptionsModelX on UsedOptionsModel {
  UsedOptions toEntity() => UsedOptions(
    certifiedUsed: certifiedUsed?.toEntity(),
    listings: [for (final copy in listings) copy.toEntity()],
    resaleValueBdt: resaleValueBdt,
  );
}
