import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/moderation_report.dart';
import '../../domain/entities/queued_listing.dart';
import '../providers/moderation_providers.dart';
import 'ban_dialog.dart';
import 'decision_reason_sheet.dart';

/// What moderators do from the Moderation Center, with a confirmation or a
/// reason where one is needed, and a message when it's done.
extension ModerationActions on WidgetRef {
  Future<void> decideListing(
    BuildContext context,
    QueuedListing listing,
    ListingDecision decision,
  ) async {
    final l10n = AppL10n.of(context)!;
    String? reason;
    if (decision != ListingDecision.approve) {
      reason = await showDecisionReasonSheet(context, decision);
      if (reason == null || !context.mounted) return;
    }
    final done = switch (decision) {
      ListingDecision.approve => l10n.moderationApproved(listing.title),
      ListingDecision.requestChanges => l10n.moderationChangesSent(
        listing.sellerName,
      ),
      ListingDecision.reject => l10n.moderationRejected(listing.title),
    };
    await _run(
      context,
      () =>
          read(listingQueueProvider.notifier)
              .decide(listing.id, decision, reason: reason),
      done,
    );
  }

  Future<void> actOnReport(
    BuildContext context,
    ModerationReport report,
    ReportAction action,
  ) async {
    if (action == ReportAction.ban &&
        !await confirmBan(context, report.ownerName)) {
      return;
    }
    if (!context.mounted) return;
    await _run(
      context,
      () => read(openReportsProvider.notifier).act(report.id, action),
      AppL10n.of(context)!.moderationDone,
    );
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
