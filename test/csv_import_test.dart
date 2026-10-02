import 'package:flutter_test/flutter_test.dart';
import 'package:waraqah/core/models/book.dart';
import 'package:waraqah/core/models/edition.dart';
import 'package:waraqah/features/catalog_admin/domain/entities/catalog_admin_rules.dart';
import 'package:waraqah/features/catalog_admin/domain/entities/catalog_record.dart';
import 'package:waraqah/features/catalog_admin/domain/entities/csv_import.dart';
import 'package:waraqah/features/catalog_admin/domain/entities/import_book.dart';

const _fiction = 'literature,Fiction,paperback,english';
const _fictionCat = CatalogRecord(
  id: 'cat-fiction',
  name: 'Fiction',
  section: Section.literature,
);

ImportPlan _parse(String rows, {Set<String> taken = const {}}) =>
    CsvImport.parse(
      '${CsvImport.header}\n$rows',
      categories: const [_fictionCat],
      authors: const [
        CatalogRecord(
          id: 'au-clear',
          name: 'James Clear',
          nameBn: 'জেমস ক্লিয়ার',
        ),
      ],
      publishers: const [
        CatalogRecord(id: 'pub-penguin', name: 'Penguin Classics'),
      ],
      takenIsbns: taken,
    );

void main() {
  test('quoted fields keep their commas, "" is one quote, blanks drop', () {
    final plan = _parse(
      '\n  \n'
      '"Thinking, Fast and Slow",,James Clear,Penguin Classics,$_fiction,500,,3,\n'
      '"The ""Best"" Book",,James Clear,Penguin Classics,$_fiction,400,,3,',
    );
    expect(plan.errors, isEmpty);
    expect(plan.books.map((b) => b.draft.title), [
      'Thinking, Fast and Slow',
      'The "Best" Book',
    ]);
  });

  test('rows with the same title and Author make one Book', () {
    final plan = _parse(
      'Atomic,,James Clear,Penguin Classics,$_fiction,500,,3,\n'
      'ATOMIC,,james clear,Penguin Classics,literature,cat-fiction,ebook,english,200,,0,',
    );
    expect(plan.books, hasLength(1));
    final editions = plan.books.single.draft.editions;
    expect(editions.map((e) => e.format), [
      BookFormat.paperback,
      BookFormat.ebook,
    ]);
    expect(editions.last.stock, CatalogAdminRules.ebookStock);
  });

  test('Authors match by either name; an unknown one is new', () {
    final plan = _parse(
      'A,,জেমস ক্লিয়ার,Penguin Classics,$_fiction,500,,3,\n'
      'B,,Nobody Yet,New House,$_fiction,500,,3,',
    );
    expect(plan.books.first.draft.authorId, 'au-clear');
    expect(plan.books.first.newAuthor, isFalse);
    expect(plan.books.last.newAuthor, isTrue);
    expect(plan.books.last.newPublisher, isTrue);
  });

  test(
    'an unknown Section, Category or format, or a bad number, is refused',
    () {
      final plan = _parse(
        'A,,X,Y,literature,Poetry,paperback,english,500,,3,\n'
        'B,,X,Y,Poems,Fiction,paperback,english,500,,3,\n'
        'C,,X,Y,nonFiction,Fiction,paperback,english,500,,3,\n'
        'D,,X,Y,$_fiction,abc,,3,\n'
        'E,,X,Y,literature,Fiction,scroll,english,500,,3,\n'
        'F,,X,Y,$_fiction,500\n'
        'G,,,Y,$_fiction,500,,3,',
      );
      expect(plan.books, isEmpty);
      expect(
        [for (final e in plan.errors) (e.row, e.problem, e.value)],
        [
          (1, CsvProblem.category, 'Poetry'),
          (2, CsvProblem.section, 'Poems'),
          (3, CsvProblem.category, 'Fiction'),
          (4, CsvProblem.number, 'abc'),
          (5, CsvProblem.format, 'scroll'),
          (6, CsvProblem.columns, ''),
          (7, CsvProblem.blank, ''),
        ],
      );
    },
  );

  test('an ISBN used in the paste or the catalog is refused', () {
    final plan = _parse(
      'A,,X,Y,$_fiction,500,,3,9789840004041\n'
      'B,,X,Y,$_fiction,500,,3,9780374533557\n'
      'C,,X,Y,$_fiction,500,,3,978-0-374-53355-7\n'
      'D,,X,Y,$_fiction,0,,3,',
      taken: {'9789840004041'},
    );
    expect(plan.books.map((b) => b.draft.title), ['B']);
    expect(
      [for (final e in plan.errors) (e.row, e.rule)],
      [
        (1, RuleError.isbnTaken),
        (3, RuleError.isbnTaken),
        (4, RuleError.priceNotPositive),
      ],
    );
  });
}
