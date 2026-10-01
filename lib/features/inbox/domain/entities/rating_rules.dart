/// Why a rating can't be sent.
enum RatingProblem { stars, tooLong }

/// A rating is 1 to 5 stars, with up to [maxCommentLength] characters of
/// comment, checked the same way in the app and on the server.
abstract final class RatingRules {
  static const int maxCommentLength = 300;

  static RatingProblem? check({required int stars, String comment = ''}) {
    if (stars < 1 || stars > 5) return RatingProblem.stars;
    if (comment.trim().length > maxCommentLength) return RatingProblem.tooLong;
    return null;
  }
}
