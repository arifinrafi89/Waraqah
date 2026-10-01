import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';

/// The reader's own words about a report, with what's wrong under it.
class ReportNoteField extends StatelessWidget {
  const ReportNoteField({
    super.key,
    required this.controller,
    required this.required,
    required this.onChanged,
    this.error,
  });

  final TextEditingController controller;

  /// "Something else" needs a note.
  final bool required;
  final ValueChanged<String> onChanged;
  final String? error;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        AppTextField(
          label: l10n.reportNoteLabel,
          hint: required ? l10n.reportNoteRequired : l10n.reportNoteHint,
          icon: Icons.edit_note_rounded,
          controller: controller,
          onChanged: onChanged,
        ),
        if (error case final error?)
          Text(
            error,
            style: AppFonts.ui(size: 11.5, color: context.palette.danger),
          ),
      ],
    );
  }
}
