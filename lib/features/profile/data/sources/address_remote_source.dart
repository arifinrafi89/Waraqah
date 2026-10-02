import 'package:dio/dio.dart';

import '../models/geo_model.dart';
import '../models/saved_address_model.dart';
import 'profile_fake_api.dart';

/// Talks to `/addresses…` and `/geo`, answered for now by the fake API. A
/// refused change (`null`) is an error, shown by the page.
class AddressRemoteSource {
  AddressRemoteSource(this._dio);

  final Dio _dio;

  Future<List<SavedAddressModel>> addresses() =>
      _list(_dio.get<List<dynamic>>(ProfileFakeApi.addresses));

  Future<List<SavedAddressModel>> save(SavedAddressModel address) => _list(
    _dio.post<List<dynamic>>(
      ProfileFakeApi.saveAddress,
      data: address.toJson(),
    ),
  );

  Future<List<SavedAddressModel>> delete(String id) => _list(
    _dio.post<List<dynamic>>(ProfileFakeApi.deleteAddress, data: {'id': id}),
  );

  Future<List<SavedAddressModel>> makeDefault(String id) => _list(
    _dio.post<List<dynamic>>(ProfileFakeApi.defaultAddress, data: {'id': id}),
  );

  Future<List<GeoDivisionModel>> geo() async {
    final data = (await _dio.get<List<dynamic>>(ProfileFakeApi.geo)).data!;
    return [
      for (final json in data)
        GeoDivisionModel.fromJson(json as Map<String, dynamic>),
    ];
  }

  Future<List<SavedAddressModel>> _list(
    Future<Response<List<dynamic>>> request,
  ) async {
    final data = (await request).data;
    if (data == null) throw StateError('The server refused the change.');
    return [
      for (final json in data)
        SavedAddressModel.fromJson(json as Map<String, dynamic>),
    ];
  }
}
