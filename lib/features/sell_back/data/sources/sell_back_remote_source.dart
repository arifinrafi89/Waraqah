import 'package:dio/dio.dart';

import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../domain/entities/sell_back.dart';
import '../models/sell_back_model.dart';
import 'sell_back_fake_api.dart';

/// Talks to the `/sell-back` endpoints, answered for now by the fake API.
/// A refused change (`null`) is an error, shown by the page.
class SellBackRemoteSource {
  SellBackRemoteSource(this._dio);

  final Dio _dio;

  Future<List<SellBackBookModel>> books(String query) async => _list(
    await _dio.get<List<dynamic>>(
      SellBackFakeApi.books,
      queryParameters: {'q': query},
    ),
    SellBackBookModel.fromJson,
  );

  Future<SellBackBookModel?> book(String id) async {
    final data = (await _dio.get<Map<String, dynamic>>(
      SellBackFakeApi.book,
      queryParameters: {'id': id},
    )).data;
    return data == null ? null : SellBackBookModel.fromJson(data);
  }

  Future<SellBackModel> create(SellBackDraft draft) async {
    final data = (await _dio.post<Map<String, dynamic>>(
      SellBackFakeApi.create,
      data: {
        'bookId': draft.bookId,
        'condition': draft.condition.name,
        'flags': draft.flags,
        'pickupAddress': draft.pickupAddress,
      },
    )).data;
    if (data == null) throw StateError('The server refused the Sell Back.');
    return SellBackModel.fromJson(data);
  }

  Future<List<SellBackModel>> mine() async => _list(
    await _dio.get<List<dynamic>>(SellBackFakeApi.mine),
    SellBackModel.fromJson,
  );

  Future<List<SellBackModel>> queue() async => _list(
    await _dio.get<List<dynamic>>(SellBackFakeApi.queue),
    SellBackModel.fromJson,
  );

  Future<List<SellBackModel>> grade(
    String id,
    BookCondition condition,
    bool accept,
    String by,
  ) async => _list(
    await _dio.post<List<dynamic>>(
      SellBackFakeApi.grade,
      data: {'id': id, 'condition': condition.name, 'accept': accept, 'by': by},
    ),
    SellBackModel.fromJson,
  );

  List<T> _list<T>(
    Response<List<dynamic>> response,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    final data = response.data;
    if (data == null) throw StateError('The server refused the change.');
    return [for (final json in data) fromJson(json as Map<String, dynamic>)];
  }
}
