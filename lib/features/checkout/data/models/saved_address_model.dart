import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/saved_address.dart';

part 'saved_address_model.freezed.dart';
part 'saved_address_model.g.dart';

@freezed
abstract class SavedAddressModel with _$SavedAddressModel {
  const factory SavedAddressModel({
    required String id,
    required String label,
    required String recipient,
    required String phone,
    required String line,
    required String upazila,
    required String district,
    required String division,
  }) = _SavedAddressModel;

  factory SavedAddressModel.fromJson(Map<String, dynamic> json) =>
      _$SavedAddressModelFromJson(json);
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
  );
}
