import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/moderation_report.dart';
import 'moderation_actions.dart';

/// Remove, dismiss, warn or ban. Someone already banned can't be warned.
class ReportActionBar extends ConsumerWidget {
  const ReportActionBar({super.key, required this.report});

  final ModerationReport report;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final danger = context.palette.danger;
    final punishable = report.ownerId.isNotEmpty && !report.ownerBanned;
    Widget button(String label, ReportAction action, {Color? color}) =>
        TextButton(
          onPressed: () => ref.actOnReport(context, report, action),
          style: TextButton.styleFrom(foregroundColor: color),
          child: Text(label),
        );
    return Wrap(
      spacing: Insets.sm,
      children: [
        button(l10n.moderationRemove, ReportAction.remove, color: danger),
        button(l10n.moderationDismiss, ReportAction.dismiss),
        if (punishable) button(l10n.moderationWarn, ReportAction.warn),
        if (punishable)
          button(l10n.moderationBan, ReportAction.ban, color: danger),
      ],
    );
  }
}
