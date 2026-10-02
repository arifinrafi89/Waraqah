import 'package:characters/characters.dart';

/// Why a review can't be saved.
enum ReviewProblem { noStars, tooLong }

/// One review per Reader per Book: 1–5 stars, optional text up to
/// [maxText] characters (graphemes). The sheet and the server both check.
abstract final class ReviewRules {
  static const int maxText = 1000;

  static ReviewProblem? check(int stars, String text) {
    if (stars < 1 || stars > 5) return ReviewProblem.noStars;
    return text.trim().characters.length > maxText
        ? ReviewProblem.tooLong
        : null;
  }
}
