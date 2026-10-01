import 'book_draft.dart';
import 'catalog_admin_rules.dart';
import 'catalog_record.dart';
import 'csv_row.dart';
import 'csv_rows.dart';
import 'import_book.dart';

/// Reads a CSV paste of Editions into Books for Staff to import. One row is
/// one Edition; rows with the same title and Author make one Book.
abstract final class CsvImport {
  static const String header =
      'title,titleBn,author,publisher,section,category,format,language,'
      'price,listPrice,stock,isbn';

  /// Checks every row (see [readCsvRow]) and every Edition rule, against
  /// the catalog's records and the ISBNs it already has. An Author or
  /// Publisher is matched by English or Bangla name, else it's new.
  static ImportPlan parse(
    String text, {
    required List<CatalogRecord> categories,
    required List<CatalogRecord> authors,
    required List<CatalogRecord> publishers,
    Set<String> takenIsbns = const {},
  }) {
    final rows = csvRows(text);
    if (rows.isNotEmpty &&
        rows.first.map((f) => f.trim()).join(',') == header) {
      rows.removeAt(0);
    }
    final books = <String, ImportBook>{};
    final errors = <ImportError>[];
    final isbns = {...takenIsbns};
    for (final (i, fields) in rows.indexed) {
      final (read, error) = readCsvRow(i + 1, fields, categories);
      if (read == null) {
        errors.add(error!);
        continue;
      }
      final key = '${read.title.toLowerCase()}|${read.author.toLowerCase()}';
      final book = books[key];
      final broken = CatalogAdminRules.edition(
        read.edition,
        siblings: book?.draft.editions ?? const [],
        takenIsbns: isbns,
      );
      if (broken.isNotEmpty) {
        errors.add(ImportError(i + 1, CsvProblem.rule, rule: broken.first));
        continue;
      }
      if (read.edition.isbn case final isbn?) isbns.add(isbn);
      books[key] =
          book?.withEdition(read.edition) ??
          ImportBook(
            row: i + 1,
            author: read.author,
            publisher: read.publisher,
            draft: BookDraft(
              title: read.title,
              titleBn: read.titleBn,
              authorId: _idOf(authors, read.author),
              publisherId: _idOf(publishers, read.publisher),
              section: read.section,
              categoryId: read.categoryId,
              originalLanguage: read.edition.language,
              editions: [read.edition],
            ),
          );
    }
    return (books: books.values.toList(), errors: errors);
  }

  static String _idOf(List<CatalogRecord> records, String name) =>
      records.where((r) => r.isNamed(name)).firstOrNull?.id ?? '';

  /// Four rows for a demo: three Books to add, and a Category that isn't
  /// in Literature.
  static const String example =
      '$header\n'
      'Deep Work,,Cal Newport,Grand Central,nonFiction,Self-Help,'
      'paperback,english,650,750,12,9781455586691\n'
      '"Thinking, Fast and Slow",,Daniel Kahneman,'
      '"Farrar, Straus and Giroux",Non-fiction,cat-self-help,'
      'paperback,english,890,,8,9780374533557\n'
      'SSC Physics Test Papers,এসএসসি পদার্থবিজ্ঞান টেস্ট পেপার,'
      'Waraqah Editorial Board,Waraqah Press,School & College,'
      'Guides & Grammar,paperback,bangla,380,,25,\n'
      'Gitanjali,গীতাঞ্জলি,Rabindranath Tagore,Visva-Bharati,literature,'
      'Poetry,paperback,bangla,300,,10,';
}
