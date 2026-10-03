import '../../../../core/models/book.dart';
import '../../../../core/models/edition.dart';
import 'assistant_intent.dart';

/// Reads a prompt in plain English, Banglish or Bangla: "short seerah for
/// beginners in Bangla", "Books for Class 9 under ৳1,000", "৫০০ টাকার
/// নিচে বই".
abstract final class AssistantParser {
  static const _digits = '০১২৩৪৫৬৭৮৯';

  static AssistantIntent parse(String prompt, List<String> history) {
    final text = _normalize(prompt);
    bool has(List<String> terms) => terms.any(text.contains);
    final maxPrice = _price(text);
    final classLevel = _classLevel(text);
    final exam = switch (true) {
      _ when has(['ssc', 'এসএসসি']) => Exam.ssc,
      _ when has(['hsc', 'এইচএসসি']) => Exam.hsc,
      _ when has(['admission', 'ভর্তি']) => Exam.admission,
      _ when has(['bcs', 'বিসিএস']) => Exam.bcs,
      _ => null,
    };
    final language = switch (true) {
      _ when has(['bangla', 'bengali', 'বাংলা']) => BookLanguage.bangla,
      _ when has(['english', 'ইংরেজি']) => BookLanguage.english,
      _ when has(['arabic', 'আরবি']) => BookLanguage.arabic,
      _ => null,
    };
    final format = switch (true) {
      _ when has(['ebook', 'e-book', 'ই-বুক']) => BookFormat.ebook,
      _ when has(['hardcover', 'hard cover']) => BookFormat.hardcover,
      _ when has(['paperback']) => BookFormat.paperback,
      _ => null,
    };
    final author = RegExp(r'\bby\s+(.+)$').firstMatch(prompt.trim());
    final kind = switch (true) {
      _ when has(['quran', "qur'an", 'tafsir', 'কুরআন', 'তাফসির']) =>
        AssistantIntentKind.quran,
      _ when has(['hadith', 'hadees', 'হাদিস']) => AssistantIntentKind.hadith,
      _ when has(['seerah', 'sirah', 'prophet', 'সীরাহ', 'সিরাত']) =>
        AssistantIntentKind.seerah,
      _ when has(['islamic history', 'muslim history', 'ইসলামের ইতিহাস']) =>
        AssistantIntentKind.islamicHistory,
      _ when has(['fiqh', 'aqeedah', 'islamic studies']) =>
        AssistantIntentKind.islamicStudies,
      _ when has(['islam', 'muslim', 'ইসলাম']) =>
        AssistantIntentKind.islamicRecommendations,
      _ when author != null => AssistantIntentKind.authorSearch,
      _ when classLevel != null || exam != null => AssistantIntentKind.academic,
      _ when maxPrice != null => AssistantIntentKind.priceFilteredSearch,
      _
          when has(['book', 'read', 'suggest', 'recommend', 'বই']) ||
              language != null ||
              format != null =>
        AssistantIntentKind.generalRecommendations,
      _
          when has(['more', 'another', 'আরও']) &&
              history.any((h) => _normalize(h).contains('book')) =>
        AssistantIntentKind.generalRecommendations,
      _ => AssistantIntentKind.other,
    };
    return AssistantIntent(
      kind: kind,
      query: author?.group(1)?.trim() ?? '',
      maxPrice: maxPrice,
      classLevel: classLevel,
      exam: exam,
      language: language,
      format: format,
      basket:
          classLevel != null ||
          exam != null ||
          has(['basket', 'list', 'all books', 'সব বই', 'তালিকা']),
    );
  }

  /// Lower case, Bangla digits as ASCII, and "1,000" as "1000".
  static String _normalize(String s) {
    final out = StringBuffer();
    for (final ch in s.toLowerCase().split('')) {
      final i = _digits.indexOf(ch);
      out.write(i < 0 ? ch : '$i');
    }
    return out.toString().replaceAllMapped(
      RegExp(r'(\d),(\d{3})'),
      (m) => '${m[1]}${m[2]}',
    );
  }

  static int? _price(String text) {
    final before = RegExp(
      r'(?:under|below|less than|within|up to|max)\s*(?:৳|tk|taka|bdt)?\s*(\d+)',
    ).firstMatch(text);
    final after = RegExp(
      r'(\d+)\s*(?:৳|tk|taka|টাকা)?\s*(?:র|এর|-এর)?\s*(?:নিচে|মধ্যে)',
    ).firstMatch(text);
    return int.tryParse((before ?? after)?.group(1) ?? '');
  }

  static int? _classLevel(String text) {
    final m =
        RegExp(r'class\s*(\d{1,2})').firstMatch(text) ??
        RegExp(r'(\d{1,2})\s*(?:ম|তম)?\s*শ্রেণি').firstMatch(text);
    final level = int.tryParse(m?.group(1) ?? '');
    return level != null && level >= 6 && level <= 12 ? level : null;
  }
}
