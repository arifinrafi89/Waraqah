import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/admin_dashboard.dart';

part 'admin_dashboard_model.freezed.dart';
part 'admin_dashboard_model.g.dart';

/// JSON shape of [AdminDashboard].
@freezed
abstract class AdminDashboardModel with _$AdminDashboardModel {
  const factory AdminDashboardModel({
    required int ordersToday,
    required int salesTodayBdt,
    required int ordersToShip,
    required int listingsWaiting,
    required int openReports,
    required int openDisputes,
    required List<Map<String, dynamic>> topSearches,
    required List<Map<String, dynamic>> topRequested,
  }) = _AdminDashboardModel;

  factory AdminDashboardModel.fromJson(Map<String, dynamic> json) =>
      _$AdminDashboardModelFromJson(json);
}

extension AdminDashboardModelX on AdminDashboardModel {
  AdminDashboard toEntity() => AdminDashboard(
    ordersToday: ordersToday,
    salesTodayBdt: salesTodayBdt,
    ordersToShip: ordersToShip,
    listingsWaiting: listingsWaiting,
    openReports: openReports,
    openDisputes: openDisputes,
    topSearches: [
      for (final s in topSearches)
        (term: s['term'] as String, count: s['count'] as int),
    ],
    topRequested: [
      for (final r in topRequested)
        (title: r['title'] as String, requests: r['requests'] as int),
    ],
  );
}
