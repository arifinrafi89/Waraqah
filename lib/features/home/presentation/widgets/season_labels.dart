import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/season.dart';

/// What each [Season] is called, in the current language.
extension SeasonLabels on AppL10n {
  String season(Season season) => switch (season) {
    Season.ramadan => homeSeasonRamadan,
    Season.boiMela => homeSeasonBoiMela,
    Season.admission => homeSeasonAdmission,
    Season.backToSchool => homeSeasonBackToSchool,
  };
}
