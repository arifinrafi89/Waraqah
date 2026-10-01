import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/import_book.dart';
import 'rule_error_labels.dart';

/// A checked CSV paste: the Books to add in green, with how many Editions
/// and which Authors or Publishers are new, then the rows left out in red.
class ImportPreview extends StatelessWidget {
  const ImportPreview({super.key, required this.plan});

  final ImportPlan plan;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final palette = context.palette;
    Widget line(IconData icon, Color color, String title, String detail) => Row(
      spacing: Insets.sm,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: color),
        Expanded(
          child: Text.rich(
            TextSpan(
              text: title,
              style: context.texts.titleSmall,
              children: [
                TextSpan(text: detail, style: context.texts.bodySmall),
              ],
            ),
          ),
        ),
      ],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: Insets.sm,
      children: [
        for (final b in plan.books)
          line(
            Icons.check_circle_rounded,
            palette.accent,
            b.draft.title,
            [
              '',
              l10n.adminCatalogImportEditions(b.draft.editions.length),
              if (b.newAuthor) l10n.adminCatalogImportNewAuthor,
              if (b.newPublisher) l10n.adminCatalogImportNewPublisher,
            ].join(' · '),
          ),
        for (final e in plan.errors)
          line(
            Icons.error_rounded,
            palette.danger,
            l10n.adminCatalogImportRow(e.row),
            ' ${l10n.importProblem(e)}',
          ),
      ],
    );
  }
}

extension on AppL10n {
  String importProblem(ImportError e) => switch (e.problem) {
    CsvProblem.columns => adminCatalogImportColumns,
    CsvProblem.blank => adminCatalogImportBlank,
    CsvProblem.section => adminCatalogImportSection(e.value),
    CsvProblem.category => adminCatalogImportCategory(e.value),
    CsvProblem.format => adminCatalogImportFormat(e.value),
    CsvProblem.language => adminCatalogImportLanguage(e.value),
    CsvProblem.number => adminCatalogImportNumber(e.value),
    CsvProblem.rule => ruleError(e.rule!),
  };
}
