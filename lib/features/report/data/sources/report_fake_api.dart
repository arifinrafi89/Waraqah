import 'package:dio/dio.dart';

import '../../domain/entities/content_report.dart';
import 'report_fake_store.dart';

/// Reports' and blocks' fake endpoints, merged into `FakeApiInterceptor` by
/// `app/fake_api_routes.dart`. Changes answer `null` when refused.
abstract final class ReportFakeApi {
  /// Body `{kind, targetId, reason, note?}`: answers the report.
  static const String report = '/reports';

  /// The signed-in reader's blocked readers, newest first.
  static const String blocked = '/blocks';

  /// Body `{readerId}`: answers the blocked list.
  static const String block = '/blocks/add';

  /// Body `{readerId}`: answers the blocked list.
  static const String unblock = '/blocks/remove';

  static Map<String, Object? Function(RequestOptions)> routes(
    ReportFakeStore store,
  ) => {
    report: (o) {
      final body = _body(o);
      return store
          .report(
            ReportTargetKind.values.byName(body['kind'] as String),
            body['targetId'] as String? ?? '',
            ReportReason.values.byName(body['reason'] as String),
            body['note'] as String?,
          )
          ?.toJson();
    },
    blocked: (_) => store.blockedJson(),
    block: (o) => store.block(_reader(o)) ? store.blockedJson() : null,
    unblock: (o) {
      store.unblock(_reader(o));
      return store.blockedJson();
    },
  };

  static Map<String, dynamic> _body(RequestOptions options) =>
      options.data as Map<String, dynamic>? ?? const {};

  static String _reader(RequestOptions options) =>
      _body(options)['readerId'] as String? ?? '';
}
