import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/audit_entry.dart';
import 'moderation_labels.dart';

/// One line of the audit log: "Approved Organic Chemistry", who and when,
/// and why.
class AuditEntryTile extends StatelessWidget {
  const AuditEntryTile({super.key, required this.entry});

  final AuditEntry entry;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final dim = AppFonts.ui(size: 11.5, color: palette.textDim);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Insets.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 2,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '${l10n.auditLabel(entry.action)} ',
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
                TextSpan(text: entry.subject),
              ],
            ),
            style: AppFonts.ui(size: 13, color: palette.text),
          ),
          if (entry.reason case final reason?)
            Text(l10n.auditReason(reason), style: dim),
          Text(
            l10n.moderationLogBy(entry.by, moderationTime(context, entry.at)),
            style: AppFonts.ui(size: 11, color: palette.textFaint),
          ),
        ],
      ),
    );
  }
}
