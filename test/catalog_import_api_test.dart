import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waraqah/app/fake_api_routes.dart';
import 'package:waraqah/core/models/book.dart';
import 'package:waraqah/core/models/edition.dart';
import 'package:waraqah/features/catalog/data/sources/author_fixtures.dart';
import 'package:waraqah/features/catalog/data/sources/book_fixtures.dart';
import 'package:waraqah/features/catalog_admin/data/sources/catalog_tools_remote_source.dart';
import 'package:waraqah/features/catalog_admin/domain/entities/book_draft.dart';
import 'package:waraqah/features/catalog_admin/domain/entities/import_book.dart';

late CatalogToolsRemoteSource _tools;

void main() {
  tearDown(BookFixtures.reset);
  setUp(
    () => _tools = CatalogToolsRemoteSource(
      Dio()..interceptors.add(FakeApiRoutes.interceptor()),
    ),
  );

  test('import adds Books and new Authors, and skips refused ones', () async {
    ImportBook book(String title, String author, String category) => ImportBook(
      row: 1,
      author: author,
      publisher: 'Penguin Classics',
      draft: BookDraft(
        title: title,
        section: Section.literature,
        categoryId: category,
        editions: const [
          Edition(
            id: '',
            format: BookFormat.paperback,
            language: BookLanguage.english,
            priceBdt: 400,
            stock: 3,
          ),
        ],
      ),
    );
    final result = await _tools.importBooks([
      book('New Novel', 'New Writer', 'cat-fiction'),
      // A Category from another Section: refused, and its Author with it.
      book('Bad Novel', 'Other Writer', 'cat-self-help'),
    ]);
    expect(result, (imported: 1, skipped: 1));
    final added = BookFixtures.all.singleWhere((b) => b.title == 'New Novel');
    expect(added.author, 'New Writer');
    expect(added.publisherId, 'pub-penguin');
    final names = AuthorFixtures.all.map((a) => a.name);
    expect(names, contains('New Writer'));
    expect(names, isNot(contains('Other Writer')));
  });
}
