import '../../domain/entities/ayah.dart';

/// A small rotation of verses, picked by day-of-year until the Go backend
/// serves `/islamic/ayah-of-the-day`.
abstract final class AyahFixtures {
  static const List<Ayah> verses = [
    Ayah(
      arabic: 'فَٱذْكُرُونِىٓ أَذْكُرْكُمْ وَٱشْكُرُوا۟ لِى وَلَا تَكْفُرُونِ',
      translation:
          'So remember Me; I will remember you. And be grateful to Me and '
          'do not deny Me.',
      surahEn: 'Surah Al-Baqarah',
      surahBn: 'সূরা আল-বাকারা',
      surahNumber: 2,
      verseNumber: 152,
    ),
    Ayah(
      arabic: 'وَقُل رَّبِّ زِدْنِى عِلْمًا',
      translation: 'And say: My Lord, increase me in knowledge.',
      surahEn: 'Surah Ta-Ha',
      surahBn: 'সূরা ত্বা-হা',
      surahNumber: 20,
      verseNumber: 114,
    ),
    Ayah(
      arabic: 'إِنَّ مَعَ ٱلْعُسْرِ يُسْرًا',
      translation: 'Indeed, with hardship comes ease.',
      surahEn: 'Surah Ash-Sharh',
      surahBn: 'সূরা আশ-শারহ',
      surahNumber: 94,
      verseNumber: 6,
    ),
  ];

  static Ayah forDate(DateTime date) {
    final dayOfYear = date.difference(DateTime(date.year)).inDays;
    return verses[dayOfYear % verses.length];
  }
}
