import '../entities/audit_entry.dart';
import '../entities/moderation_report.dart';
import '../entities/queued_listing.dart';

/// [by] is the staff member's name for the audit log. There are no login
/// tokens yet; the Go backend will take it from the token instead.
class ListingDecisionRequest {
  const ListingDecisionRequest(
    this.listingId,
    this.decision, {
    required this.by,
    this.reason,
  });

  final String listingId;
  final ListingDecision decision;
  final String by;
  final String? reason;
}

class ReportActionRequest {
  const ReportActionRequest(this.reportId, this.action, {required this.by});

  final String reportId;
  final ReportAction action;
  final String by;
}

/// The Moderation Center's work. Each action answers the updated list.
abstract interface class ModerationRepository {
  /// Listings waiting for approval, oldest first.
  Future<List<QueuedListing>> queue();

  Future<List<QueuedListing>> decide(ListingDecisionRequest request);

  /// Open reports, one per reported thing, oldest first.
  Future<List<ModerationReport>> reports();

  Future<List<ModerationReport>> act(ReportActionRequest request);

  /// Every action, newest first.
  Future<List<AuditEntry>> log();
}
