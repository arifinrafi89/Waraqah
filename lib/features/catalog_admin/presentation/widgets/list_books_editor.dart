import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/presentation/widgets/book_picker_sheet.dart';
import '../../domain/entities/catalog_admin_rules.dart';
import '../providers/catalog_admin_providers.dart';
import '../providers/list_form_provider.dart';
import 'rule_error_labels.dart';

/// The builder's books in order: "Add books" opens the book picker; each
/// row moves up, down or out.
class ListBooksEditor extends ConsumerWidget {
  const ListBooksEditor({super.key, required this.form, required this.formKey});

  final ListForm form;
  final ListFormKey formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final ids = form.draft.bookIds;
    final notifier = ref.read(listFormProvider(formKey).notifier);
    final books = {
      for (final b in ref.watch(adminBooksProvider).value ?? const []) b.id: b,
    };
    final error = l10n.ruleErrorOf(form.errors, {
      RuleError.listNoBooks,
      RuleError.listDuplicateBook,
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                l10n.adminCatalogListBooks,
                style: context.texts.titleMedium,
              ),
            ),
            TextButton.icon(
              icon: const Icon(Icons.add_rounded),
              label: Text(l10n.adminCatalogAddBooks),
              onPressed: () => showBookPickerSheet(
                context,
                picked: ids,
                onPick: notifier.pick,
              ),
            ),
          ],
        ),
        if (error != null)
          Text(
            error,
            style: context.texts.bodySmall?.copyWith(
              color: context.palette.danger,
            ),
          ),
        for (final (i, id) in ids.indexed)
          Card(
            margin: const EdgeInsets.only(top: Insets.sm),
            child: ListTile(
              contentPadding: const EdgeInsets.only(left: Insets.md),
              title: Text(books[id]?.title ?? id, maxLines: 2),
              subtitle: books[id] == null ? null : Text(books[id]!.author),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_upward_rounded),
                    tooltip: l10n.adminCatalogMoveUp,
                    onPressed: i == 0 ? null : () => notifier.move(i, -1),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_downward_rounded),
                    tooltip: l10n.adminCatalogMoveDown,
                    onPressed: i == ids.length - 1
                        ? null
                        : () => notifier.move(i, 1),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close_rounded),
                    tooltip: l10n.adminCatalogRemoveBook,
                    onPressed: () => notifier.remove(i),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
