import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/features/profile/domain/entities/address_rules.dart';
import 'package:waraqah/features/profile/domain/entities/saved_address.dart';

const _ok = SavedAddress(
  label: 'Home',
  recipient: 'Nadia',
  phone: '+8801712345678',
  line: 'House 1, Road 2',
  upazila: 'Savar',
  district: 'Dhaka',
  division: 'Dhaka',
);

void main() {
  test('a complete address passes and is tidied', () {
    expect(AddressRules.check(_ok), isNull);
    expect(AddressRules.tidy(_ok).phone, '01712345678');
  });

  test('blank fields are refused, in the editor order', () {
    expect(AddressRules.check(_ok.copyWith(label: ' ')), AddressProblem.label);
    expect(
      AddressRules.check(_ok.copyWith(recipient: '')),
      AddressProblem.recipient,
    );
    expect(AddressRules.check(_ok.copyWith(line: '  ')), AddressProblem.line);
  });

  test('the phone must be a BD mobile', () {
    expect(
      AddressRules.check(_ok.copyWith(phone: '01212345678')),
      AddressProblem.phone,
    );
    expect(
      AddressRules.check(_ok.copyWith(phone: '0171234567')),
      AddressProblem.phone,
    );
  });

  test('division, district and upazila are all picked', () {
    expect(AddressRules.check(_ok.copyWith(upazila: '')), AddressProblem.place);
    expect(
      AddressRules.check(_ok.copyWith(division: '')),
      AddressProblem.place,
    );
  });
}
