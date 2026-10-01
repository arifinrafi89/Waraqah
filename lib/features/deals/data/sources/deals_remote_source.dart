import 'package:dio/dio.dart';

import '../models/deals_model.dart';
import 'deals_fake_api.dart';

/// Talks to `GET /deals`, answered for now by the fake API.
class DealsRemoteSource {
  DealsRemoteSource(this._dio);

  final Dio _dio;

  Future<DealsModel> current() async {
    final response = await _dio.get<Map<String, dynamic>>(DealsFakeApi.deals);
    final data = response.data;
    return data == null ? const DealsModel() : DealsModel.fromJson(data);
  }
}
