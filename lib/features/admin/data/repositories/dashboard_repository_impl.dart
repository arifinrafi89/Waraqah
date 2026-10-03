import '../../domain/entities/admin_dashboard.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../models/admin_dashboard_model.dart';
import '../sources/dashboard_remote_source.dart';

/// No cache: the numbers change all day.
class DashboardRepositoryImpl implements DashboardRepository {
  DashboardRepositoryImpl(this._source);

  final DashboardRemoteSource _source;

  @override
  Future<AdminDashboard> dashboard() async =>
      (await _source.dashboard()).toEntity();
}
