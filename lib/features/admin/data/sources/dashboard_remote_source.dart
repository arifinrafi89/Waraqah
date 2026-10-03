import 'package:dio/dio.dart';

import '../models/admin_dashboard_model.dart';
import 'dashboard_fake_api.dart';

/// Talks to `/admin/dashboard`, answered for now by the fake API.
class DashboardRemoteSource {
  DashboardRemoteSource(this._dio);

  final Dio _dio;

  Future<AdminDashboardModel> dashboard() async {
    final response = await _dio.get<Map<String, dynamic>>(
      DashboardFakeApi.dashboard,
    );
    return AdminDashboardModel.fromJson(response.data!);
  }
}
