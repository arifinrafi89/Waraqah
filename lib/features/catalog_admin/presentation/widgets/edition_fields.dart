import 'package:flutter/material.dart';

import '../../../../core/models/edition.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/segmented_selector.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/presentation/widgets/edition_labels.dart';
import '../../domain/entities/catalog_admin_rules.dart';
import 'admin_text_field.dart';
import 'rule_error_labels.dart';

/// An Edition's format, language, prices, stock, pre-order and ISBN. An
/// eBook shows only its prices: it never runs out and has no ISBN.
class EditionFields extends StatelessWidget {
  const EditionFields({
    super.key,
    required this.edition,
    required this.errors,
    required this.onChanged,
  });

  final Edition edition;
  final Set<RuleError> errors;
  final ValueChanged<Edition> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final e = edition;
    String? error(Set<RuleError> which) => l10n.ruleErrorOf(errors, which);
    String text(int? n) => n == null || n == 0 ? '' : '$n';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: Insets.md,
      children: [
        Text(l10n.adminCatalogFieldFormat, style: context.texts.titleSmall),
        SegmentedSelector<BookFormat>(
          options: BookFormat.values,
          labels: [for (final f in BookFormat.values) l10n.formatLabel(f)],
          value: e.format,
          onChanged: (f) => onChanged(e.copyWith(format: f)),
        ),
        Text(
          l10n.adminCatalogFieldEditionLanguage,
          style: context.texts.titleSmall,
        ),
        SegmentedSelector<BookLanguage>(
          options: BookLanguage.values,
          labels: [for (final l in BookLanguage.values) l10n.languageLabel(l)],
          value: e.language,
          onChanged: (l) => onChanged(e.copyWith(language: l)),
        ),
        if (errors.contains(RuleError.editionTaken))
          Text(
            l10n.ruleError(RuleError.editionTaken),
            style: context.texts.bodySmall?.copyWith(
              color: context.palette.danger,
            ),
          ),
        AdminTextField(
          label: l10n.adminCatalogFieldPrice,
          number: true,
          initialValue: text(e.priceBdt),
          error: error({RuleError.priceNotPositive}),
          onChanged: (v) =>
              onChanged(e.copyWith(priceBdt: int.tryParse(v) ?? 0)),
        ),
        AdminTextField(
          label: l10n.adminCatalogFieldListPrice,
          number: true,
          initialValue: text(e.listPriceBdt),
          error: error({RuleError.listPriceTooLow}),
          onChanged: (v) =>
              onChanged(e.copyWith(listPriceBdt: int.tryParse(v))),
        ),
        if (e.format == BookFormat.ebook)
          Text(l10n.adminCatalogEbookNote, style: context.texts.bodySmall)
        else ...[
          AdminTextField(
            label: l10n.adminCatalogFieldStock,
            number: true,
            initialValue: '${e.stock}',
            error: error({RuleError.stockNegative}),
            onChanged: (v) =>
                onChanged(e.copyWith(stock: int.tryParse(v) ?? 0)),
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(l10n.adminCatalogFieldPreorder),
            value: e.isPreorder,
            onChanged: (on) => onChanged(e.copyWith(isPreorder: on)),
          ),
          AdminTextField(
            label: l10n.adminCatalogFieldIsbn,
            initialValue: e.isbn ?? '',
            error: error({RuleError.isbnInvalid, RuleError.isbnTaken}),
            onChanged: (v) => onChanged(e.copyWith(isbn: v)),
          ),
        ],
      ],
    );
  }
}
