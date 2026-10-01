import 'package:flutter_test/flutter_test.dart';
import 'package:waraqah/core/models/book.dart';
import 'package:waraqah/core/models/edition.dart';
import 'package:waraqah/features/catalog_admin/domain/entities/book_draft.dart';
import 'package:waraqah/features/catalog_admin/domain/entities/catalog_admin_rules.dart';

const _pb = Edition(
  id: '',
  format: BookFormat.paperback,
  language: BookLanguage.bangla,
  priceBdt: 300,
  stock: 5,
);

const _draft = BookDraft(
  title: 'Shonar Tori',
  authorId: 'au-x',
  publisherId: 'pub-x',
  section: Section.literature,
  categoryId: 'cat-fiction',
  editions: [_pb],
);

Set<RuleError> _book(BookDraft d) =>
    CatalogAdminRules.book(d, categorySection: Section.literature);

Set<RuleError> _edition(Edition e, {List<Edition> siblings = const []}) =>
    CatalogAdminRules.edition(
      e,
      siblings: siblings,
      takenIsbns: {'9789840001774'},
    );

void main() {
  test('a full Book passes', () => expect(_book(_draft), isEmpty));

  test('a blank title is refused', () {
    expect(_book(_draft.copyWith(title: '  ')), {RuleError.titleBlank});
  });

  test('Author, Publisher and Category must be picked', () {
    expect(_book(_draft.copyWith(authorId: '', publisherId: '')), {
      RuleError.authorMissing,
      RuleError.publisherMissing,
    });
    expect(_book(_draft.copyWith(categoryId: '')), {RuleError.categoryMissing});
  });

  test("the Category must be in the Book's Section", () {
    expect(CatalogAdminRules.book(_draft, categorySection: Section.religious), {
      RuleError.categoryWrongSection,
    });
  });

  test('a Book needs an Edition', () {
    expect(_book(_draft.copyWith(editions: [])), {RuleError.noEditions});
  });

  test('price above 0, list price above price, stock not below 0', () {
    expect(_edition(_pb.copyWith(priceBdt: 0)), {RuleError.priceNotPositive});
    expect(_edition(_pb.copyWith(listPriceBdt: 300)), {
      RuleError.listPriceTooLow,
    });
    expect(_edition(_pb.copyWith(listPriceBdt: 350)), isEmpty);
    expect(_edition(_pb.copyWith(stock: -1)), {RuleError.stockNegative});
  });

  test('a bad ISBN check digit is refused', () {
    expect(_edition(_pb.copyWith(isbn: '9789840001775')), {
      RuleError.isbnInvalid,
    });
  });

  test('an ISBN-10 is stored as its ISBN-13', () {
    final tidy = CatalogAdminRules.tidy(_pb.copyWith(isbn: '0-306-40615-2'));
    expect(tidy.isbn, '9780306406157');
    expect(_edition(_pb.copyWith(isbn: '0306406152')), isEmpty);
  });

  test('an ISBN another Edition has is refused', () {
    expect(_edition(_pb.copyWith(isbn: '978-984-0001-774')), {
      RuleError.isbnTaken,
    });
    final sibling = _pb.copyWith(
      format: BookFormat.hardcover,
      isbn: '9780306406157',
    );
    expect(_edition(_pb.copyWith(isbn: '0306406152'), siblings: [sibling]), {
      RuleError.isbnTaken,
    });
  });

  test('one Edition per format and language', () {
    expect(_edition(_pb, siblings: [_pb]), {RuleError.editionTaken});
    final english = _pb.copyWith(language: BookLanguage.english);
    expect(_edition(english, siblings: [_pb]), isEmpty);
  });

  test('an eBook gets stock 999, no ISBN and no pre-order', () {
    final ebook = CatalogAdminRules.tidy(
      _pb.copyWith(format: BookFormat.ebook, isbn: '123', isPreorder: true),
    );
    expect((ebook.stock, ebook.isbn, ebook.isPreorder), (999, null, false));
    expect(_edition(ebook), isEmpty);
  });

  test('wholeBook checks every Edition against the others', () {
    expect(
      CatalogAdminRules.wholeBook(
        _draft.copyWith(editions: [_pb, _pb]),
        categorySection: Section.literature,
      ),
      {RuleError.editionTaken},
    );
  });
}
