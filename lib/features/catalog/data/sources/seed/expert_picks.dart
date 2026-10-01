import '../../../../../core/models/book.dart';
import '../../models/collection_model.dart';

/// One Expert Pick per Expert, each note in that Expert's own voice.
abstract final class ExpertPicks {
  static const List<CollectionModel> all = [
    CollectionModel(
      id: 'col-exp-hsc-maths',
      expertId: 'exp-tanvir-physics',
      section: Section.schoolCollege,
      titleEn: 'Maths before HSC physics',
      titleBn: 'এইচএসসি পদার্থবিজ্ঞানের আগে গণিত',
      noteEn:
          'Most of my students struggle with the maths, not the physics. '
          'Fix the basics, then calculus, and build the habit of daily practice.',
      noteBn:
          'আমার বেশিরভাগ ছাত্রছাত্রী পদার্থবিজ্ঞানে নয়, গণিতে আটকে যায়। আগে '
          'ভিত্তি ঠিক করুন, তারপর ক্যালকুলাস, আর প্রতিদিন অনুশীলনের অভ্যাস।',
      bookIds: ['bk-general-math', 'bk-calculus', 'bk-atomic'],
    ),
    CollectionModel(
      id: 'col-exp-first-shelf',
      expertId: 'exp-mahmudul-scholar',
      section: Section.religious,
      titleEn: 'A first Islamic shelf',
      titleBn: 'প্রথম ইসলামি বইয়ের তাক',
      noteEn:
          'I give these four to every new student: the Quran explained, daily '
          'hadith, the fiqh of worship, and Ibn Khaldun to see history whole.',
      noteBn:
          'প্রত্যেক নতুন ছাত্রকে আমি এই চারটি দিই: কুরআনের ব্যাখ্যা, প্রতিদিনের '
          'হাদিস, ইবাদতের ফিকহ, আর পুরো ইতিহাস বুঝতে ইবনে খালদুন।',
      bookIds: ['bk-tafsir-ibnkathir', 'bk-riyad', 'bk-fiqh', 'bk-muqaddimah'],
    ),
    CollectionModel(
      id: 'col-exp-stories',
      expertId: 'exp-shirin-novelist',
      section: Section.literature,
      titleEn: 'Stories that made me a writer',
      titleBn: 'যে গল্পগুলো আমাকে লেখক বানিয়েছে',
      noteEn:
          'I read these as a girl in Rajshahi and never stopped. Each one '
          'taught me something about how a story pulls you forward.',
      noteBn:
          'রাজশাহীতে ছোটবেলায় এগুলো পড়েছি, আজও পড়ি। প্রতিটি বই শিখিয়েছে গল্প '
          'কীভাবে পাঠককে সামনে টেনে নেয়।',
      bookIds: ['bk-hobbit', 'bk-sherlock', 'bk-matilda', 'bk-davinci'],
    ),
    CollectionModel(
      id: 'col-exp-bcs-start',
      expertId: 'exp-arif-bcs',
      section: Section.admissionJobPrep,
      titleEn: 'Where I start every BCS batch',
      titleBn: 'প্রতিটি বিসিএস ব্যাচ যেখান থেকে শুরু করি',
      noteEn:
          'The guide for the syllabus, grammar and maths for the marks most '
          'people lose, and Sapiens for the written part.',
      noteBn:
          'সিলেবাসের জন্য গাইড, যেখানে সবাই নম্বর হারায় সেই ব্যাকরণ ও গণিত, '
          'আর লিখিত অংশের জন্য স্যাপিয়েন্স।',
      bookIds: [
        'bk-bcs-guide',
        'bk-english-grammar',
        'bk-general-math',
        'bk-sapiens',
      ],
    ),
  ];
}
