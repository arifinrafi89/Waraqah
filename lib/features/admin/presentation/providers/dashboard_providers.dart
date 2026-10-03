import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/dashboard_repository_impl.dart';
import '../../data/sources/dashboard_remote_source.dart';
import '../../domain/entities/admin_dashboard.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../../domain/usecases/get_dashboard.dart';

final dashboardRepositoryProvider = Provider<DashboardRepository>(
  (ref) =>
      DashboardRepositoryImpl(DashboardRemoteSource(ref.watch(dioProvider))),
);

final getDashboardProvider = Provider<GetDashboard>(
  (ref) => GetDashboard(ref.watch(dashboardRepositoryProvider)),
);

/// Today at a glance; pull to refresh.
final dashboardProvider = FutureProvider<AdminDashboard>(
  (ref) => ref.watch(getDashboardProvider).call(const NoParams()),
);
