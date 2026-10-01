import 'package:dio/dio.dart';

import '../../../../core/models/book.dart';
import '../models/shared_wishlist_model.dart';
import 'wishlist_fake_api.dart';

/// Talks to the `/wishlist` endpoints, answered for now by the fake API.
class WishlistRemoteSource {
  WishlistRemoteSource(this._dio);

  final Dio _dio;

  Future<List<Book>> fetch() =>
      _books(_dio.get<List<dynamic>>(WishlistFakeApi.wishlist));

  Future<List<Book>> save(String bookId) => _books(
    _dio.post<List<dynamic>>(WishlistFakeApi.save, data: {'bookId': bookId}),
  );

  Future<List<Book>> remove(String bookId) => _books(
    _dio.post<List<dynamic>>(WishlistFakeApi.remove, data: {'bookId': bookId}),
  );

  Future<SharedWishlistModel> share(String ownerName) async {
    final list = await _list(
      _dio.post<Map<String, dynamic>>(
        WishlistFakeApi.share,
        data: {'ownerName': ownerName},
      ),
    );
    if (list == null) throw StateError('The wishlist was not shared.');
    return list;
  }

  Future<SharedWishlistModel?> shared(String id) => _list(
    _dio.get<Map<String, dynamic>>(
      WishlistFakeApi.shared,
      queryParameters: {'id': id},
    ),
  );

  Future<List<Book>> _books(Future<Response<List<dynamic>>> request) async => [
    for (final json in (await request).data ?? const [])
      Book.fromJson(json as Map<String, dynamic>),
  ];

  Future<SharedWishlistModel?> _list(
    Future<Response<Map<String, dynamic>>> request,
  ) async {
    final data = (await request).data;
    return data == null ? null : SharedWishlistModel.fromJson(data);
  }
}
