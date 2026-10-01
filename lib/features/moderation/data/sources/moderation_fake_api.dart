import 'package:dio/dio.dart';

import '../../domain/entities/moderation_report.dart';
import '../../domain/entities/queued_listing.dart';
import 'moderation_fake_reports.dart';
import 'moderation_fake_store.dart';

/// The Moderation Center's fake endpoints, merged into `FakeApiInterceptor`
/// by `app/fake_api_routes.dart`. Changes answer the updated list, or
/// `null` when refused.
abstract final class ModerationFakeApi {
  /// Listings waiting for approval.
  static const String queue = '/moderation/listings';

  /// Body `{listingId, decision, reason?, by}`.
  static const String decide = '/moderation/listings/decide';

  /// Open reports, one per reported thing.
  static const String reports = '/moderation/reports';

  /// Body `{reportId, action, by}`.
  static const String act = '/moderation/reports/act';

  /// The audit log, newest first.
  static const String log = '/moderation/log';

  static Map<String, Object? Function(RequestOptions)> routes(
    ModerationFakeStore store,
  ) => {
    queue: (_) => store.queueJson(),
    decide: (o) =>
        store.decide(
          _text(o, 'listingId'),
          ListingDecision.values.byName(_text(o, 'decision')),
          _text(o, 'by'),
          _body(o)['reason'] as String?,
        )
        ? store.queueJson()
        : null,
    reports: (_) => store.openReportsJson(),
    act: (o) =>
        store.act(
          _text(o, 'reportId'),
          ReportAction.values.byName(_text(o, 'action')),
          _text(o, 'by'),
        )
        ? store.openReportsJson()
        : null,
    log: (_) => [for (final entry in store.log.reversed) entry.toJson()],
  };

  static Map<String, dynamic> _body(RequestOptions options) =>
      options.data as Map<String, dynamic>? ?? const {};

  static String _text(RequestOptions options, String key) =>
      _body(options)[key] as String? ?? '';
}
