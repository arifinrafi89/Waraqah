import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/app_notification.dart';
import '../../domain/entities/notification_kind.dart';

part 'app_notification_model.freezed.dart';
part 'app_notification_model.g.dart';

/// JSON shape of an [AppNotification]. The server sends the kind and its
/// params, never the text.
@freezed
abstract class AppNotificationModel with _$AppNotificationModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory AppNotificationModel({
    required String id,
    required NotificationKind kind,
    required DateTime createdAt,
    @Default(false) bool read,
    @Default(<String, String>{}) Map<String, String> params,
    NotificationTargetModel? target,
  }) = _AppNotificationModel;

  factory AppNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$AppNotificationModelFromJson(json);
}

@freezed
abstract class NotificationTargetModel with _$NotificationTargetModel {
  const factory NotificationTargetModel({
    required NotificationTargetKind kind,
    @Default('') String id,
  }) = _NotificationTargetModel;

  factory NotificationTargetModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationTargetModelFromJson(json);
}

extension AppNotificationModelX on AppNotificationModel {
  AppNotification toEntity() => AppNotification(
    id: id,
    kind: kind,
    createdAt: createdAt,
    read: read,
    params: params,
    target: target == null
        ? null
        : NotificationTarget(kind: target!.kind, id: target!.id),
  );
}
