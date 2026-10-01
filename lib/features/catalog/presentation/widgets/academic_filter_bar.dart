import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/models/section_academics.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/catalog_providers.dart';
import '../providers/section_filters_provider.dart';
import 'academic_chip_row.dart';
import 'exam_labels.dart';

/// The Class, Exam and Subject rows a Section offers (none for most). A tap
/// narrows the page's book list in place.
class AcademicFilterBar extends ConsumerWidget {
  const AcademicFilterBar({super.key, required this.section});

  final Section section;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!section.hasSubjects) return const SizedBox();
    final l10n = AppL10n.of(context)!;
    final picked = ref.watch(sectionFiltersProvider(section));
    final filters = ref.read(sectionFiltersProvider(section).notifier);
    final subjects = ref.watch(sectionSubjectsProvider(section)).value ?? [];
    final isBangla = Localizations.localeOf(context).languageCode == 'bn';
    final names = {
      for (final s in subjects) s.id: isBangla ? s.nameBn : s.nameEn,
    };
    return Column(
      children: [
        if (section.classLevels.isNotEmpty)
          AcademicChipRow<int>(
            title: l10n.sectionClassRow,
            values: section.classLevels,
            selected: {?picked.classLevel},
            labelOf: l10n.sectionClassChip,
            onTap: (c) => filters.toggle(classLevel: c),
          ),
        if (section.allowedExams.isNotEmpty)
          AcademicChipRow<Exam>(
            title: l10n.sectionExamRow,
            values: section.allowedExams,
            selected: {?picked.exam},
            labelOf: l10n.examLabel,
            onTap: (e) => filters.toggle(exam: e),
          ),
        if (names.isNotEmpty)
          AcademicChipRow<String>(
            title: l10n.sectionSubjectRow,
            values: names.keys.toList(),
            selected: {?picked.subjectId},
            labelOf: (id) => names[id]!,
            onTap: (id) => filters.toggle(subjectId: id),
          ),
      ],
    );
  }
}
