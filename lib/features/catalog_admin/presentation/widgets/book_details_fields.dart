import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/models/edition.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/presentation/widgets/edition_labels.dart';
import '../../../catalog/presentation/widgets/section_style.dart';
import '../../domain/entities/catalog_admin_rules.dart' show RuleError;
import '../../domain/entities/catalog_record.dart';
import '../providers/book_form_provider.dart';
import '../providers/catalog_admin_providers.dart';
import 'admin_text_field.dart';
import 'record_picker_field.dart';
import 'rule_error_labels.dart';

/// The Book form's details: titles, Author, Publisher, Section, Category
/// and original language. The rating isn't here: it comes from reviews.
class BookDetailsFields extends ConsumerWidget {
  const BookDetailsFields({
    super.key,
    required this.form,
    required this.bookId,
  });

  final BookForm form;
  final String? bookId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final isBangla = Localizations.localeOf(context).languageCode == 'bn';
    final notifier = ref.read(bookFormProvider(bookId).notifier);
    final draft = form.draft;
    String? error(Set<RuleError> which) => l10n.ruleErrorOf(form.errors, which);
    final categories = [
      for (final c
          in ref.watch(adminRecordsProvider(RecordKind.category)).value ??
              const <CatalogRecord>[])
        if (c.section == draft.section) c,
    ];
    DropdownButtonFormField<T> dropdown<T>(
      String label,
      T? value,
      Map<T, String> items,
      void Function(T) set, {
      String? error,
    }) => DropdownButtonFormField<T>(
      key: ValueKey('$label:$value:${items.length}'),
      initialValue: value,
      isExpanded: true,
      decoration: adminInputDecoration(context, label, error: error),
      items: [
        for (final MapEntry(:key, :value) in items.entries)
          DropdownMenuItem(value: key, child: Text(value)),
      ],
      onChanged: (v) => v == null ? null : set(v),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: Insets.md,
      children: [
        AdminTextField(
          label: l10n.adminCatalogFieldTitle,
          initialValue: draft.title,
          error: error({RuleError.titleBlank}),
          onChanged: (v) => notifier.edit((d) => d.copyWith(title: v)),
        ),
        AdminTextField(
          label: l10n.adminCatalogFieldTitleBn,
          initialValue: draft.titleBn,
          onChanged: (v) => notifier.edit((d) => d.copyWith(titleBn: v)),
        ),
        RecordPickerField(
          kind: RecordKind.author,
          id: draft.authorId,
          error: error({RuleError.authorMissing}),
          onPicked: (id) => notifier.edit((d) => d.copyWith(authorId: id)),
        ),
        RecordPickerField(
          kind: RecordKind.publisher,
          id: draft.publisherId,
          error: error({RuleError.publisherMissing}),
          onPicked: (id) => notifier.edit((d) => d.copyWith(publisherId: id)),
        ),
        dropdown(l10n.adminCatalogFieldSection, draft.section, {
          for (final s in Section.values) s: s.label(l10n),
        }, (s) => notifier.edit((d) => d.copyWith(section: s))),
        dropdown(
          l10n.adminCatalogFieldCategory,
          draft.categoryId.isEmpty ? null : draft.categoryId,
          {for (final c in categories) c.id!: c.label(isBangla)},
          (id) => notifier.edit((d) => d.copyWith(categoryId: id)),
          error: error({
            RuleError.categoryMissing,
            RuleError.categoryWrongSection,
          }),
        ),
        dropdown(l10n.adminCatalogFieldLanguage, draft.originalLanguage, {
          for (final l in BookLanguage.values) l: l10n.languageLabel(l),
        }, (l) => notifier.edit((d) => d.copyWith(originalLanguage: l))),
      ],
    );
  }
}
