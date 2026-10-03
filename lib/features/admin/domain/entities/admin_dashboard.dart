import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_dashboard.freezed.dart';

/// Today at a glance, for Staff.
@freezed
abstract class AdminDashboard with _$AdminDashboard {
  const factory AdminDashboard({
    required int ordersToday,
    required int salesTodayBdt,

    /// Placed, confirmed or packed: not shipped yet.
    required int ordersToShip,
    required int listingsWaiting,
    required int openReports,
    required int openDisputes,
    required List<SearchCount> topSearches,
    required List<RequestCount> topRequested,
  }) = _AdminDashboard;
}

/// A search term and how often readers searched it.
typedef SearchCount = ({String term, int count});

/// A requested title and how many open requests ask for it.
typedef RequestCount = ({String title, int requests});
