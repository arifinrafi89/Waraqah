import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/app_user.dart';
import '../../domain/entities/user_role.dart';

part 'app_user_model.freezed.dart';
part 'app_user_model.g.dart';

/// JSON shape of an [AppUser], as it comes off the wire and as it is saved
/// on the device between launches.
@freezed
abstract class AppUserModel with _$AppUserModel {
  const factory AppUserModel({
    required String id,
    required String name,
    required String email,
    required String role,

    /// Set by the real backend after sign-in; the fake API sends none.
    String? accessToken,
    String? refreshToken,
    String? expiresAt,
  }) = _AppUserModel;

  factory AppUserModel.fromJson(Map<String, dynamic> json) =>
      _$AppUserModelFromJson(json);
}

extension AppUserModelX on AppUserModel {
  /// An unknown role falls back to the least-privileged one.
  AppUser toEntity() => AppUser(
    id: id,
    name: name,
    email: email,
    role: UserRole.values.asNameMap()[role] ?? UserRole.reader,
  );
}
