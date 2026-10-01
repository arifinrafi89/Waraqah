import 'package:dio/dio.dart';

import '../../domain/entities/donation.dart';
import '../models/recipient_model.dart';
import 'donate_fake_api.dart';

/// Talks to the `/donate` endpoints, answered for now by the fake API.
class DonateRemoteSource {
  DonateRemoteSource(this._dio);

  final Dio _dio;

  Future<List<RecipientModel>> recipients() async {
    final response = await _dio.get<List<dynamic>>(DonateFakeApi.recipients);
    return [
      for (final json in response.data ?? const [])
        RecipientModel.fromJson(json as Map<String, dynamic>),
    ];
  }

  Future<RecipientModel?> recipient(String id) async {
    final response = await _dio.get<Map<String, dynamic>>(
      DonateFakeApi.recipient,
      queryParameters: {'id': id},
    );
    final data = response.data;
    return data == null ? null : RecipientModel.fromJson(data);
  }

  Future<DonationModel> donate(DonationRequest request) async {
    final response = await _dio.post<Map<String, dynamic>>(
      DonateFakeApi.give,
      data: {
        'recipientId': request.recipientId,
        'bookId': request.bookId,
        'quantity': request.quantity,
        'payment': request.payment.name,
        'note': request.note,
      },
    );
    final data = response.data;
    if (data == null) throw StateError('The donation was not placed.');
    return DonationModel.fromJson(data);
  }
}
