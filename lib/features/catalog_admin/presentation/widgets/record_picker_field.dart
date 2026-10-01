import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/catalog_record.dart';
import '../providers/catalog_admin_providers.dart';
import 'admin_text_field.dart';
import 'record_picker_sheet.dart';
import 'rule_error_labels.dart';

/// The Book form's Author or Publisher: shows the picked one's name and
/// opens [showRecordPicker] on tap.
class RecordPickerField extends ConsumerWidget {
  const RecordPickerField({
    super.key,
    required this.kind,
    required this.id,
    required this.onPicked,
    this.error,
  });

  final RecordKind kind;
  final String id;
  final ValueChanged<String> onPicked;
  final String? error;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final isBangla = Localizations.localeOf(context).languageCode == 'bn';
    final records = ref.watch(adminRecordsProvider(kind)).value ?? const [];
    final picked = records.where((r) => r.id == id).firstOrNull;
    return InkWell(
      onTap: () async {
        final pickedId = await showRecordPicker(context, kind);
        if (pickedId != null) onPicked(pickedId);
      },
      child: InputDecorator(
        decoration: adminInputDecoration(
          context,
          l10n.recordKind(kind),
          error: error,
        ).copyWith(suffixIcon: const Icon(Icons.expand_more_rounded)),
        child: Text(
          picked?.label(isBangla) ?? l10n.adminCatalogPick,
          style: context.texts.bodyMedium?.copyWith(
            color: picked == null ? context.palette.textFaint : null,
          ),
        ),
      ),
    );
  }
}
