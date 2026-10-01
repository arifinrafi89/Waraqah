import 'queued_listing.dart';

enum ModerationProblem { reasonRequired, reasonTooLong }

/// The Moderation Center's rules, checked in the app and by the server.
abstract final class ModerationRules {
  /// A third strike bans the account.
  static const int maxStrikes = 3;
  static const int maxReason = 300;

  /// Asking for changes and rejecting tell the seller why.
  static ModerationProblem? checkDecision(
    ListingDecision decision,
    String? reason,
  ) {
    final text = reason?.trim() ?? '';
    if (text.length > maxReason) return ModerationProblem.reasonTooLong;
    if (decision != ListingDecision.approve && text.isEmpty) {
      return ModerationProblem.reasonRequired;
    }
    return null;
  }

  /// Strikes after a warning, and whether that bans the account.
  static ({int strikes, bool banned}) afterWarning(int strikes) {
    final next = strikes + 1;
    return (strikes: next, banned: next >= maxStrikes);
  }
}
