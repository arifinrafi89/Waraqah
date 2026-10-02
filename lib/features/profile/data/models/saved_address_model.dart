import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/saved_address.dart';

part 'saved_address_model.freezed.dart';
part 'saved_address_model.g.dart';

/// JSON shape of a [SavedAddress].
@freezed
abstract class SavedAddressModel with _$SavedAddressModel {
  const factory SavedAddressModel({
    @Default('') String id,
    required String label,
    required String recipient,
    required String phone,
    required String line,
    required String upazila,
    required String district,
    required String division,
    @Default(false) bool isDefault,
  }) = _SavedAddressModel;

  factory SavedAddressModel.fromJson(Map<String, dynamic> json) =>
      _$SavedAddressModelFromJson(json);

  factory SavedAddressModel.fromEntity(SavedAddress a) => SavedAddressModel(
    id: a.id,
    label: a.label,
    recipient: a.recipient,
    phone: a.phone,
    line: a.line,
    upazila: a.upazila,
    district: a.district,
    division: a.division,
    isDefault: a.isDefault,
  );
}

extension SavedAddressModelX on SavedAddressModel {
  SavedAddress toEntity() => SavedAddress(
    id: id,
    label: label,
    recipient: recipient,
    phone: phone,
    line: line,
    upazila: upazila,
    district: district,
    division: division,
    isDefault: isDefault,
  );
}
