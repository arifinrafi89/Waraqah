import '../../domain/entities/banner.dart';
import '../models/banner_model.dart';

/// Offline Banners, in the order Home shows them.
abstract final class BannerFixtures {
  static const List<BannerModel> all = [
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
  ];
}
