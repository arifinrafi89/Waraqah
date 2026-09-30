import 'package:dio/dio.dart';

import '../models/offers_model.dart';
import 'offers_fake_api.dart';

/// Talks to `GET /offers`, answered for now by the fake API.
class OffersRemoteSource {
  OffersRemoteSource(this._dio);

  final Dio _dio;

  Future<OffersModel> current() async {
    final response = await _dio.get<Map<String, dynamic>>(OffersFakeApi.offers);
    final data = response.data;
    return data == null ? const OffersModel() : OffersModel.fromJson(data);
  }
}
