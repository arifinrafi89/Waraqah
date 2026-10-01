import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../auth/auth_routes.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../domain/entities/content_report.dart';
import '../providers/report_providers.dart';
import 'block_dialog.dart';
import 'report_sheet.dart';

/// How any page reports something or blocks a reader. Guests log in first.
extension ReportActions on WidgetRef {
  /// The report form, then a thank-you once it reached the moderators.
  Future<void> report(BuildContext context, ReportTarget target) async {
    if (!_signedIn(context)) return;
    final request = await showReportSheet(context, target);
    if (request == null || !context.mounted) return;
    final l10n = AppL10n.of(context)!;
    await _run(
      context,
      () => read(reportContentProvider).call(request),
      l10n.reportSent,
    );
  }

  /// Asks first, then hides the reader's listings.
  Future<void> block(BuildContext context, String readerId, String name) async {
    if (!_signedIn(context)) return;
    if (!await confirmBlock(context, name) || !context.mounted) return;
    await _run(
      context,
      () => read(blockedReadersProvider.notifier).block(readerId),
      AppL10n.of(context)!.reportBlocked(name),
    );
  }

  Future<void> unblock(BuildContext context, String readerId, String name) =>
      _run(
        context,
        () => read(blockedReadersProvider.notifier).unblock(readerId),
        AppL10n.of(context)!.reportUnblocked(name),
      );

  bool _signedIn(BuildContext context) {
    if (read(sessionProvider) != null) return true;
    GoRouter.of(context).push(AuthRoutes.login);
    return false;
  }

  Future<void> _run(
    BuildContext context,
    Future<void> Function() action,
    String done,
  ) async {
    final messenger = ScaffoldMessenger.of(context);
    final error = AppL10n.of(context)!.commonSomethingWentWrong;
    try {
      await action();
      messenger.showSnackBar(SnackBar(content: Text(done)));
    } catch (_) {
      messenger.showSnackBar(SnackBar(content: Text(error)));
    }
  }
}
