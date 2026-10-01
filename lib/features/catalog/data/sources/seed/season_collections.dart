import '../../models/collection_model.dart';
import '../../../../../core/models/book.dart';

/// One Collection per Season; each Season's hero card opens its own.
abstract final class SeasonCollections {
  static const List<CollectionModel> all = [
    CollectionModel(
      id: 'col-boi-mela',
      titleEn: 'Boi Mela picks',
      titleBn: 'বইমেলার বাছাই',
      noteEn:
          'Fair favourites you can read in Bangla, from fiction to history.',
      noteBn: 'মেলার প্রিয় বই, বাংলায় পড়া যায়: গল্প থেকে ইতিহাস।',
      bookIds: ['bk-hobbit', 'bk-sapiens', 'bk-zero'],
    ),
    CollectionModel(
      id: 'col-ramadan',
      section: Section.religious,
      titleEn: 'Ramadan reading',
      titleBn: 'রমজানের পাঠ',
      noteEn:
          'Tafsir for the nights, the Seerah for the days, and Hadith to '
          'carry with you.',
      noteBn: 'রাতের জন্য তাফসীর, দিনের জন্য সীরাত, আর সাথে রাখার জন্য হাদিস।',
      bookIds: ['bk-tafsir-ibnkathir', 'bk-nectar', 'bk-riyad'],
    ),
    CollectionModel(
      id: 'col-admission',
      section: Section.admissionJobPrep,
      titleEn: 'Admission season essentials',
      titleBn: 'ভর্তি মৌসুমের প্রস্তুতি',
      noteEn: 'The university test guide first, then BCS prep for later.',
      noteBn:
          'প্রথমে বিশ্ববিদ্যালয় ভর্তি গাইড, তারপর পরের জন্য বিসিএস প্রস্তুতি।',
      bookIds: ['bk-admission-guide', 'bk-bcs-guide'],
    ),
    CollectionModel(
      id: 'col-back-to-school',
      section: Section.schoolCollege,
      titleEn: 'Back to school',
      titleBn: 'স্কুলে ফেরা',
      noteEn: 'Maths and grammar to start the new year strong.',
      noteBn: 'নতুন বছর ভালোভাবে শুরু করতে গণিত ও ব্যাকরণ।',
      bookIds: ['bk-general-math', 'bk-english-grammar'],
    ),
  ];
}
