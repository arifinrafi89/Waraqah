import '../entities/admin_dashboard.dart';

abstract interface class DashboardRepository {
  Future<AdminDashboard> dashboard();
}
