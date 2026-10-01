import 'package:dio/dio.dart';

import '../../../../core/models/book.dart';
import '../../domain/entities/booklist.dart';
import '../models/booklist_model.dart';
import 'booklist_fake_api.dart';

/// Talks to the `/booklists` endpoints, answered for now by the fake API.
/// A refused change (`null`) is an error.
class BooklistRemoteSource {
  BooklistRemoteSource(this._dio);

  final Dio _dio;

  Future<List<Booklist>> booklists() async {
    final response = await _dio.get<List<dynamic>>(BooklistFakeApi.booklists);
    return [
      for (final json in response.data ?? const [])
        _booklist(json as Map<String, dynamic>),
    ];
  }

  /// `null` when [id] is not a known Booklist.
  Future<Booklist?> booklist(String id) async {
    final response = await _dio.get<Map<String, dynamic>>(
      BooklistFakeApi.detail,
      queryParameters: {'id': id},
    );
    final data = response.data;
    return data == null ? null : _booklist(data);
  }

  Future<Booklist> saveMine({
    String? id,
    String? name,
    List<String>? bookIds,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      BooklistFakeApi.saveMine,
      data: {'id': ?id, 'name': ?name, 'bookIds': ?bookIds},
    );
    final data = response.data;
    if (data == null) throw StateError('The server refused the change.');
    return _booklist(data);
  }

  Future<void> deleteMine(String id) async {
    final response = await _dio.post<dynamic>(
      BooklistFakeApi.deleteMine,
      data: {'id': id},
    );
    if (response.data == null) throw StateError('The server refused it.');
  }

  static Booklist _booklist(Map<String, dynamic> json) =>
      BooklistModel.fromJson(json).toEntity([
        for (final book in json['books'] as List<dynamic>)
          Book.fromJson(book as Map<String, dynamic>),
      ]);
}
