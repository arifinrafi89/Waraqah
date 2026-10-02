import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/features/bites/domain/entities/bite_rules.dart';

void main() {
  test('a Bite is 1–500 characters', () {
    expect(BiteRules.check('a' * 500), isNull);
    expect(BiteRules.check('a' * 501), BiteProblem.tooLong);
    expect(BiteRules.check('   '), BiteProblem.empty);
  });

  test('a Bangla conjunct counts as one character', () {
    expect(BiteRules.length('ক্ষ' * 3), 3);
    expect(BiteRules.check('ক্ষ' * 500), isNull);
    expect(BiteRules.check('ক্ষ' * 501), BiteProblem.tooLong);
  });

  test('a spoiler needs a book tag', () {
    expect(BiteRules.check('x', spoiler: true), BiteProblem.spoilerNeedsBook);
    expect(BiteRules.check('x', spoiler: true, bookId: 'bk-1'), isNull);
  });

  test('a comment is 1–300 characters', () {
    expect(BiteRules.checkComment('a' * 300), isNull);
    expect(BiteRules.checkComment('a' * 301), BiteProblem.tooLong);
    expect(BiteRules.checkComment(''), BiteProblem.empty);
  });
}
