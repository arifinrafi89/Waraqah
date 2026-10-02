// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppNotificationModel _$AppNotificationModelFromJson(
  Map<String, dynamic> json,
) => _AppNotificationModel(
  id: json['id'] as String,
  kind: $enumDecode(_$NotificationKindEnumMap, json['kind']),
  createdAt: DateTime.parse(json['createdAt'] as String),
  read: json['read'] as bool? ?? false,
  params:
      (json['params'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ) ??
      const <String, String>{},
  target: json['target'] == null
      ? null
      : NotificationTargetModel.fromJson(
          json['target'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$AppNotificationModelToJson(
  _AppNotificationModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'kind': _$NotificationKindEnumMap[instance.kind]!,
  'createdAt': instance.createdAt.toIso8601String(),
  'read': instance.read,
  'params': instance.params,
  'target': instance.target?.toJson(),
};

const _$NotificationKindEnumMap = {
  NotificationKind.orderStatus: 'orderStatus',
  NotificationKind.returnDecided: 'returnDecided',
  NotificationKind.listingDecided: 'listingDecided',
  NotificationKind.moderationWarning: 'moderationWarning',
  NotificationKind.banned: 'banned',
  NotificationKind.saleSent: 'saleSent',
  NotificationKind.saleCompleted: 'saleCompleted',
  NotificationKind.saleSettled: 'saleSettled',
  NotificationKind.sellBackPaid: 'sellBackPaid',
  NotificationKind.sellBackReturned: 'sellBackReturned',
  NotificationKind.alertTriggered: 'alertTriggered',
  NotificationKind.bookWanted: 'bookWanted',
  NotificationKind.newFollower: 'newFollower',
  NotificationKind.biteComment: 'biteComment',
  NotificationKind.commentReply: 'commentReply',
};

_NotificationTargetModel _$NotificationTargetModelFromJson(
  Map<String, dynamic> json,
) => _NotificationTargetModel(
  kind: $enumDecode(_$NotificationTargetKindEnumMap, json['kind']),
  id: json['id'] as String? ?? '',
);

Map<String, dynamic> _$NotificationTargetModelToJson(
  _NotificationTargetModel instance,
) => <String, dynamic>{
  'kind': _$NotificationTargetKindEnumMap[instance.kind]!,
  'id': instance.id,
};

const _$NotificationTargetKindEnumMap = {
  NotificationTargetKind.order: 'order',
  NotificationTargetKind.listing: 'listing',
  NotificationTargetKind.myListings: 'myListings',
  NotificationTargetKind.sale: 'sale',
  NotificationTargetKind.sellBack: 'sellBack',
  NotificationTargetKind.book: 'book',
  NotificationTargetKind.bite: 'bite',
  NotificationTargetKind.reader: 'reader',
};
