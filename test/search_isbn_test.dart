import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waraqah/app/fake_api_routes.dart';
import 'package:waraqah/core/models/edition.dart';
import 'package:waraqah/features/catalog/data/sources/book_fake_api.dart';
import 'package:waraqah/features/catalog/data/sources/book_fixtures.dart';

Future<List<String>> _search(String q) async {
  final dio = Dio()..interceptors.add(FakeApiRoutes.interceptor());
  final res = await dio.get<List<dynamic>>(
    BookFakeApi.books,
    queryParameters: {'q': q},
  );
  return [for (final b in res.data!) (b as Map)['id'] as String];
}

bool _validIsbn13(String s) {
  if (!RegExp(r'^\d{13}$').hasMatch(s)) return false;
  var sum = 0;
  for (var i = 0; i < 13; i++) {
    sum += int.parse(s[i]) * (i.isEven ? 1 : 3);
  }
  return sum % 10 == 0;
}

void main() {
  final editions = [for (final b in BookFixtures.all) ...b.editions];

  test('printed Editions have a valid unique ISBN-13; eBooks have none', () {
    final printed = editions.where((e) => e.format != BookFormat.ebook);
    expect(printed.every((e) => _validIsbn13(e.isbn ?? '')), isTrue);
    expect({for (final e in printed) e.isbn}.length, printed.length);
    expect(
      editions
          .where((e) => e.format == BookFormat.ebook)
          .every((e) => e.isbn == null),
      isTrue,
    );
  });

  test(
    'a full ISBN finds only its Book: plain, hyphenated or spaced',
    () async {
      final book = BookFixtures.all.firstWhere(
        (b) => b.editions.any((e) => e.isbn != null),
      );
      final isbn = book.editions.firstWhere((e) => e.isbn != null).isbn!;
      final hyphenated =
          '${isbn.substring(0, 3)}-${isbn.substring(3, 6)}-'
          '${isbn.substring(6, 12)}-${isbn.substring(12)}';
      final spaced = ' ${hyphenated.replaceAll('-', ' ')} ';

      for (final q in [isbn, hyphenated, spaced]) {
        expect(await _search(q), [book.id]);
      }
    },
  );

  test('a partial ISBN matches nothing', () async {
    final isbn = editions.firstWhere((e) => e.isbn != null).isbn!;
    expect(await _search(isbn.substring(0, 12)), isEmpty);
    expect(await _search(isbn.substring(3)), isEmpty);
  });
}
