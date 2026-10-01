import 'package:flutter_test/flutter_test.dart';
import 'package:waraqah/features/home/data/sources/season_picker.dart';
import 'package:waraqah/features/home/domain/entities/season.dart';

void main() {
  test('one Season by date, Ramadan first', () {
    final cases = {
      DateTime(2027, 2, 10): Season.ramadan, // beats Boi Mela
      DateTime(2026, 3, 19): Season.ramadan, // last day counts
      DateTime(2026, 2, 5): Season.boiMela,
      DateTime(2026, 1, 10): Season.backToSchool,
      DateTime(2026, 11, 1): Season.admission,
      DateTime(2026, 6, 1): null,
    };
    cases.forEach((date, season) {
      expect(SeasonPicker.activeOn(date), season, reason: '$date');
    });
  });

  test("Staff's override beats the date; null means automatic", () {
    final june = DateTime(2026, 6, 1);
    expect(
      SeasonPicker.activeOn(june, override: Season.boiMela),
      Season.boiMela,
    );
    expect(
      SeasonPicker.activeOn(DateTime(2026, 11, 1), override: null),
      Season.admission,
    );
  });
}
