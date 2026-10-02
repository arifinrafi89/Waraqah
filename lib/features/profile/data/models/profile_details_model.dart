import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/profile_details.dart';

part 'profile_details_model.freezed.dart';
part 'profile_details_model.g.dart';

/// JSON shape of [ProfileDetails]. [photo] is a base64 JPEG.
@freezed
abstract class ProfileDetailsModel with _$ProfileDetailsModel {
  const factory ProfileDetailsModel({
    @Default('') String name,
    @Default('') String phone,
    String? photo,
  }) = _ProfileDetailsModel;

  factory ProfileDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileDetailsModelFromJson(json);

  factory ProfileDetailsModel.fromEntity(ProfileDetails details) =>
      ProfileDetailsModel(
        name: details.name,
        phone: details.phone,
        photo: details.photo == null ? null : base64Encode(details.photo!),
      );
}

extension ProfileDetailsModelX on ProfileDetailsModel {
  ProfileDetails toEntity() => ProfileDetails(
    name: name,
    phone: phone,
    photo: photo == null ? null : base64Decode(photo!),
  );
}
