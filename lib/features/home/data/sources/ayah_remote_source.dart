import 'package:dio/dio.dart';

import '../models/ayah_model.dart';
import 'ayah_fake_api.dart';

/// Talks to `GET /islamic/ayah-of-the-day`, answered by the `FakeApiInterceptor`
/// installed on `dioProvider` (see `app/fake_api_routes.dart`).
class AyahRemoteSource {
  AyahRemoteSource(this._dio);

  final Dio _dio;

  Future<AyahModel> fetchAyahOfTheDay() async {
    final response = await _dio.get<Map<String, dynamic>>(
      AyahFakeApi.ayahOfTheDay,
    );
    return AyahModel.fromJson(response.data!);
  }
}
