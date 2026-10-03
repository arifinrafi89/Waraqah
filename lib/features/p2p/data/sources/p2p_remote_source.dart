import 'dart:convert';

import 'package:dio/dio.dart';

import '../../domain/usecases/save_listing.dart';

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

  /// A refused save (`null`) is an error, shown by the form.
  Future<P2pListingModel> save(SaveListingParams params) async {
    final l = params.listing;
    final response = await _dio.post<Map<String, dynamic>>(
      P2pFakeApi.save,
      data: {
        if (l.id.isNotEmpty) 'id': l.id,
        'submit': params.submit,
        'title': l.title,
        'bookId': ?l.bookId,
        'newPriceBdt': ?l.newPriceBdt,
        'condition': l.condition.name,
        'flags': l.flags,
        'note': ?l.note,
        'priceBdt': l.priceBdt,
        'isNegotiable': l.isNegotiable,
        'handover': l.handover.name,
        'photos': l.photos,
        'photoData': {
          for (final MapEntry(:key, :value) in params.newPhotos.entries)
            key: base64Encode(value),
        },
      },
    );
    final data = response.data;
    if (data == null) throw StateError('The server refused the listing.');
    return P2pListingModel.fromJson(data);
  }

  Future<List<P2pListingModel>> _list(
    Future<Response<List<dynamic>>> request,
  ) async => [
    for (final json in (await request).data ?? const [])
      P2pListingModel.fromJson(json as Map<String, dynamic>),
  ];
}
