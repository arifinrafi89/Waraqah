import '../../../../core/usecase/usecase.dart';
import '../entities/moderation_rules.dart';
import '../entities/queued_listing.dart';
import '../repositories/moderation_repository.dart';

/// Approves a Listing, or asks for changes or rejects it with a reason.
class DecideListing
    extends UseCase<List<QueuedListing>, ListingDecisionRequest> {
  DecideListing(this._repository);

  final ModerationRepository _repository;

  @override
  Future<List<QueuedListing>> call(ListingDecisionRequest params) {
    final problem = ModerationRules.checkDecision(
      params.decision,
      params.reason,
    );
    if (problem != null) {
      throw ArgumentError.value(params.reason, 'reason', problem.name);
    }
    final reason = params.reason?.trim();
    return _repository.decide(
      ListingDecisionRequest(
        params.listingId,
        params.decision,
        by: params.by,
        reason: reason == null || reason.isEmpty ? null : reason,
      ),
    );
  }
}
