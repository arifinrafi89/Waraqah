import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waraqah/app/fake_api_routes.dart';
import 'package:waraqah/features/catalog/data/sources/collection_fake_api.dart';

final _dio = Dio()..interceptors.add(FakeApiRoutes.interceptor());

Future<T?> _get<T>(String path, Map<String, dynamic> query) async =>
    (await _dio.get<T>(path, queryParameters: query)).data;

List<String> _ids(List<dynamic> list) => [
  for (final j in list) (j as Map)['id'] as String,
];

void main() {
  test('/experts lists the 4 seeded Experts, all verified', () async {
    final experts = await _get<List<dynamic>>(CollectionFakeApi.experts, {});
    expect(experts, hasLength(4));
    expect(experts!.every((e) => (e as Map)['verified'] == true), isTrue);
  });

  test('/experts/detail returns the Expert and their Collections', () async {
    final found = await _get<Map<String, dynamic>>(CollectionFakeApi.expert, {
      'id': 'exp-shirin-novelist',
    });
    expect(found!['name'], 'Shirin Akhter');
    expect(found['kind'], 'writer');
    final picks = found['collections'] as List<dynamic>;
    expect(_ids(picks), ['col-exp-stories']);
    expect(((picks.first as Map)['books'] as List).length, 4);
  });

  test('an unknown Expert returns null', () async {
    expect(
      await _get<Map<String, dynamic>>(CollectionFakeApi.expert, {
        'id': 'exp-nope',
      }),
      isNull,
    );
  });

  test(
    'an Expert Pick embeds its Expert; a plain Collection does not',
    () async {
      final pick = await _get<Map<String, dynamic>>(CollectionFakeApi.detail, {
        'id': 'col-exp-bcs-start',
      });
      expect((pick!['expert'] as Map)['name'], 'Arif Mahmud');
      final plain = await _get<Map<String, dynamic>>(CollectionFakeApi.detail, {
        'id': 'col-hadith',
      });
      expect(plain!['expert'], isNull);
    },
  );

  test(
    'hasExpert=false leaves out Expert Picks; true keeps only them',
    () async {
      final plain = await _get<List<dynamic>>(CollectionFakeApi.collections, {
        'hasExpert': false,
      });
      expect(plain, hasLength(9));
      expect(_ids(plain!).any((id) => id.startsWith('col-exp-')), isFalse);
      final picks = await _get<List<dynamic>>(CollectionFakeApi.collections, {
        'hasExpert': 'true',
        'section': 'religious',
      });
      expect(_ids(picks!), ['col-exp-first-shelf']);
    },
  );

  test('?expert= keeps one Expert\'s Collections', () async {
    final picks = await _get<List<dynamic>>(CollectionFakeApi.collections, {
      'expert': 'exp-tanvir-physics',
    });
    expect(_ids(picks!), ['col-exp-hsc-maths']);
  });
}
