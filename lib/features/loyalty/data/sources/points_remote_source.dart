import 'package:dio/dio.dart';

import '../models/points_model.dart';
import 'points_fake_api.dart';

/// Talks to `GET /points`, answered for now by the fake API.
class PointsRemoteSource {
  PointsRemoteSource(this._dio);

  final Dio _dio;

  Future<PointsAccountModel> account() async {
    final response = await _dio.get<Map<String, dynamic>>(PointsFakeApi.points);
    final data = response.data;
    return data == null
        ? const PointsAccountModel()
        : PointsAccountModel.fromJson(data);
  }
}
