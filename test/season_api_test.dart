import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waraqah/app/fake_api_routes.dart';
import 'package:waraqah/features/catalog/data/sources/collection_fake_api.dart';
import 'package:waraqah/features/catalog_admin/data/sources/catalog_admin_fake_api.dart';
import 'package:waraqah/features/home/data/sources/home_fake_api.dart';

Dio _dio() => Dio()..interceptors.add(FakeApiRoutes.interceptor());

Future<T?> _get<T>(Dio dio, String path, String date) async =>
    (await dio.get<T>(path, queryParameters: {'date': date})).data;

void main() {
  test('/home/season picks by date and points at its Collection', () async {
    final dio = _dio();
    final season = await _get<Map<String, dynamic>>(
      dio,
      HomeFakeApi.season,
      '2026-11-01',
    );
    expect(season!['season'], 'admission');
    expect(season['collectionId'], 'col-admission');
    final collection = await dio.get<Map<String, dynamic>>(
      CollectionFakeApi.detail,
      queryParameters: {'id': 'col-admission'},
    );
    expect(collection.data!['books'], isNotEmpty);
    expect(await _get<Object>(dio, HomeFakeApi.season, '2026-06-01'), isNull);
  });

  test(
    '/home/banners: the Season Banner first, other Seasons left out',
    () async {
      final dio = _dio();
      final ids = [
        for (final b in (await _get<List<dynamic>>(
          dio,
          HomeFakeApi.banners,
          '2026-11-01',
        ))!)
          (b as Map)['id'] as String,
      ];
      expect(ids.first, 'ban-admission-season');
      expect(ids, isNot(contains('ban-ramadan')));
      final offSeason = await _get<List<dynamic>>(
        dio,
        HomeFakeApi.banners,
        '2026-06-01',
      );
      expect(offSeason!.every((b) => (b as Map)['season'] == null), isTrue);
    },
  );

  test("Staff's Season override wins until set back to automatic", () async {
    final dio = _dio();
    await dio.post<Object>(
      '${CatalogAdminFakeApi.season}/save',
      data: {'season': 'ramadan'},
    );
    final forced = await _get<Map<String, dynamic>>(
      dio,
      HomeFakeApi.season,
      '2026-06-01',
    );
    expect(forced!['season'], 'ramadan');
    expect(
      (await dio.get<Map<String, dynamic>>(CatalogAdminFakeApi.season)).data,
      {'season': 'ramadan'},
    );

    await dio.post<Object>(
      '${CatalogAdminFakeApi.season}/save',
      data: {'season': null},
    );
    expect(await _get<Object>(dio, HomeFakeApi.season, '2026-06-01'), isNull);
  });
}
