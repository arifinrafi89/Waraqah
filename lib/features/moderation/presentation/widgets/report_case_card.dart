import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../core/widgets/tags.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../report/presentation/widgets/report_labels.dart';
import '../../domain/entities/moderation_report.dart';
import 'moderation_labels.dart';
import 'report_action_bar.dart';

/// Open reports about one thing: what it is, why, whose it is and their
/// record, then what to do.
class ReportCaseCard extends StatelessWidget {
  const ReportCaseCard({super.key, required this.report});

  final ModerationReport report;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final dim = AppFonts.ui(size: 12, color: palette.textDim);
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: Insets.sm,
        children: [
          Wrap(
            spacing: 6,
            runSpacing: 6,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              MiniTag(label: l10n.kindLabel(report.target.kind), fontSize: 10),
              Text(
                l10n.reportReason(report.reason),
                style: AppFonts.ui(
                  size: 12.5,
                  weight: FontWeight.w800,
                  color: palette.danger,
                ),
              ),
              Text(
                '· ${l10n.moderationReportCount(report.reportCount)}',
                style: dim,
              ),
            ],
          ),
          Text(
            report.preview,
            style: AppFonts.ui(size: 13.5, height: 1.4, color: palette.text),
          ),
          Text(
            '${l10n.moderationOwner(report.ownerName)} · '
            '${report.ownerBanned ? l10n.moderationBannedTag : l10n.moderationStrikes(report.ownerStrikes)}',
            style: dim,
          ),
          if (report.note case final note?)
            Text(l10n.moderationReporterNote(note), style: dim),
          Text(moderationTime(context, report.createdAt), style: dim),
          ReportActionBar(report: report),
        ],
      ),
    );
  }
}
