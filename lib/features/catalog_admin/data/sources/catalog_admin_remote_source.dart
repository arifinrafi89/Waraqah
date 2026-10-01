import 'package:dio/dio.dart';

import '../../../../core/models/book.dart';
import '../../../home/data/models/banner_model.dart';
import '../../../home/domain/entities/banner.dart';
import '../../../home/domain/entities/season.dart';
import '../../domain/entities/book_draft.dart';
import '../../domain/entities/catalog_record.dart';
import '../../domain/entities/list_draft.dart';
import '../models/book_draft_json.dart';
import '../models/catalog_record_model.dart';
import 'catalog_admin_fake_api.dart';

/// Talks to the `/admin/catalog` endpoints, answered for now by the fake
/// API. A refused change (`null`) is an error, shown by the page.
class CatalogAdminRemoteSource {
  CatalogAdminRemoteSource(this._dio);

  final Dio _dio;

  Future<Book> saveBook(BookDraft draft) async =>
      Book.fromJson(await _post(CatalogAdminFakeApi.saveBook, draft.toJson()));

  Future<Book> setHidden(String id, bool hidden) async => Book.fromJson(
    await _post(CatalogAdminFakeApi.hideBook, {'id': id, 'hidden': hidden}),
  );

  Future<List<CatalogRecordModel>> records(RecordKind kind) async {
    final response = await _dio.get<List<dynamic>>(
      CatalogAdminFakeApi.records(kind),
    );
    return [
      for (final json in response.data ?? const [])
        CatalogRecordModel.fromJson(json as Map<String, dynamic>),
    ];
  }

  Future<CatalogRecordModel> saveRecord(
    RecordKind kind,
    CatalogRecord r,
  ) async => CatalogRecordModel.fromJson(
    await _post('${CatalogAdminFakeApi.records(kind)}/save', {
      'id': ?r.id,
      'name': r.name,
      'nameBn': r.nameBn,
      'section': ?r.section?.name,
    }),
  );

  Future<void> deleteRecord(RecordKind kind, String id) =>
      _post('${CatalogAdminFakeApi.records(kind)}/delete', {'id': id});

  Future<List<BannerModel>> banners() async {
    final response = await _dio.get<List<dynamic>>(CatalogAdminFakeApi.banners);
    return [
      for (final json in response.data ?? const [])
        BannerModel.fromJson(json as Map<String, dynamic>),
    ];
  }

  /// The Season Staff forced on Home; `null` = automatic.
  Future<Season?> seasonOverride() async {
    final response = await _dio.get<Map<String, dynamic>>(
      CatalogAdminFakeApi.season,
    );
    final name = response.data?['season'] as String?;
    return name == null ? null : Season.values.byName(name);
  }

  Future<void> setSeasonOverride(Season? season) =>
      _post('${CatalogAdminFakeApi.season}/save', {'season': season?.name});

  Future<void> saveBanner(Banner b) => _post(CatalogAdminFakeApi.saveBanner, {
    'id': b.id,
    'titleEn': b.titleEn,
    'titleBn': b.titleBn,
    'subtitleEn': b.subtitleEn,
    'subtitleBn': b.subtitleBn,
    'seed': b.seed,
    'target': {'kind': b.target.kind.name, 'value': b.target.value},
    'season': b.season?.name,
  });

  Future<void> deleteBanner(String id) =>
      _post(CatalogAdminFakeApi.deleteBanner, {'id': id});

  Future<void> moveBanner(String id, int by) =>
      _post(CatalogAdminFakeApi.moveBanner, {'id': id, 'by': by});

  Future<void> saveList(ListDraft d) => _post(
    d.isBooklist
        ? CatalogAdminFakeApi.saveBooklist
        : CatalogAdminFakeApi.saveCollection,
    {
      'id': ?d.id,
      'titleEn': d.titleEn,
      'titleBn': d.titleBn,
      'noteEn': d.noteEn,
      'noteBn': d.noteBn,
      'section': ?d.section?.name,
      'expertId': ?d.expertId,
      'kind': ?d.kind?.name,
      'bookIds': d.bookIds,
    },
  );

  Future<void> deleteList(String id, {required bool booklist}) => _post(
    booklist
        ? CatalogAdminFakeApi.deleteBooklist
        : CatalogAdminFakeApi.deleteCollection,
    {'id': id},
  );

  Future<dynamic> _post(String path, Map<String, dynamic> body) async {
    final data = (await _dio.post<dynamic>(path, data: body)).data;
    if (data == null) throw StateError('The server refused the change.');
    return data;
  }
}
