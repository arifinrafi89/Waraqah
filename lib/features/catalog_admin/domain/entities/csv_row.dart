import '../../../../core/models/book.dart';
import '../../../../core/models/edition.dart';
import 'catalog_admin_rules.dart';
import 'catalog_record.dart';
import 'import_book.dart';

/// One CSV row read into an Edition and its Book's details.
typedef CsvRow = ({
  String title,
  String titleBn,
  String author,
  String publisher,
  Section section,
  String categoryId,
  Edition edition,
});

/// Reads the 12 [fields] of CSV row number [row], or says what's wrong. A
/// Section is its name or English label; a Category its id or name within
/// that Section, among [categories].
(CsvRow?, ImportError?) readCsvRow(
  int row,
  List<String> fields,
  List<CatalogRecord> categories,
) {
  if (fields.length != 12) return (null, ImportError(row, CsvProblem.columns));
  final [
    title,
    titleBn,
    author,
    publisher,
    sectionText,
    categoryText,
    formatText,
    languageText,
    priceText,
    listText,
    stockText,
    isbn,
  ] = [
    for (final f in fields) f.trim(),
  ];
  final section = Section.values
      .where((s) => _key(s.name) == _key(sectionText))
      .firstOrNull;
  final category = categories
      .where((c) => c.section == section)
      .where((c) => c.id == categoryText || c.isNamed(categoryText))
      .firstOrNull;
  final format = BookFormat.values.asNameMap()[formatText];
  final language = BookLanguage.values.asNameMap()[languageText];
  final price = int.tryParse(priceText);
  final stock = int.tryParse(stockText);
  final listPrice = int.tryParse(listText);
  (CsvRow?, ImportError?) fail(CsvProblem problem, [String value = '']) =>
      (null, ImportError(row, problem, value: value));
  if (title.isEmpty || author.isEmpty || publisher.isEmpty) {
    return fail(CsvProblem.blank);
  }
  if (section == null) return fail(CsvProblem.section, sectionText);
  if (category == null) return fail(CsvProblem.category, categoryText);
  if (format == null) return fail(CsvProblem.format, formatText);
  if (language == null) return fail(CsvProblem.language, languageText);
  if (price == null) return fail(CsvProblem.number, priceText);
  if (stock == null) return fail(CsvProblem.number, stockText);
  if (listText.isNotEmpty && listPrice == null) {
    return fail(CsvProblem.number, listText);
  }
  final edition = Edition(
    id: '',
    format: format,
    language: language,
    priceBdt: price,
    listPriceBdt: listPrice,
    stock: stock,
    isbn: isbn,
  );
  return (
    (
      title: title,
      titleBn: titleBn,
      author: author,
      publisher: publisher,
      section: section,
      categoryId: category.id!,
      edition: CatalogAdminRules.tidy(edition),
    ),
    null,
  );
}

/// "School & College" and `schoolCollege` both become `schoolcollege`.
String _key(String text) => text.toLowerCase().replaceAll(RegExp('[^a-z]'), '');
