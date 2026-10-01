import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../../p2p/presentation/providers/p2p_providers.dart';
import '../../data/repositories/moderation_repository_impl.dart';
import '../../data/sources/moderation_remote_source.dart';
import '../../domain/entities/audit_entry.dart';
import '../../domain/entities/moderation_report.dart';
import '../../domain/entities/queued_listing.dart';
import '../../domain/repositories/moderation_repository.dart';
import '../../domain/usecases/act_on_report.dart';
import '../../domain/usecases/decide_listing.dart';
import '../../domain/usecases/get_audit_log.dart';
import '../../domain/usecases/get_listing_queue.dart';
import '../../domain/usecases/get_open_reports.dart';

final moderationRepositoryProvider = Provider<ModerationRepository>(
  (ref) =>
      ModerationRepositoryImpl(ModerationRemoteSource(ref.watch(dioProvider))),
);

final getListingQueueProvider = Provider<GetListingQueue>(
  (ref) => GetListingQueue(ref.watch(moderationRepositoryProvider)),
);

final decideListingProvider = Provider<DecideListing>(
  (ref) => DecideListing(ref.watch(moderationRepositoryProvider)),
);

final getOpenReportsProvider = Provider<GetOpenReports>(
  (ref) => GetOpenReports(ref.watch(moderationRepositoryProvider)),
);

final actOnReportProvider = Provider<ActOnReport>(
  (ref) => ActOnReport(ref.watch(moderationRepositoryProvider)),
);

final getAuditLogProvider = Provider<GetAuditLog>(
  (ref) => GetAuditLog(ref.watch(moderationRepositoryProvider)),
);

/// Every action changes the log and may change the marketplace.
void _refreshAfterAction(Ref ref) => ref
  ..invalidate(auditLogProvider)
  ..invalidate(p2pListingsProvider)
  ..invalidate(nearbyListingsProvider)
  ..invalidate(listingsForBookProvider)
  ..invalidate(myListingsProvider);

/// Who's acting, for the audit log.
String _staffName(Ref ref) => ref.read(sessionProvider)?.name ?? '';

/// Listings waiting for approval.
class ListingQueueNotifier extends AsyncNotifier<List<QueuedListing>> {
  @override
  Future<List<QueuedListing>> build() =>
      ref.read(getListingQueueProvider).call(const NoParams());

  Future<void> decide(
    String listingId,
    ListingDecision decision, {
    String? reason,
  }) async {
    final request = ListingDecisionRequest(
      listingId,
      decision,
      by: _staffName(ref),
      reason: reason,
    );
    state = AsyncData(await ref.read(decideListingProvider).call(request));
    _refreshAfterAction(ref);
  }
}

final listingQueueProvider =
    AsyncNotifierProvider<ListingQueueNotifier, List<QueuedListing>>(
      ListingQueueNotifier.new,
    );

/// Open reports, one per reported thing.
class OpenReportsNotifier extends AsyncNotifier<List<ModerationReport>> {
  @override
  Future<List<ModerationReport>> build() =>
      ref.read(getOpenReportsProvider).call(const NoParams());

  Future<void> act(String reportId, ReportAction action) async {
    final request = ReportActionRequest(reportId, action, by: _staffName(ref));
    state = AsyncData(await ref.read(actOnReportProvider).call(request));
    _refreshAfterAction(ref);
  }
}

final openReportsProvider =
    AsyncNotifierProvider<OpenReportsNotifier, List<ModerationReport>>(
      OpenReportsNotifier.new,
    );

/// Every moderator action, newest first.
final auditLogProvider = FutureProvider<List<AuditEntry>>(
  (ref) => ref.watch(getAuditLogProvider).call(const NoParams()),
);
