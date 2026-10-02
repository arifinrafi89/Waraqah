import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/features/catalog/data/sources/book_fixtures.dart';

import 'helpers/fake_backend.dart';

void main() {
  late FakeBackend api;

  setUp(() => api = FakeBackend());

  Future<Map<String, dynamic>?> post(
    String path,
    Map<String, Object?> b,
  ) async => (await api.dio.post<Map<String, dynamic>>(path, data: b)).data;

  Future<Map<String, dynamic>?> save(String book, int stars, [String t = '']) =>
      post('/reviews/save', {'bookId': book, 'stars': stars, 'text': t});

  double rating(String id) =>
      BookFixtures.all.firstWhere((b) => b.id == id).rating;

  test('save then edit keeps one review', () async {
    final first = await save('bk-sapiens', 3, 'Good');
    expect(first!['count'], 3);
    final edited = await save('bk-sapiens', 5, 'Great');
    expect(edited!['count'], 3);
    expect((edited['mine'] as Map)['stars'], 5);
    expect((edited['mine'] as Map)['editedAt'], isNotNull);
    expect((edited['reviews'] as List).first['text'], 'Great');
  });

  test('Verified Purchase needs a delivered order', () async {
    final sapiens = await save('bk-sapiens', 4);
    expect((sapiens!['mine'] as Map)['verified'], isTrue);
    final clean = await save('bk-cleancode', 4);
    expect((clean!['mine'] as Map)['verified'], isFalse);

    await post('/cart/add', {'kind': 'edition', 'id': 'bk-cleancode-pb-en'});
    final placed = await post('/orders/place', {
      'addressId': 'addr-home',
      'payment': 'cashOnDelivery',
    });
    for (final status in ['confirmed', 'packed', 'shipped', 'delivered']) {
      await api.post('/admin/orders/advance', {
        'number': placed!['number'],
        'status': status,
      });
    }
    final after = await api.dio.get<Map<String, dynamic>>(
      '/reviews',
      queryParameters: {'bookId': 'bk-cleancode'},
    );
    expect((after.data!['mine'] as Map)['verified'], isTrue);
  });

  test("saving recomputes the Book's rating; delete too", () async {
    final r = await save('bk-fiqh', 1);
    expect(r!['average'], 3.0);
    expect(rating('bk-fiqh'), 3.0);
    final d = await post('/reviews/delete', {'bookId': 'bk-fiqh'});
    expect(d!['count'], 1);
    expect(rating('bk-fiqh'), 5.0);
    expect(await post('/reviews/delete', {'bookId': 'bk-fiqh'}), isNull);
  });

  test('no stars, too long, or a banned reader is refused', () async {
    expect(await save('bk-sapiens', 0), isNull);
    expect(await save('bk-sapiens', 5, 'a' * 1001), isNull);
    api.stores.moderation.ban('me');
    expect(await save('bk-sapiens', 5), isNull);
  });
}
