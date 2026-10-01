import 'package:dio/dio.dart';

import '../models/banner_model.dart';
import 'home_fake_api.dart';

/// Talks to `GET /home/banners`, answered by the `FakeApiInterceptor`
/// installed on `dioProvider` (see `app/fake_api_routes.dart`).
class BannerRemoteSource {
  BannerRemoteSource(this._dio);

  final Dio _dio;

  Future<List<BannerModel>> fetchBanners() async {
    final response = await _dio.get<List<dynamic>>(HomeFakeApi.banners);
    return [
      for (final json in response.data!)
        BannerModel.fromJson(json as Map<String, dynamic>),
    ];
  }
}
