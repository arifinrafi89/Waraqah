// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'handled_sale_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HandledSaleModel _$HandledSaleModelFromJson(Map<String, dynamic> json) =>
    _HandledSaleModel(
      id: json['id'] as String,
      listingId: json['listingId'] as String,
      title: json['title'] as String,
      role: $enumDecode(_$SaleRoleEnumMap, json['role']),
      otherName: json['otherName'] as String,
      priceBdt: (json['priceBdt'] as num).toInt(),
      deliveryBdt: (json['deliveryBdt'] as num).toInt(),
      feeBdt: (json['feeBdt'] as num).toInt(),
      status: $enumDecode(_$SaleStatusEnumMap, json['status']),
      method: $enumDecode(_$PaymentMethodEnumMap, json['method']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      coverSeed: (json['coverSeed'] as num?)?.toInt() ?? 0,
      disputeReason: $enumDecodeNullable(
        _$DisputeReasonEnumMap,
        json['disputeReason'],
      ),
      disputeNote: json['disputeNote'] as String?,
      disputePhotos:
          (json['disputePhotos'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$HandledSaleModelToJson(_HandledSaleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'listingId': instance.listingId,
      'title': instance.title,
      'role': _$SaleRoleEnumMap[instance.role]!,
      'otherName': instance.otherName,
      'priceBdt': instance.priceBdt,
      'deliveryBdt': instance.deliveryBdt,
      'feeBdt': instance.feeBdt,
      'status': _$SaleStatusEnumMap[instance.status]!,
      'method': _$PaymentMethodEnumMap[instance.method]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'coverSeed': instance.coverSeed,
      'disputeReason': _$DisputeReasonEnumMap[instance.disputeReason],
      'disputeNote': instance.disputeNote,
      'disputePhotos': instance.disputePhotos,
    };

const _$SaleRoleEnumMap = {SaleRole.buyer: 'buyer', SaleRole.seller: 'seller'};

const _$SaleStatusEnumMap = {
  SaleStatus.paid: 'paid',
  SaleStatus.sent: 'sent',
  SaleStatus.completed: 'completed',
  SaleStatus.disputed: 'disputed',
  SaleStatus.refunded: 'refunded',
  SaleStatus.released: 'released',
  SaleStatus.cancelled: 'cancelled',
};

const _$PaymentMethodEnumMap = {
  PaymentMethod.bkash: 'bkash',
  PaymentMethod.nagad: 'nagad',
  PaymentMethod.cashOnDelivery: 'cashOnDelivery',
  PaymentMethod.card: 'card',
};

const _$DisputeReasonEnumMap = {
  DisputeReason.notAsDescribed: 'notAsDescribed',
  DisputeReason.damaged: 'damaged',
  DisputeReason.photocopy: 'photocopy',
  DisputeReason.wrongBook: 'wrongBook',
  DisputeReason.notReceived: 'notReceived',
};
