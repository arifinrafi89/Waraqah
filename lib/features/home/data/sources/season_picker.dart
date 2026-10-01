import '../../domain/entities/season.dart';
import 'season_fixtures.dart';

/// Which Season Home shows on a day. Fake-backend side: the Go backend will
/// own this.
abstract final class SeasonPicker {
  /// [override] when Staff set one; else Ramadan when [date] falls in it,
  /// else the month's Season; `null` outside every Season.
  static Season? activeOn(DateTime date, {Season? override}) {
    if (override != null) return override;
    final day = DateTime(date.year, date.month, date.day);
    final inRamadan = SeasonFixtures.ramadan.any(
      (w) => !day.isBefore(w.$1) && !day.isAfter(w.$2),
    );
    return inRamadan ? Season.ramadan : SeasonFixtures.byMonth[day.month];
  }
}
