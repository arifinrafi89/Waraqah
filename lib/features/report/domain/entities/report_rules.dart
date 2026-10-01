import 'content_report.dart';

/// What's wrong with a report before it's sent.
enum ReportProblem {
  /// "Something else" needs a few words to act on.
  noteRequired,
  tooLong,
}

/// The rules every report follows, checked in the app and by the server.
abstract final class ReportRules {
  static const int maxNote = 500;

  /// `null` when the report can be sent.
  static ReportProblem? check(ReportReason reason, String? note) {
    final text = note?.trim() ?? '';
    if (text.length > maxNote) return ReportProblem.tooLong;
    if (reason == ReportReason.other && text.isEmpty) {
      return ReportProblem.noteRequired;
    }
    return null;
  }

  /// The reasons that make sense for a [kind]. A photocopy is a book, so
  /// only Listings offer it.
  static List<ReportReason> reasonsFor(ReportTargetKind kind) => [
    for (final reason in ReportReason.values)
      if (reason != ReportReason.photocopy || kind == ReportTargetKind.listing)
        reason,
  ];
}
