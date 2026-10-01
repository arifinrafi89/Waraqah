import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/domain/entities/booklist.dart';
import '../../../catalog/presentation/providers/expert_providers.dart';
import '../../../catalog/presentation/widgets/booklist_labels.dart';
import '../../../catalog/presentation/widgets/section_style.dart';
import '../../domain/entities/catalog_admin_rules.dart';
import '../../domain/entities/list_draft.dart';
import '../providers/list_form_provider.dart';
import 'admin_text_field.dart';
import 'rule_error_labels.dart';

/// The builder's titles, notes, and Section with Expert (a Collection) or
/// Kind (a Staff Booklist).
class ListFormFields extends ConsumerWidget {
  const ListFormFields({super.key, required this.form, required this.formKey});

  final ListForm form;
  final ListFormKey formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final isBangla = Localizations.localeOf(context).languageCode == 'bn';
    final d = form.draft;
    final notifier = ref.read(listFormProvider(formKey).notifier);
    final experts = ref.watch(expertsProvider).value ?? const [];
    String? error(Set<RuleError> which) => l10n.ruleErrorOf(form.errors, which);
    Widget dropdown<T>(
      String label,
      T value,
      Map<T, String> items,
      void Function(T) set,
    ) => DropdownButtonFormField<T>(
      key: ValueKey('$label:$value:${items.length}'),
      initialValue: value,
      isExpanded: true,
      decoration: adminInputDecoration(context, label),
      items: [
        for (final MapEntry(:key, :value) in items.entries)
          DropdownMenuItem(value: key, child: Text(value)),
      ],
      onChanged: (v) => set(v as T),
    );
    final titleError = error({RuleError.listTitleBlank});
    final noteError = error({RuleError.listNoteTooLong});
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 14,
      children: [
        AdminTextField(
          label: l10n.adminCatalogFieldTitleEn,
          initialValue: d.titleEn,
          error: titleError,
          onChanged: (v) => notifier.edit((d) => d.copyWith(titleEn: v)),
        ),
        AdminTextField(
          label: l10n.adminCatalogFieldTitleBnBanner,
          initialValue: d.titleBn,
          error: titleError,
          onChanged: (v) => notifier.edit((d) => d.copyWith(titleBn: v)),
        ),
        AdminTextField(
          label: l10n.adminCatalogFieldNoteEn,
          initialValue: d.noteEn,
          error: noteError,
          multiline: true,
          onChanged: (v) => notifier.edit((d) => d.copyWith(noteEn: v)),
        ),
        AdminTextField(
          label: l10n.adminCatalogFieldNoteBn,
          initialValue: d.noteBn,
          error: noteError,
          multiline: true,
          onChanged: (v) => notifier.edit((d) => d.copyWith(noteBn: v)),
        ),
        if (d.isBooklist)
          dropdown<BooklistKind>(l10n.adminCatalogFieldKind, d.kind!, {
            for (final k in BooklistKind.values)
              if (k != BooklistKind.personal) k: k.label(l10n),
          }, (k) => notifier.edit((d) => d.copyWith(kind: k)))
        else ...[
          dropdown<Section?>(l10n.adminCatalogFieldSectionOptional, d.section, {
            null: l10n.adminCatalogNoSection,
            for (final s in Section.values) s: s.label(l10n),
          }, (s) => notifier.edit((d) => d.copyWith(section: s))),
          dropdown<String?>(l10n.adminCatalogFieldExpert, d.expertId, {
            null: l10n.adminCatalogNoExpert,
            // Still loading: keep the picked one so the menu has it.
            ?d.expertId: '…',
            for (final e in experts) e.id: e.label(isBangla),
          }, (e) => notifier.edit((d) => d.copyWith(expertId: e))),
        ],
      ],
    );
  }
}
