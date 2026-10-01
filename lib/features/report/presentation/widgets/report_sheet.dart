import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/content_report.dart';
import '../../domain/entities/report_rules.dart';
import 'report_labels.dart';
import 'report_note_field.dart';
import 'report_reason_list.dart';

/// The report form: a reason and the reader's own words. Answers the
/// request, or `null` when dismissed.
Future<ReportRequest?> showReportSheet(
  BuildContext context,
  ReportTarget target,
) => showModalBottomSheet<ReportRequest>(
  context: context,
  showDragHandle: true,
  isScrollControlled: true,
  builder: (_) => _ReportSheet(target),
);

class _ReportSheet extends StatefulWidget {
  const _ReportSheet(this.target);

  final ReportTarget target;

  @override
  State<_ReportSheet> createState() => _ReportSheetState();
}

class _ReportSheetState extends State<_ReportSheet> {
  final _note = TextEditingController();
  ReportReason? _reason;

  @override
  void dispose() {
    _note.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final reason = _reason;
    final problem = reason == null
        ? null
        : ReportRules.check(reason, _note.text);
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        Insets.screen,
        0,
        Insets.screen,
        Insets.lg + MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: Insets.md,
        children: [
          Text(
            l10n.reportTitle(widget.target.kind),
            style: context.texts.titleMedium,
          ),
          Text(
            l10n.reportWhy,
            style: AppFonts.ui(size: 12.5, color: palette.textDim),
          ),
          ReportReasonList(
            reasons: ReportRules.reasonsFor(widget.target.kind),
            selected: reason,
            onChanged: (value) => setState(() => _reason = value),
          ),
          ReportNoteField(
            controller: _note,
            required: reason == ReportReason.other,
            error: _note.text.isEmpty && problem == ReportProblem.noteRequired
                ? null
                : l10n.reportProblem(problem),
            onChanged: (_) => setState(() {}),
          ),
          Text(
            l10n.reportPrivacy,
            style: AppFonts.ui(size: 11.5, color: palette.textFaint),
          ),
          PrimaryButton(
            label: l10n.reportSend,
            icon: Icons.flag_outlined,
            onPressed: reason == null || problem != null
                ? null
                : () => Navigator.pop(
                    context,
                    ReportRequest(
                      target: widget.target,
                      reason: reason,
                      note: _note.text,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
