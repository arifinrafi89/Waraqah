import '../../../../core/models/edition.dart';
import 'book_draft.dart';
import 'catalog_admin_rules.dart';

/// One Book a CSV paste adds: its draft from the first CSV [row], and its
/// Author and Publisher names. An empty `authorId` or `publisherId` in
/// [draft] means that one is new and is created on import.
class ImportBook {
  const ImportBook({
    required this.row,
    required this.draft,
    required this.author,
    required this.publisher,
  });

  final int row;
  final BookDraft draft;
  final String author;
  final String publisher;

  bool get newAuthor => draft.authorId.isEmpty;
  bool get newPublisher => draft.publisherId.isEmpty;

  ImportBook withEdition(Edition edition) => ImportBook(
    row: row,
    draft: draft.copyWith(editions: [...draft.editions, edition]),
    author: author,
    publisher: publisher,
  );
}

/// Why a CSV row can't be imported. [CsvProblem.rule] is an Edition that
/// breaks a `CatalogAdminRules` rule.
enum CsvProblem {
  columns,
  blank,
  section,
  category,
  format,
  language,
  number,
  rule,
}

/// A CSV row that can't be imported, with the text at fault.
class ImportError {
  const ImportError(this.row, this.problem, {this.value = '', this.rule});

  final int row;
  final CsvProblem problem;
  final String value;
  final RuleError? rule;
}

/// A checked CSV paste: the Books to add and the rows left out.
typedef ImportPlan = ({List<ImportBook> books, List<ImportError> errors});

/// What the server did with an import.
typedef ImportResult = ({int imported, int skipped});
