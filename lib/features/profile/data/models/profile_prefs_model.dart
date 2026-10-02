import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/profile_prefs.dart';

part 'profile_prefs_model.freezed.dart';
part 'profile_prefs_model.g.dart';

/// JSON shape of [ProfilePrefs]; [muted] holds group names.
@freezed
abstract class ProfilePrefsModel with _$ProfilePrefsModel {
  const factory ProfilePrefsModel({
    @Default(<String>[]) List<String> muted,
    @Default(true) bool profileVisible,
    @Default(true) bool activityVisible,
  }) = _ProfilePrefsModel;

  factory ProfilePrefsModel.fromJson(Map<String, dynamic> json) =>
      _$ProfilePrefsModelFromJson(json);

  factory ProfilePrefsModel.fromEntity(ProfilePrefs prefs) => ProfilePrefsModel(
    muted: [for (final group in prefs.muted) group.name],
    profileVisible: prefs.profileVisible,
    activityVisible: prefs.activityVisible,
  );
}

extension ProfilePrefsModelX on ProfilePrefsModel {
  /// Unknown group names are dropped.
  ProfilePrefs toEntity() => ProfilePrefs(
    muted: {
      for (final name in muted) ?NotificationGroup.values.asNameMap()[name],
    },
    profileVisible: profileVisible,
    activityVisible: activityVisible,
  );

  bool mutes(NotificationGroup group) => muted.contains(group.name);
}
