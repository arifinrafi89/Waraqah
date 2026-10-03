import '../../../../core/usecase/usecase.dart';
import '../entities/admin_dashboard.dart';
import '../repositories/dashboard_repository.dart';

/// Today at a glance, for Staff.
class GetDashboard extends UseCase<AdminDashboard, NoParams> {
  GetDashboard(this._repository);

  final DashboardRepository _repository;

  @override
  Future<AdminDashboard> call(NoParams params) => _repository.dashboard();
}
