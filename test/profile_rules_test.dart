import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/features/profile/domain/entities/profile_rules.dart';

void main() {
  test('a BD mobile is accepted in its three forms and stored as 01…', () {
    expect(ProfileRules.mobile('01712345678'), '01712345678');
    expect(ProfileRules.mobile('+8801712345678'), '01712345678');
    expect(ProfileRules.mobile('8801712345678'), '01712345678');
    expect(ProfileRules.mobile('017-1234 5678'), '01712345678');
  });

  test('other numbers are refused', () {
    expect(ProfileRules.mobile('01212345678'), isNull);
    expect(ProfileRules.mobile('0171234567'), isNull);
    expect(ProfileRules.mobile('1712345678'), isNull);
    expect(ProfileRules.mobile(''), isNull);
  });

  test('the name is 2–60 characters; the phone is optional', () {
    expect(ProfileRules.check('Nadia', ''), isNull);
    expect(ProfileRules.check('Nadia', '+8801712345678'), isNull);
    expect(ProfileRules.check(' N ', ''), ProfileProblem.nameLength);
    expect(ProfileRules.check('N' * 61, ''), ProfileProblem.nameLength);
    expect(ProfileRules.check('Nadia', '0121'), ProfileProblem.phone);
  });
}
