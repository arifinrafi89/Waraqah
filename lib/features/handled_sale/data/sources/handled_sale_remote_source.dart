import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../checkout/domain/entities/payment_method.dart';
import '../../domain/entities/handled_sale.dart';
import '../../domain/repositories/handled_sale_repository.dart';
import '../models/earnings_model.dart';
import '../models/handled_sale_model.dart';
import 'handled_sale_fake_api.dart';

/// Talks to the `/sales` endpoints, answered for now by the fake API.
/// A refused change (`null`) is an error, shown by the page.
class HandledSaleRemoteSource {
  HandledSaleRemoteSource(this._dio);

  final Dio _dio;

  Future<HandledSaleModel> buy(String listingId, PaymentMethod method) => _sale(
    HandledSaleFakeApi.buy,
    {'listingId': listingId, 'method': method.name},
  );

  Future<List<HandledSaleModel>> mine() async => _list(
    await _dio.get<List<dynamic>>(HandledSaleFakeApi.mine),
    HandledSaleModel.fromJson,
  );

  Future<HandledSaleModel?> sale(String id) async {
    final response = await _dio.get<Map<String, dynamic>>(
      HandledSaleFakeApi.sale,
      queryParameters: {'id': id},
    );
    final data = response.data;
    return data == null ? null : HandledSaleModel.fromJson(data);
  }

  Future<HandledSaleModel> step(String id, SaleStep step) =>
      _sale(HandledSaleFakeApi.step, {'id': id, 'step': step.name});

  Future<HandledSaleModel> dispute(DisputeDraft d) =>
      _sale(HandledSaleFakeApi.dispute, {
        'id': d.saleId,
        'reason': d.reason.name,
        'note': ?d.note,
        'photos': [for (final photo in d.photos) base64Encode(photo)],
      });

  Future<EarningsModel> earnings() =>
      _earnings(_dio.get<Map<String, dynamic>>(HandledSaleFakeApi.earnings));

  Future<EarningsModel> payout() =>
      _earnings(_dio.post<Map<String, dynamic>>(HandledSaleFakeApi.payout));

  Future<List<SaleDisputeModel>> disputes() async => _list(
    await _dio.get<List<dynamic>>(HandledSaleFakeApi.disputes),
    SaleDisputeModel.fromJson,
  );

  Future<List<SaleDisputeModel>> settle(
    String id,
    bool refund,
    String by,
  ) async => _list(
    await _dio.post<List<dynamic>>(
      HandledSaleFakeApi.settle,
      data: {'id': id, 'refund': refund, 'by': by},
    ),
    SaleDisputeModel.fromJson,
  );

  Future<HandledSaleModel> _sale(String path, Map<String, dynamic> body) async {
    final data = (await _dio.post<Map<String, dynamic>>(path, data: body)).data;
    if (data == null) throw StateError('The server refused $path.');
    return HandledSaleModel.fromJson(data);
  }

  Future<EarningsModel> _earnings(
    Future<Response<Map<String, dynamic>>> request,
  ) async {
    final data = (await request).data;
    if (data == null) throw StateError('The server refused the payout.');
    return EarningsModel.fromJson(data);
  }

  List<T> _list<T>(
    Response<List<dynamic>> response,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    final data = response.data;
    if (data == null) throw StateError('The server refused the change.');
    return [for (final json in data) fromJson(json as Map<String, dynamic>)];
  }
}
