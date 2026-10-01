import '../../domain/entities/season.dart';
import '../models/season_model.dart';

/// When each Season runs, and what its hero card says.
// ponytail: Ramadan seeded to 2028; the Go backend owns the calendar.
abstract final class SeasonFixtures {
  /// Ramadan moves about 11 days a year, so each year is listed (both ends
  /// included).
  static final List<(DateTime, DateTime)> ramadan = [
    (DateTime(2026, 2, 18), DateTime(2026, 3, 19)),
    (DateTime(2027, 2, 8), DateTime(2027, 3, 9)),
    (DateTime(2028, 1, 28), DateTime(2028, 2, 26)),
  ];

  /// The other Seasons fill whole months, every year.
  static const Map<int, Season> byMonth = {
    1: Season.backToSchool,
    2: Season.boiMela,
    10: Season.admission,
    11: Season.admission,
    12: Season.admission,
  };

  static const Map<Season, SeasonModel> info = {
    Season.ramadan: SeasonModel(
      season: Season.ramadan,
      titleEn: 'Ramadan reading',
      titleBn: 'রমজানের পাঠ',
      subtitleEn: 'Quran, Seerah and Hadith for the blessed month',
      subtitleBn: 'বরকতময় মাসের জন্য কুরআন, সীরাত ও হাদিস',
      seed: 3,
      collectionId: 'col-ramadan',
    ),
    Season.boiMela: SeasonModel(
      season: Season.boiMela,
      titleEn: 'Boi Mela is here',
      titleBn: 'বইমেলা চলছে',
      subtitleEn: 'This year’s fair picks, in Bangla',
      subtitleBn: 'এ বছরের মেলার বাছাই বই, বাংলায়',
      seed: 1,
      collectionId: 'col-boi-mela',
    ),
    Season.admission: SeasonModel(
      season: Season.admission,
      titleEn: 'Admission season',
      titleBn: 'ভর্তি মৌসুম',
      subtitleEn: 'Guides and question banks for every test',
      subtitleBn: 'প্রতিটি ভর্তি পরীক্ষার গাইড ও প্রশ্নব্যাংক',
      seed: 0,
      collectionId: 'col-admission',
    ),
    Season.backToSchool: SeasonModel(
      season: Season.backToSchool,
      titleEn: 'Back to school',
      titleBn: 'স্কুলে ফেরা',
      subtitleEn: 'Textbooks and grammar for the new year',
      subtitleBn: 'নতুন বছরের পাঠ্যবই ও ব্যাকরণ',
      seed: 2,
      collectionId: 'col-back-to-school',
    ),
  };
}
