import '../../../../core/models/book.dart';
import '../../../../core/models/edition.dart';
import 'assistant_parser.dart';

enum AssistantIntentKind {
  generalRecommendations,
  islamicRecommendations,
  quran,
  hadith,
  seerah,
  islamicHistory,
  islamicStudies,
  islamicSelfDevelopment,
  authorSearch,
  priceFilteredSearch,
  academic,
  other,
}

/// What the reader asked for, in plain words or Bangla: a topic, and any
/// budget, Class, Exam, language or format. A [basket] request wants a
/// set of Books that fits the budget, ready for the cart.
final class AssistantIntent {
  const AssistantIntent({
    required this.kind,
    this.query = '',
    this.maxPrice,
    this.classLevel,
    this.exam,
    this.language,
    this.format,
    this.basket = false,
  });

  final AssistantIntentKind kind;
  final String query;
  final int? maxPrice;
  final int? classLevel;
  final Exam? exam;
  final BookLanguage? language;
  final BookFormat? format;
  final bool basket;

  bool get searchesBooks => kind != AssistantIntentKind.other;

  bool get isIslamic => switch (kind) {
    AssistantIntentKind.islamicRecommendations ||
    AssistantIntentKind.quran ||
    AssistantIntentKind.hadith ||
    AssistantIntentKind.seerah ||
    AssistantIntentKind.islamicHistory ||
    AssistantIntentKind.islamicStudies ||
    AssistantIntentKind.islamicSelfDevelopment => true,
    _ => false,
  };

  static AssistantIntent detect(String prompt, List<String> history) =>
      AssistantParser.parse(prompt, history);
}
