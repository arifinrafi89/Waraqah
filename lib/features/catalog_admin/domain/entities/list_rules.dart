import 'catalog_admin_rules.dart';
import 'list_draft.dart';

/// What a Collection or Staff Booklist must satisfy, like
/// [CatalogAdminRules]: the builder shows these; the server refuses a list
/// that breaks any.
abstract final class ListRules {
  /// Most characters in each language's note.
  static const int noteMax = 300;

  static Set<RuleError> check(ListDraft d) => {
    if (d.titleEn.trim().isEmpty || d.titleBn.trim().isEmpty)
      RuleError.listTitleBlank,
    if (d.bookIds.isEmpty) RuleError.listNoBooks,
    if (d.bookIds.toSet().length < d.bookIds.length)
      RuleError.listDuplicateBook,
    if (d.noteEn.trim().length > noteMax || d.noteBn.trim().length > noteMax)
      RuleError.listNoteTooLong,
  };
}
