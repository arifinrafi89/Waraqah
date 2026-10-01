import '../../domain/entities/banner.dart';
import '../../domain/entities/season.dart';
import '../models/banner_model.dart';

/// Offline Banners, in the order Home shows them. Season Banners show only
/// in their Season.
// ponytail: in-place fixture lists; the Go backend owns the catalog.
abstract final class BannerFixtures {
  /// Staff's admin edits change this list in place.
  static final List<BannerModel> all = [..._seed];

  /// Back to the seed. Each new fake backend starts here.
  static void reset() => all
    ..clear()
    ..addAll(_seed);

  static const List<BannerModel> _seed = [
    BannerModel(
      id: 'ban-hadith',
      titleEn: 'Hadith collections',
      titleBn: 'হাদিস সংকলন',
      subtitleEn: 'Where to start, picked by our team',
      subtitleBn: 'কোথা থেকে শুরু করবেন, আমাদের বাছাই',
      seed: 3,
      target: BannerTargetModel(
        kind: BannerTargetKind.collection,
        value: 'col-hadith',
      ),
    ),
    BannerModel(
      id: 'ban-admission',
      titleEn: 'Admission season',
      titleBn: 'ভর্তি মৌসুম',
      subtitleEn: 'Question banks and guides for every test',
      subtitleBn: 'প্রতিটি পরীক্ষার প্রশ্নব্যাংক ও গাইড',
      seed: 0,
      target: BannerTargetModel(
        kind: BannerTargetKind.section,
        value: 'admissionJobPrep',
      ),
    ),
    BannerModel(
      id: 'ban-sapiens-bn',
      titleEn: 'Sapiens, now in Bangla',
      titleBn: 'স্যাপিয়েন্স, এখন বাংলায়',
      subtitleEn: 'The history of humankind, in your language',
      subtitleBn: 'মানবজাতির ইতিহাস, আপনার ভাষায়',
      seed: 5,
      target: BannerTargetModel(
        kind: BannerTargetKind.book,
        value: 'bk-sapiens',
      ),
    ),
    BannerModel(
      id: 'ban-ramadan',
      titleEn: 'Ramadan Mubarak',
      titleBn: 'রমজান মোবারক',
      subtitleEn: 'Books for the blessed month',
      subtitleBn: 'বরকতময় মাসের বই',
      seed: 3,
      season: Season.ramadan,
      target: BannerTargetModel(
        kind: BannerTargetKind.collection,
        value: 'col-ramadan',
      ),
    ),
    BannerModel(
      id: 'ban-boi-mela',
      titleEn: 'Boi Mela picks',
      titleBn: 'বইমেলার বাছাই',
      subtitleEn: 'Fair favourites, now in stock',
      subtitleBn: 'মেলার প্রিয় বই, এখন স্টকে',
      seed: 1,
      season: Season.boiMela,
      target: BannerTargetModel(
        kind: BannerTargetKind.collection,
        value: 'col-boi-mela',
      ),
    ),
    BannerModel(
      id: 'ban-admission-season',
      titleEn: 'Admission season is here',
      titleBn: 'ভর্তি মৌসুম এসে গেছে',
      subtitleEn: 'Everything for the tests, in one place',
      subtitleBn: 'ভর্তি পরীক্ষার সব বই এক জায়গায়',
      seed: 4,
      season: Season.admission,
      target: BannerTargetModel(
        kind: BannerTargetKind.collection,
        value: 'col-admission',
      ),
    ),
    BannerModel(
      id: 'ban-back-to-school',
      titleEn: 'Back to school',
      titleBn: 'স্কুলে ফেরা',
      subtitleEn: 'Class books for the new year',
      subtitleBn: 'নতুন বছরের ক্লাসের বই',
      seed: 2,
      season: Season.backToSchool,
      target: BannerTargetModel(
        kind: BannerTargetKind.collection,
        value: 'col-back-to-school',
      ),
    ),
  ];
}
