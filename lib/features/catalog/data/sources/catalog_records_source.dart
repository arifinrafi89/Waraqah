import 'package:dio/dio.dart';

import '../../../../core/models/book.dart';
import '../../domain/entities/author.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/publisher.dart';
import '../models/catalog_record_models.dart';
import 'book_fake_api.dart';

/// Talks to `GET /publishers/detail?id=…`, answered by the `FakeApiInterceptor`.
class CatalogRecordsSource {
  CatalogRecordsSource(this._dio);

  final Dio _dio;

  Future<List<Category>> categories(Section section) async {
    final response = await _dio.get<List<dynamic>>(
      BookFakeApi.categories,
      queryParameters: {'section': section.name},
    );
    return (response.data ?? [])
        .cast<Map<String, dynamic>>()
        .map((json) => CategoryModel.fromJson(json).toEntity())
        .toList();
  }

  /// `null` when [id] is not a known Author.
  Future<Author?> author(String id) async {
    final response = await _dio.get<Map<String, dynamic>>(
      BookFakeApi.author,
      queryParameters: {'id': id},
    );
    final data = response.data;
    return data == null ? null : AuthorModel.fromJson(data).toEntity();
  }

  /// `null` when [id] is not a known Publisher.
  Future<Publisher?> publisher(String id) async {
    final response = await _dio.get<Map<String, dynamic>>(
      BookFakeApi.publisher,
      queryParameters: {'id': id},
    );
    final data = response.data;
    return data == null ? null : PublisherModel.fromJson(data).toEntity();
  }
}
