import 'package:dio/dio.dart';

import '../../domain/entities/book_request.dart';
import '../models/book_request_model.dart';
import '../models/wanted_book_model.dart';
import 'book_request_fake_api.dart';

/// Talks to the `/requests` endpoints, answered for now by the fake API.
/// A refused change (`null`) is an error, shown by the page.
class BookRequestRemoteSource {
  BookRequestRemoteSource(this._dio);

  final Dio _dio;

  Future<BookRequestModel> create(BookRequestDraft draft) async {
    final response = await _dio.post<Map<String, dynamic>>(
      BookRequestFakeApi.create,
      data: {
        'title': draft.title,
        'author': ?draft.author,
        'bookId': ?draft.bookId,
        'maxPriceBdt': ?draft.maxPriceBdt,
        'note': ?draft.note,
      },
    );
    final data = response.data;
    if (data == null) throw StateError('The server refused the request.');
    return BookRequestModel.fromJson(data);
  }

  Future<List<BookRequestModel>> mine() async => _list(
    await _dio.get<List<dynamic>>(BookRequestFakeApi.mine),
    BookRequestModel.fromJson,
  );

  Future<List<BookRequestModel>> close(String id) async => _list(
    await _dio.post<List<dynamic>>(BookRequestFakeApi.close, data: {'id': id}),
    BookRequestModel.fromJson,
  );

  Future<List<WantedBookModel>> wanted() async => _list(
    await _dio.get<List<dynamic>>(BookRequestFakeApi.wanted),
    WantedBookModel.fromJson,
  );

  Future<List<BookDemandModel>> demand() async => _list(
    await _dio.get<List<dynamic>>(BookRequestFakeApi.demand),
    BookDemandModel.fromJson,
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
