import '../../../../core/models/book.dart';
import '../models/collection_model.dart';

/// Offline Collections, in the order Home shows them.
// ponytail: in-place fixture lists; the Go backend owns the catalog.
abstract final class CollectionFixtures {
  /// Staff's admin edits change this list in place.
  static final List<CollectionModel> all = [..._seed];

  /// Back to the seed. Each new fake backend starts here.
  static void reset() => all
    ..clear()
    ..addAll(_seed);

  static const List<CollectionModel> _seed = [
    CollectionModel(
      id: 'col-seerah-beginners',
      section: Section.religious,
      titleEn: 'Seerah for beginners',
      titleBn: 'নতুনদের জন্য সীরাত',
      noteEn:
          "Start with The Sealed Nectar for the whole story, then Lings' "
          'warm retelling, then the short story of the moon splitting.',
      noteBn:
          'পুরো জীবনী জানতে আর-রাহীকুল মাখতুম দিয়ে শুরু করুন, তারপর লিংসের '
          'সাবলীল বর্ণনা, তারপর চাঁদ দ্বিখণ্ডিত হওয়ার ছোট গল্পটি।',
      bookIds: ['bk-nectar', 'bk-lings-muhammad', 'bk-moon-split'],
    ),
    CollectionModel(
      id: 'col-hadith',
      section: Section.religious,
      titleEn: 'Hadith collections',
      titleBn: 'হাদিস সংকলন',
      noteEn:
          'The most trusted collection first, then two shorter ones '
          'arranged by topic for daily reading.',
      noteBn:
          'প্রথমে সবচেয়ে নির্ভরযোগ্য সংকলন, তারপর প্রতিদিন পড়ার জন্য '
          'বিষয়ভিত্তিক দুটি ছোট সংকলন।',
      bookIds: ['bk-bukhari', 'bk-riyad', 'bk-adabmufrad'],
    ),
    CollectionModel(
      id: 'col-purifying-heart',
      section: Section.religious,
      titleEn: 'Purifying the heart',
      titleBn: 'আত্মশুদ্ধি',
      noteEn:
          'Classics on character and the inner life, read slowly and '
          'one chapter at a time.',
      noteBn:
          'চরিত্র ও অন্তরের জীবন নিয়ে ক্লাসিক বই, ধীরে ধীরে এক অধ্যায় করে '
          'পড়ার জন্য।',
      bookIds: ['bk-ihya', 'bk-madarij', 'bk-adabmufrad'],
    ),
    CollectionModel(
      id: 'col-start-here',
      titleEn: 'Start with these',
      titleBn: 'এগুলো দিয়ে শুরু করুন',
      noteEn: 'Four easy, much-loved reads for anyone getting back into books.',
      noteBn: 'যারা আবার বই পড়া শুরু করছেন, তাদের জন্য চারটি সহজ ও প্রিয় বই।',
      bookIds: ['bk-atomic', 'bk-sapiens', 'bk-zero', 'bk-hobbit'],
    ),
    CollectionModel(
      id: 'col-programmers',
      titleEn: 'For programmers',
      titleBn: 'প্রোগ্রামারদের জন্য',
      noteEn:
          'Write clean code, work like a professional, then learn how '
          'real systems store and move data.',
      noteBn:
          'পরিষ্কার কোড লিখুন, পেশাদারের মতো কাজ করুন, তারপর শিখুন বাস্তব '
          'সিস্টেম কীভাবে ডেটা রাখে ও আদান-প্রদান করে।',
      bookIds: ['bk-cleancode', 'bk-pragmatic', 'bk-ddia'],
    ),
  ];
}
