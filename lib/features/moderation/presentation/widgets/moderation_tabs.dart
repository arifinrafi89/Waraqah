import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../l10n/app_localizations.dart';
import '../providers/moderation_providers.dart';
import 'audit_entry_tile.dart';
import '../../../handled_sale/presentation/providers/handled_sale_providers.dart';
import 'dispute_case_card.dart';
import 'moderation_tab.dart';
import 'queued_listing_card.dart';
import 'report_case_card.dart';

/// Listings to approve, Reports, Disputes (Waraqah-handled sales) and the
/// audit log.
class ModerationTabs extends ConsumerWidget {
  const ModerationTabs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return TabBarView(
      children: [
        ModerationTab(
          value: ref.watch(listingQueueProvider),
          onRetry: () => ref.invalidate(listingQueueProvider),
          emptyIcon: Icons.task_alt_rounded,
          emptyMessage: l10n.moderationEmptyListings,
          itemBuilder: (listing) => QueuedListingCard(listing: listing),
        ),
        ModerationTab(
          value: ref.watch(openReportsProvider),
          onRetry: () => ref.invalidate(openReportsProvider),
          emptyIcon: Icons.flag_outlined,
          emptyMessage: l10n.moderationEmptyReports,
          itemBuilder: (report) => ReportCaseCard(report: report),
        ),
        ModerationTab(
          value: ref.watch(saleDisputesProvider),
          onRetry: () => ref.invalidate(saleDisputesProvider),
          emptyIcon: Icons.gavel_rounded,
          emptyMessage: l10n.moderationEmptyDisputes,
          itemBuilder: (dispute) => DisputeCaseCard(dispute: dispute),
        ),
        ModerationTab(
          value: ref.watch(auditLogProvider),
          onRetry: () => ref.invalidate(auditLogProvider),
          emptyIcon: Icons.history_rounded,
          emptyMessage: l10n.moderationEmptyLog,
          spacing: 0,
          itemBuilder: (entry) => AuditEntryTile(entry: entry),
        ),
      ],
    );
  }
}
