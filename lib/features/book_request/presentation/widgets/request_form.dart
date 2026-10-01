import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/request_rules.dart';

/// The request's fields, with what's wrong under them.
class RequestForm extends StatelessWidget {
  const RequestForm({
    super.key,
    required this.title,
    required this.author,
    required this.maxPrice,
    required this.note,
    required this.problem,
    required this.onChanged,
  });

  final TextEditingController title;
  final TextEditingController author;
  final TextEditingController maxPrice;
  final TextEditingController note;
  final RequestProblem? problem;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final message = switch (problem) {
      RequestProblem.titleMissing => null,
      RequestProblem.titleTooLong => l10n.requestTitleTooLong(
        RequestRules.maxTitle,
      ),
      RequestProblem.badPrice => l10n.requestBadPrice,
      RequestProblem.noteTooLong => l10n.requestNoteTooLong(
        RequestRules.maxNote,
      ),
      null => null,
    };
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: Insets.md,
      children: [
        AppTextField(
          label: l10n.requestBookTitle,
          hint: l10n.requestBookTitleHint,
          icon: Icons.menu_book_rounded,
          controller: title,
          onChanged: onChanged,
        ),
        AppTextField(
          label: l10n.requestAuthor,
          hint: l10n.requestAuthorHint,
          icon: Icons.person_outline_rounded,
          controller: author,
        ),
        AppTextField(
          label: l10n.requestMaxPrice,
          hint: l10n.requestMaxPriceHint,
          icon: Icons.payments_outlined,
          keyboardType: TextInputType.number,
          controller: maxPrice,
          onChanged: onChanged,
        ),
        AppTextField(
          label: l10n.requestNote,
          hint: l10n.requestNoteHint,
          icon: Icons.edit_note_rounded,
          controller: note,
          onChanged: onChanged,
        ),
        if (message != null)
          Text(
            message,
            style: AppFonts.ui(size: 11.5, color: context.palette.danger),
          ),
      ],
    );
  }
}
