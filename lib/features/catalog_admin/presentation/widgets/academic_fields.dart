import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/models/section_academics.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/presentation/providers/catalog_providers.dart';
import '../../../catalog/presentation/widgets/academic_chip_row.dart';
import '../../../catalog/presentation/widgets/exam_labels.dart';
import '../../domain/entities/catalog_admin_rules.dart' show RuleError;
import '../providers/book_form_provider.dart';
import 'admin_text_field.dart';
import 'rule_error_labels.dart';

/// The Book's Classes, Exams and Subject, with the same rows its Section's
/// page shows. Nothing for a Section without them.
class AcademicFields extends ConsumerWidget {
  const AcademicFields({super.key, required this.form, required this.bookId});

  final BookForm form;
  final String? bookId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final draft = form.draft;
    final section = draft.section;
    if (!section.hasSubjects) return const SizedBox();
    final l10n = AppL10n.of(context)!;
    final isBangla = Localizations.localeOf(context).languageCode == 'bn';
    final notifier = ref.read(bookFormProvider(bookId).notifier);
    final subjects = ref.watch(subjectsProvider(null)).value ?? const [];
    final error = l10n.ruleErrorOf(form.errors, {
      RuleError.classNotAllowed,
      RuleError.examNotAllowed,
    });
    List<T> toggled<T>(List<T> list, T value) =>
        list.contains(value) ? ([...list]..remove(value)) : [...list, value];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: Insets.sm,
      children: [
        if (section.classLevels.isNotEmpty)
          AcademicChipRow<int>(
            title: l10n.sectionClassRow,
            values: section.classLevels,
            selected: draft.classes.toSet(),
            labelOf: l10n.sectionClassChip,
            padding: EdgeInsets.zero,
            onTap: (c) => notifier.edit(
              (d) => d.copyWith(classes: toggled(d.classes, c)..sort()),
            ),
          ),
        if (section.allowedExams.isNotEmpty)
          AcademicChipRow<Exam>(
            title: l10n.sectionExamRow,
            values: section.allowedExams,
            selected: draft.exams.toSet(),
            labelOf: l10n.examLabel,
            padding: EdgeInsets.zero,
            onTap: (e) =>
                notifier.edit((d) => d.copyWith(exams: toggled(d.exams, e))),
          ),
        if (error != null)
          Text(
            error,
            style: context.texts.bodySmall?.copyWith(
              color: context.palette.danger,
            ),
          ),
        DropdownButtonFormField<String>(
          key: ValueKey('subject:${draft.subjectId}:${subjects.length}'),
          // Blank until the Subjects load.
          initialValue: subjects.any((s) => s.id == draft.subjectId)
              ? draft.subjectId
              : '',
          isExpanded: true,
          decoration: adminInputDecoration(
            context,
            l10n.adminCatalogFieldSubject,
          ),
          items: [
            DropdownMenuItem(
              value: '',
              child: Text(l10n.adminCatalogFieldNoSubject),
            ),
            for (final s in subjects)
              DropdownMenuItem(
                value: s.id,
                child: Text(isBangla ? s.nameBn : s.nameEn),
              ),
          ],
          onChanged: (id) =>
              notifier.edit((d) => d.copyWith(subjectId: id ?? '')),
        ),
      ],
    );
  }
}
