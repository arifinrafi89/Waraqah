import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/presentation/widgets/edition_labels.dart';
import '../../domain/entities/catalog_admin_rules.dart' show RuleError;
import '../providers/book_form_provider.dart';
import 'edition_sheet.dart';
import 'rule_error_labels.dart';

/// The Book's Editions: tap one to edit it, ✕ to remove it, or add one.
class EditionListEditor extends ConsumerWidget {
  const EditionListEditor({super.key, required this.form, this.bookId});

  final BookForm form;
  final String? bookId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final notifier = ref.read(bookFormProvider(bookId).notifier);
    final editions = form.draft.editions;
    Future<void> open([int? at]) async {
      final edition = await showEditionSheet(
        context,
        bookId: bookId,
        edition: at == null ? null : editions[at],
        siblings: [
          for (final (i, e) in editions.indexed)
            if (i != at) e,
        ],
      );
      if (edition != null) await notifier.putEdition(edition, at: at);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: Insets.sm,
      children: [
        Text(l10n.adminCatalogEditions, style: context.texts.titleSmall),
        for (final (i, e) in editions.indexed)
          Card(
            margin: EdgeInsets.zero,
            child: ListTile(
              title: Text(
                '${l10n.formatLabel(e.format)} · ${l10n.languageLabel(e.language)}',
              ),
              subtitle: Text(
                '${Bdt.format(e.priceBdt)} · ${l10n.editionStock(e)}',
              ),
              onTap: () => open(i),
              trailing: IconButton(
                icon: const Icon(Icons.close_rounded),
                tooltip: l10n.adminCatalogRemoveEdition,
                onPressed: () => notifier.removeEdition(i),
              ),
            ),
          ),
        if (form.errors.contains(RuleError.noEditions))
          Text(
            l10n.ruleError(RuleError.noEditions),
            style: context.texts.bodySmall?.copyWith(
              color: context.palette.danger,
            ),
          ),
        SecondaryButton(
          label: l10n.adminCatalogAddEdition,
          icon: const Icon(Icons.add_rounded, size: 18),
          onPressed: open,
        ),
      ],
    );
  }
}
