import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/content_report.dart';
import 'report_labels.dart';

/// The reasons to pick from, one at a time.
class ReportReasonList extends StatelessWidget {
  const ReportReasonList({
    super.key,
    required this.reasons,
    required this.selected,
    required this.onChanged,
  });

  final List<ReportReason> reasons;
  final ReportReason? selected;
  final ValueChanged<ReportReason> onChanged;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    return Column(
      children: [
        for (final reason in reasons)
          InkWell(
            onTap: () => onChanged(reason),
            borderRadius: BorderRadius.circular(Radii.sm),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: Insets.sm),
              child: Row(
                spacing: Insets.md,
                children: [
                  Icon(
                    reason == selected
                        ? Icons.radio_button_checked_rounded
                        : Icons.radio_button_off_rounded,
                    size: 20,
                    color: reason == selected
                        ? palette.accent
                        : palette.textFaint,
                  ),
                  Expanded(
                    child: Text(
                      l10n.reportReason(reason),
                      style: AppFonts.ui(size: 13.5, color: palette.text),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
