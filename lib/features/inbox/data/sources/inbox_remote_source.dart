import 'package:dio/dio.dart';

import '../../domain/repositories/inbox_repository.dart';
import '../models/inbox_thread_model.dart';
import 'inbox_fake_api.dart';

/// Talks to the `/inbox` endpoints, answered for now by the fake API.
/// A refused change (`null`) is an error, shown by the page.
class InboxRemoteSource {
  InboxRemoteSource(this._dio);

  final Dio _dio;

  Future<List<InboxThreadModel>> threads({String? listingId}) async {
    final response = await _dio.get<List<dynamic>>(
      InboxFakeApi.threads,
      queryParameters: {'listingId': ?listingId},
    );
    return [
      for (final json in response.data ?? const [])
        InboxThreadModel.fromJson(json as Map<String, dynamic>),
    ];
  }

  Future<InboxThreadModel?> thread(String id) async {
    final response = await _dio.get<Map<String, dynamic>>(
      InboxFakeApi.thread,
      queryParameters: {'id': id},
    );
    final data = response.data;
    return data == null ? null : InboxThreadModel.fromJson(data);
  }

  Future<InboxThreadModel> open(String listingId) =>
      _change(InboxFakeApi.open, {'listingId': listingId});

  Future<InboxThreadModel> send(String threadId, String text) =>
      _change(InboxFakeApi.send, {'threadId': threadId, 'text': text});

  Future<InboxThreadModel> makeOffer(OfferRequest request) =>
      _change(InboxFakeApi.offer, {
        'listingId': request.listingId,
        'amountBdt': request.amountBdt,
        'handover': request.handover.name,
      });

  Future<InboxThreadModel> decide(
    String threadId,
    String offerId, {
    required bool accept,
  }) => _change(InboxFakeApi.decide, {
    'threadId': threadId,
    'offerId': offerId,
    'accept': accept,
  });

  Future<InboxThreadModel> markRead(String threadId) =>
      _change(InboxFakeApi.read, {'threadId': threadId});

  Future<InboxThreadModel> release(String threadId) =>
      _change(InboxFakeApi.release, {'threadId': threadId});

  Future<InboxThreadModel> markSold(String threadId) =>
      _change(InboxFakeApi.sold, {'threadId': threadId});

  Future<InboxThreadModel> _change(
    String path,
    Map<String, Object> body,
  ) async {
    final response = await _dio.post<Map<String, dynamic>>(path, data: body);
    final data = response.data;
    if (data == null) throw StateError('The server refused $path.');
    return InboxThreadModel.fromJson(data);
  }
}
