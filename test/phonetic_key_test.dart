import 'package:flutter_test/flutter_test.dart';
import 'package:waraqah/features/catalog/data/sources/levenshtein.dart';
import 'package:waraqah/features/catalog/data/sources/phonetic_key.dart';

void main() {
  test('Bangla, Banglish and English spellings give one key', () {
    for (final spelling in ['sapiens', 'Sapiyens', 'স্যাপিয়েন্স']) {
      expect(PhoneticKey.of(spelling), 'spns', reason: spelling);
    }
  });

  test('known pairs meet', () {
    const pairs = [
      ('atomic habits', 'অ্যাটমিক হ্যাবিটস'),
      ('alkemist', 'alchemist'),
      ('rahik', 'raheeq'),
      ('humayun', 'হুমায়ূন'),
      ('zero to one', 'জিরো টু ওয়ান'),
      ('matilda', 'মাটিল্ডা'),
      ('sherlock', 'শার্লক'),
      ('bukhari', 'বুখারী'),
      ('hobbit', 'হবিট'),
      ('harry potter', 'হ্যারি পটার'),
      ('salihin', 'সালিহীন'),
      ('dhaka', 'ঢাকা'),
      ('harari', 'হারারি'),
      ('class 9', 'class ৯'),
    ];
    for (final (a, b) in pairs) {
      expect(PhoneticKey.of(a), PhoneticKey.of(b), reason: '$a / $b');
    }
  });

  test('punctuation breaks words; apostrophes vanish', () {
    expect(PhoneticKey.of('Sapiens: A Brief'), 'spns a brf');
    expect(PhoneticKey.of("O'Reilly"), PhoneticKey.of('oreilly'));
  });

  test('different books keep different keys', () {
    final keys = {
      for (final title in ['Sapiens', 'Satanic', 'Atomic Habits', 'Matilda'])
        PhoneticKey.of(title),
    };
    expect(keys, hasLength(4));
  });

  test('levenshtein counts single-letter edits', () {
    expect(levenshtein('spns', 'spnj'), 1);
    expect(levenshtein('', 'abc'), 3);
    expect(levenshtein('kitten', 'sitting'), 3);
  });
}
