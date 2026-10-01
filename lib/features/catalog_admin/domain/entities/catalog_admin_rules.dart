import '../../../../core/models/book.dart';
import '../../../../core/models/edition.dart';
import '../../../../core/models/section_academics.dart';
import '../../../home/domain/entities/banner.dart';
import '../../../scan/domain/entities/isbn.dart';
import 'book_draft.dart';
import 'catalog_record.dart';

/// One reason Staff's change can't be saved.
enum RuleError {
  titleBlank,
  authorMissing,
  publisherMissing,
  categoryMissing,
  categoryWrongSection,
  classNotAllowed,
  examNotAllowed,
  noEditions,
  priceNotPositive,
  listPriceTooLow,
  stockNegative,
  isbnInvalid,
  isbnTaken,
  editionTaken,
  nameBlank,
  nameBnBlank,
  bannerTitleBlank,
  bannerTargetBlank,
  listTitleBlank,
  listNoBooks,
  listDuplicateBook,
  listNoteTooLong,
}

/// What a catalog change must satisfy. The form shows these inline; the
/// server refuses a change that breaks any of them.
abstract final class CatalogAdminRules {
  static const int ebookStock = 999; // eBooks never run out.

  /// Problems with a Book's details. [categorySection] is the picked
  /// Category's Section. Classes and Exams must be ones its Section offers.
  static Set<RuleError> book(BookDraft draft, {Section? categorySection}) => {
    if (draft.title.trim().isEmpty) RuleError.titleBlank,
    if (draft.authorId.isEmpty) RuleError.authorMissing,
    if (draft.publisherId.isEmpty) RuleError.publisherMissing,
    if (draft.categoryId.isEmpty)
      RuleError.categoryMissing
    else if (categorySection != draft.section)
      RuleError.categoryWrongSection,
    if (draft.editions.isEmpty) RuleError.noEditions,
    if (!draft.classes.every(draft.section.classLevels.contains))
      RuleError.classNotAllowed,
    if (!draft.exams.every(draft.section.allowedExams.contains))
      RuleError.examNotAllowed,
  };

  /// [edition] as it's stored: an eBook has stock 999, no ISBN and no
  /// pre-order; a valid ISBN becomes its ISBN-13.
  static Edition tidy(Edition edition) {
    if (edition.format == BookFormat.ebook) {
      return edition.copyWith(stock: ebookStock, isbn: null, isPreorder: false);
    }
    final raw = edition.isbn?.trim() ?? '';
    return edition.copyWith(
      isbn: raw.isEmpty ? null : Isbn.normalize(raw) ?? raw,
    );
  }

  /// Problems with one Edition. [siblings] are the Book's other Editions;
  /// [takenIsbns] the ISBNs of every other Book's Editions.
  static Set<RuleError> edition(
    Edition edition, {
    Iterable<Edition> siblings = const [],
    Set<String> takenIsbns = const {},
  }) {
    final e = tidy(edition);
    final isbn = e.isbn;
    return {
      if (e.priceBdt <= 0) RuleError.priceNotPositive,
      if (e.listPriceBdt != null && e.listPriceBdt! <= e.priceBdt)
        RuleError.listPriceTooLow,
      if (e.stock < 0) RuleError.stockNegative,
      if (isbn != null && Isbn.normalize(isbn) == null) RuleError.isbnInvalid,
      if (isbn != null &&
          (takenIsbns.contains(isbn) ||
              siblings.any((s) => tidy(s).isbn == isbn)))
        RuleError.isbnTaken,
      if (siblings.any((s) => s.format == e.format && s.language == e.language))
        RuleError.editionTaken,
    };
  }

  /// Every problem with a whole Book: its details and each Edition.
  static Set<RuleError> wholeBook(
    BookDraft draft, {
    Section? categorySection,
    Set<String> takenIsbns = const {},
  }) => {
    ...book(draft, categorySection: categorySection),
    for (final (i, e) in draft.editions.indexed)
      ...edition(
        e,
        siblings: [...draft.editions.take(i), ...draft.editions.skip(i + 1)],
        takenIsbns: takenIsbns,
      ),
  };

  /// A Category needs both names; an Author or Publisher an English one.
  static Set<RuleError> record(RecordKind kind, CatalogRecord record) => {
    if (record.name.trim().isEmpty) RuleError.nameBlank,
    if (kind == RecordKind.category && record.nameBn.trim().isEmpty)
      RuleError.nameBnBlank,
  };

  static Set<RuleError> banner(Banner banner) => {
    if (banner.titleEn.trim().isEmpty || banner.titleBn.trim().isEmpty)
      RuleError.bannerTitleBlank,
    if (banner.target.value.trim().isEmpty) RuleError.bannerTargetBlank,
  };
}
