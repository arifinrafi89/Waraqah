import 'package:dio/dio.dart';

import '../models/p2p_listing_model.dart';
import '../models/seller_profile_model.dart';
import 'p2p_fake_api.dart';

/// Talks to the `/p2p` endpoints, answered for now by the fake API.
class P2pRemoteSource {
  P2pRemoteSource(this._dio);

  final Dio _dio;

  Future<List<P2pListingModel>> listings({
    bool onlyAvailable = false,
    int? limit,
  }) => _list(
    _dio.get<List<dynamic>>(
      P2pFakeApi.listings,
      queryParameters: {
        if (onlyAvailable) 'available': 'true',
        'limit': ?limit?.toString(),
      },
    ),
  );

  Future<List<P2pListingModel>> mine() =>
      _list(_dio.get<List<dynamic>>(P2pFakeApi.mine));

  Future<List<P2pListingModel>> forBook(String bookId) => _list(
    _dio.get<List<dynamic>>(
      P2pFakeApi.forBook,
      queryParameters: {'bookId': bookId},
    ),
  );

  Future<P2pListingModel?> listing(String id) async {
    final response = await _dio.get<Map<String, dynamic>>(
      P2pFakeApi.listing,
      queryParameters: {'id': id},
    );
    final data = response.data;
    return data == null ? null : P2pListingModel.fromJson(data);
  }

  Future<SellerProfileModel?> seller(String id) async {
    final response = await _dio.get<Map<String, dynamic>>(
      P2pFakeApi.seller,
      queryParameters: {'id': id},
    );
    final data = response.data;
    return data == null ? null : SellerProfileModel.fromJson(data);
  }

  Future<List<P2pListingModel>> _list(
    Future<Response<List<dynamic>>> request,
  ) async => [
    for (final json in (await request).data ?? const [])
      P2pListingModel.fromJson(json as Map<String, dynamic>),
  ];
}
