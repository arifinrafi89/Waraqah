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
  bookSearch,
  bookDetails,
  other,
}

final class AssistantIntent {
  const AssistantIntent({required this.kind, this.query = '', this.maxPrice});

  final AssistantIntentKind kind;
  final String query;
  final int? maxPrice;

  bool get searchesBooks => kind != AssistantIntentKind.other;

  bool get isIslamic => switch (kind) {
    AssistantIntentKind.islamicRecommendations ||
    AssistantIntentKind.quran ||
    AssistantIntentKind.hadith ||
    AssistantIntentKind.seerah ||
    AssistantIntentKind.islamicHistory ||
    AssistantIntentKind.islamicStudies ||
    AssistantIntentKind.islamicSelfDevelopment => true,
    AssistantIntentKind.authorSearch => query.toLowerCase().contains(
      'ibn kathir',
    ),
    _ => false,
  };

  static AssistantIntent detect(String prompt, List<String> history) {
    final normalized = prompt.trim().toLowerCase();
    final price = RegExp(r'(?:under|below|less than)\s*(?:৳|tk|taka)?\s*(\d+)')
        .firstMatch(normalized)
        ?.group(1);
    final maxPrice = price == null ? null : int.tryParse(price);

    if (_hasAny(normalized, ['quran', 'qur\'an', 'koran'])) {
      return AssistantIntent(
        kind: AssistantIntentKind.quran,
        maxPrice: maxPrice,
      );
    }
    if (_hasAny(normalized, ['hadith', ' hadees'])) {
      return AssistantIntent(
        kind: AssistantIntentKind.hadith,
        maxPrice: maxPrice,
      );
    }
    if (_hasAny(normalized, ['seerah', 'sirah', 'prophet biography'])) {
      return AssistantIntent(
        kind: AssistantIntentKind.seerah,
        maxPrice: maxPrice,
      );
    }
    if (_hasAny(normalized, ['islamic history', 'muslim history'])) {
      return AssistantIntent(
        kind: AssistantIntentKind.islamicHistory,
        maxPrice: maxPrice,
      );
    }
    if (_hasAny(normalized, ['islamic studies', 'fiqh', 'aqeedah'])) {
      return AssistantIntent(
        kind: AssistantIntentKind.islamicStudies,
        maxPrice: maxPrice,
      );
    }
    if (_hasAny(normalized, [
      'self development',
      'self-development',
      'character',
    ])) {
      return AssistantIntent(
        kind: AssistantIntentKind.islamicSelfDevelopment,
        maxPrice: maxPrice,
      );
    }
    if (_hasAny(normalized, ['islamic', 'islam', 'muslim'])) {
      return AssistantIntent(
        kind: AssistantIntentKind.islamicRecommendations,
        maxPrice: maxPrice,
      );
    }

    final authorMatch = RegExp(r'\bby\s+(.+)$').firstMatch(prompt.trim());
    if (authorMatch != null) {
      return AssistantIntent(
        kind: AssistantIntentKind.authorSearch,
        query: authorMatch.group(1)!.trim(),
        maxPrice: maxPrice,
      );
    }
    if (maxPrice != null) {
      return AssistantIntent(
        kind: AssistantIntentKind.priceFilteredSearch,
        maxPrice: maxPrice,
      );
    }
    if (_hasAny(normalized, [
      'suggest',
      'recommend',
      'book',
      'books',
      'read',
    ])) {
      return const AssistantIntent(
        kind: AssistantIntentKind.generalRecommendations,
      );
    }
    if (_hasAny(normalized, [
      'book details',
      'details of this book',
      'tell me about this book',
    ])) {
      return AssistantIntent(
        kind: AssistantIntentKind.bookDetails,
        query: prompt.trim(),
      );
    }

    final previousWasBookRequest = history.any(
      (message) => _hasAny(message.toLowerCase(), [
        'book',
        'recommend',
        'suggest',
        'reading',
      ]),
    );
    if (previousWasBookRequest && _hasAny(normalized, ['more', 'another'])) {
      return const AssistantIntent(
        kind: AssistantIntentKind.generalRecommendations,
      );
    }
    return const AssistantIntent(kind: AssistantIntentKind.other);
  }

  static bool _hasAny(String value, List<String> terms) =>
      terms.any(value.contains);
}
