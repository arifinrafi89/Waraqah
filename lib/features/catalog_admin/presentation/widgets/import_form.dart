import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/csv_import.dart';
import 'admin_text_field.dart';

/// The Import page's paste box: the header to use, the rows, and Paste
/// example and Check buttons. [onChanged] runs on any edit.
class ImportForm extends StatelessWidget {
  const ImportForm({
    super.key,
    required this.csv,
    required this.onChanged,
    required this.onCheck,
  });

  final TextEditingController csv;
  final VoidCallback onChanged;
  final VoidCallback onCheck;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: Insets.md,
      children: [
        Text(l10n.adminCatalogImportHint, style: context.texts.bodySmall),
        SelectableText(CsvImport.header, style: context.texts.labelSmall),
        TextField(
          controller: csv,
          minLines: 6,
          maxLines: 12,
          style: context.texts.bodySmall,
          decoration: adminInputDecoration(
            context,
            l10n.adminCatalogImportField,
          ),
          onChanged: (_) => onChanged(),
        ),
        Row(
          spacing: Insets.sm,
          children: [
            Expanded(
              child: SecondaryButton(
                label: l10n.adminCatalogImportExample,
                onPressed: () {
                  csv.text = CsvImport.example;
                  onChanged();
                },
              ),
            ),
            Expanded(
              child: PrimaryButton(
                label: l10n.adminCatalogImportCheck,
                onPressed: onCheck,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
