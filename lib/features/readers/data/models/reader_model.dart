import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/reader_profile.dart';

part 'reader_model.freezed.dart';
part 'reader_model.g.dart';

/// JSON shape of a [ReaderProfile]. For a private profile the server sends
/// only the name and follow state.
@freezed
abstract class ReaderModel with _$ReaderModel {
  const factory ReaderModel({
    required String id,
    required String name,
    @Default('') String area,
    @Default('') String district,
    DateTime? memberSince,
    @Default(0) int followers,
    @Default(0) int following,
    @Default(false) bool isFollowing,
    @Default(false) bool isMe,
    @Default(true) bool profileVisible,
    @Default(0) int biteCount,
    @Default(0) int liveListingCount,
  }) = _ReaderModel;

  factory ReaderModel.fromJson(Map<String, dynamic> json) =>
      _$ReaderModelFromJson(json);
}

extension ReaderModelX on ReaderModel {
  ReaderProfile toEntity() => ReaderProfile(
    id: id,
    name: name,
    area: area,
    district: district,
    memberSince: memberSince,
    followers: followers,
    following: following,
    isFollowing: isFollowing,
    isMe: isMe,
    profileVisible: profileVisible,
    biteCount: biteCount,
    liveListingCount: liveListingCount,
  );
}
