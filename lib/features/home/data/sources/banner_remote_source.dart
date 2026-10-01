import 'package:dio/dio.dart';

import '../models/banner_model.dart';
import '../models/season_model.dart';
import 'home_fake_api.dart';

/// Talks to `GET /home/banners` and `/home/season`, answered by the `FakeApiInterceptor`
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

  /// The active Season's hero card, or `null` when none is on.
  Future<SeasonModel?> fetchSeason() async {
    final response = await _dio.get<Map<String, dynamic>>(HomeFakeApi.season);
    final data = response.data;
    return data == null ? null : SeasonModel.fromJson(data);
  }
}
