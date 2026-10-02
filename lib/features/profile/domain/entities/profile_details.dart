import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_details.freezed.dart';

/// What the Reader shows about themselves: name, phone and photo. An empty
/// [name] means it was never saved; the session's name stands in.
@freezed
abstract class ProfileDetails with _$ProfileDetails {
  const factory ProfileDetails({
    @Default('') String name,
    @Default('') String phone,
    Uint8List? photo,
  }) = _ProfileDetails;
}
