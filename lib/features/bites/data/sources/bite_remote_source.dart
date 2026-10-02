import 'package:dio/dio.dart';

import '../../domain/entities/bite_query.dart';
import '../models/bite_model.dart';
import 'bite_fake_api.dart';

/// Talks to `/bites…`, answered for now by the fake API. A refused change
/// (`null`) is an error.
class BiteRemoteSource {
  BiteRemoteSource(this._dio);

  final Dio _dio;

  Future<List<BiteModel>> feed(BiteQuery query) async {
    final data = (await _dio.get<List<dynamic>>(
      BiteFakeApi.feed,
      queryParameters: {
        'feed': query.following ? 'following' : 'forYou',
        'bookId': ?query.bookId,
        'authorId': ?query.authorId,
      },
    )).data;
    return [
      for (final json in data ?? const [])
        BiteModel.fromJson(json as Map<String, dynamic>),
    ];
  }

  Future<BiteDetailModel> detail(String id) async => BiteDetailModel.fromJson(
    _refused(
      (await _dio.get<Map<String, dynamic>>(
        BiteFakeApi.detail,
        queryParameters: {'id': id},
      )).data,
    ),
  );

  Future<BiteModel> save(BiteDraft d) async => BiteModel.fromJson(
    await _post(d.id == null ? BiteFakeApi.post : BiteFakeApi.edit, {
      'id': ?d.id,
      'text': d.text,
      'bookId': ?d.bookId,
      'spoiler': d.spoiler,
    }),
  );

  Future<void> delete(String id) => _post(BiteFakeApi.delete, {'id': id});

  Future<BiteModel> like(String id, {required bool liked}) async =>
      BiteModel.fromJson(
        await _post(BiteFakeApi.like, {'id': id, 'liked': liked}),
      );

  Future<BiteDetailModel> comment(
    String biteId,
    String text, {
    String? parentId,
  }) async => BiteDetailModel.fromJson(
    await _post(BiteFakeApi.comment, {
      'biteId': biteId,
      'text': text,
      'parentId': ?parentId,
    }),
  );

  Future<BiteDetailModel> deleteComment(String id) async =>
      BiteDetailModel.fromJson(
        await _post(BiteFakeApi.deleteComment, {'id': id}),
      );

  Future<Map<String, dynamic>> _post(
    String path,
    Map<String, Object> body,
  ) async =>
      _refused((await _dio.post<Map<String, dynamic>>(path, data: body)).data);

  Map<String, dynamic> _refused(Map<String, dynamic>? data) =>
      data ?? (throw StateError('The server refused the change.'));
}
