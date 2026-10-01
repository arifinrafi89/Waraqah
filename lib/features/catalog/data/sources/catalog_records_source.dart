import 'package:dio/dio.dart';

import '../../../../core/models/book.dart';
import '../../domain/entities/author.dart';
import '../../domain/entities/collection.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/expert.dart';
import '../../domain/entities/publisher.dart';
import '../../domain/entities/subject.dart';
import '../models/catalog_record_models.dart';
import '../models/collection_model.dart';
import '../models/expert_model.dart';
import 'book_fake_api.dart';
import 'collection_fake_api.dart';

/// Talks to `GET /publishers/detail?id=…`, answered by the `FakeApiInterceptor`.
class CatalogRecordsSource {
  CatalogRecordsSource(this._dio);

  final Dio _dio;

  Future<List<Category>> categories(Section section) => _inSection(
    BookFakeApi.categories,
    section,
    (json) => CategoryModel.fromJson(json).toEntity(),
  );

  /// Subjects with Books in [section].
  Future<List<Subject>> subjects(Section section) => _inSection(
    BookFakeApi.subjects,
    section,
    (json) => SubjectModel.fromJson(json).toEntity(),
  );

  Future<List<T>> _inSection<T>(
    String path,
    Section section,
    T Function(Map<String, dynamic>) read,
  ) async {
    final response = await _dio.get<List<dynamic>>(
      path,
      queryParameters: {'section': section.name},
    );
    return [for (final json in response.data ?? const []) read(json)];
  }

  Future<Map<String, dynamic>?> _detail(String path, String id) async =>
      (await _dio.get<Map<String, dynamic>>(
        path,
        queryParameters: {'id': id},
      )).data;

  /// `null` when [id] is not a known Author.
  Future<Author?> author(String id) async {
    final data = await _detail(BookFakeApi.author, id);
    return data == null ? null : AuthorModel.fromJson(data).toEntity();
  }

  /// `null` when [id] is not a known Publisher.
  Future<Publisher?> publisher(String id) async {
    final data = await _detail(BookFakeApi.publisher, id);
    return data == null ? null : PublisherModel.fromJson(data).toEntity();
  }

  /// Every Collection, or only [section]'s; only Expert Picks when
  /// [hasExpert] is true, none when false.
  Future<List<Collection>> collections(
    Section? section, {
    bool? hasExpert,
  }) async {
    final response = await _dio.get<List<dynamic>>(
      CollectionFakeApi.collections,
      queryParameters: {'section': ?section?.name, 'hasExpert': ?hasExpert},
    );
    return (response.data ?? [])
        .cast<Map<String, dynamic>>()
        .map(_collection)
        .toList();
  }

  /// `null` when [id] is not a known Collection.
  Future<Collection?> collection(String id) async {
    final data = await _detail(CollectionFakeApi.detail, id);
    return data == null ? null : _collection(data);
  }

  Future<List<Expert>> experts() async {
    final response = await _dio.get<List<dynamic>>(CollectionFakeApi.experts);
    return [
      for (final json in response.data ?? const [])
        ExpertModel.fromJson(json as Map<String, dynamic>).toEntity(),
    ];
  }

  /// `null` when [id] is not a known Expert.
  Future<ExpertDetail?> expert(String id) async {
    final data = await _detail(CollectionFakeApi.expert, id);
    if (data == null) return null;
    return (
      expert: ExpertModel.fromJson(data).toEntity(),
      picks: [
        for (final c in data['collections'] as List<dynamic>)
          _collection(c as Map<String, dynamic>),
      ],
    );
  }

  static Collection _collection(Map<String, dynamic> json) {
    final expert = json['expert'] as Map<String, dynamic>?;
    return CollectionModel.fromJson(json).toEntity([
      for (final book in json['books'] as List<dynamic>)
        Book.fromJson(book as Map<String, dynamic>),
    ], expert: expert == null ? null : ExpertModel.fromJson(expert).toEntity());
  }
}
