// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminDashboardModel _$AdminDashboardModelFromJson(Map<String, dynamic> json) =>
    _AdminDashboardModel(
      ordersToday: (json['ordersToday'] as num).toInt(),
      salesTodayBdt: (json['salesTodayBdt'] as num).toInt(),
      ordersToShip: (json['ordersToShip'] as num).toInt(),
      listingsWaiting: (json['listingsWaiting'] as num).toInt(),
      openReports: (json['openReports'] as num).toInt(),
      openDisputes: (json['openDisputes'] as num).toInt(),
      topSearches: (json['topSearches'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      topRequested: (json['topRequested'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$AdminDashboardModelToJson(
  _AdminDashboardModel instance,
) => <String, dynamic>{
  'ordersToday': instance.ordersToday,
  'salesTodayBdt': instance.salesTodayBdt,
  'ordersToShip': instance.ordersToShip,
  'listingsWaiting': instance.listingsWaiting,
  'openReports': instance.openReports,
  'openDisputes': instance.openDisputes,
  'topSearches': instance.topSearches,
  'topRequested': instance.topRequested,
};
