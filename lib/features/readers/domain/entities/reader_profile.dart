import 'package:freezed_annotation/freezed_annotation.dart';

part 'reader_profile.freezed.dart';

/// A Reader's public page: area, Bites and followers. The seller page is
/// the same person's used-book side.
@freezed
abstract class ReaderProfile with _$ReaderProfile {
  const factory ReaderProfile({
    required String id,
    required String name,
    @Default('') String area,
    @Default('') String district,
    DateTime? memberSince,
    @Default(0) int followers,
    @Default(0) int following,
    @Default(false) bool isFollowing,
    @Default(false) bool isMe,

    /// `false` when the Reader keeps their profile private.
    @Default(true) bool profileVisible,
    @Default(0) int biteCount,
    @Default(0) int liveListingCount,
  }) = _ReaderProfile;
}

extension ReaderProfileX on ReaderProfile {
  /// Others see only the name of a private profile.
  bool get showsDetails => isMe || profileVisible;
}
