import '../../domain/entities/audit_entry.dart';
import '../../domain/entities/moderation_report.dart';
import '../../domain/entities/queued_listing.dart';
import '../../domain/repositories/moderation_repository.dart';
import '../models/audit_entry_model.dart';
import '../models/moderation_report_model.dart';
import '../models/queued_listing_model.dart';
import '../sources/moderation_remote_source.dart';

/// No cache: several moderators work the same queue.
class ModerationRepositoryImpl implements ModerationRepository {
  ModerationRepositoryImpl(this._source);

  final ModerationRemoteSource _source;

  @override
  Future<List<QueuedListing>> queue() async => [
    for (final m in await _source.queue()) m.toEntity(),
  ];

  @override
  Future<List<QueuedListing>> decide(ListingDecisionRequest request) async => [
    for (final m in await _source.decide(request)) m.toEntity(),
  ];

  @override
  Future<List<ModerationReport>> reports() async => [
    for (final m in await _source.reports()) m.toEntity(),
  ];

  @override
  Future<List<ModerationReport>> act(ReportActionRequest request) async => [
    for (final m in await _source.act(request)) m.toEntity(),
  ];

  @override
  Future<List<AuditEntry>> log() async => [
    for (final m in await _source.log()) m.toEntity(),
  ];
}
