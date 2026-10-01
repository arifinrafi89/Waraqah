import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/catalog_record.dart';
import '../providers/catalog_admin_providers.dart';
import 'admin_list_skeleton.dart';
import 'record_sheet.dart';

/// Picks an Author or Publisher by name, or adds a new one. Closes with
/// the picked id.
Future<String?> showRecordPicker(BuildContext context, RecordKind kind) =>
    showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) =>
          FractionallySizedBox(heightFactor: 0.8, child: _RecordPicker(kind)),
    );

class _RecordPicker extends ConsumerStatefulWidget {
  const _RecordPicker(this.kind);

  final RecordKind kind;

  @override
  ConsumerState<_RecordPicker> createState() => _RecordPickerState();
}

class _RecordPickerState extends ConsumerState<_RecordPicker> {
  var _query = '';

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final isBangla = Localizations.localeOf(context).languageCode == 'bn';
    bool matches(CatalogRecord r) =>
        '${r.name} ${r.nameBn}'.toLowerCase().contains(_query.toLowerCase());
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Insets.screen),
          child: AppTextField(
            hint: l10n.adminCatalogSearchRecords,
            icon: Icons.search_rounded,
            autofocus: true,
            onChanged: (q) => setState(() => _query = q.trim()),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.add_rounded),
          title: Text(l10n.adminCatalogAddNew),
          onTap: () async {
            final added = await showRecordSheet(
              context,
              widget.kind,
              CatalogRecord(name: _query),
            );
            if (added != null && context.mounted) {
              Navigator.pop(context, added.id);
            }
          },
        ),
        Expanded(
          child: AsyncView(
            value: ref.watch(adminRecordsProvider(widget.kind)),
            skeleton: const AdminListSkeleton(),
            errorLabel: l10n.commonSomethingWentWrong,
            retryLabel: l10n.commonRetry,
            onRetry: () => ref.invalidate(adminRecordsProvider(widget.kind)),
            builder: (records) => ListView(
              children: [
                for (final r in records.where(matches))
                  ListTile(
                    title: Text(r.label(isBangla)),
                    onTap: () => Navigator.pop(context, r.id),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
