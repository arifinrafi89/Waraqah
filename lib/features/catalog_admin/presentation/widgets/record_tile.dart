import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/catalog_record.dart';
import '../providers/catalog_admin_actions.dart';
import 'record_sheet.dart';

/// One Category, Author or Publisher: names and how many Books use it.
/// Tap to edit; delete only when no Book uses it.
class RecordTile extends ConsumerWidget {
  const RecordTile({super.key, required this.kind, required this.record});

  final RecordKind kind;
  final CatalogRecord record;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final inUse = record.bookCount > 0;
    return Card(
      margin: EdgeInsets.zero,
      child: ListTile(
        title: Text(record.name, style: context.texts.titleSmall),
        subtitle: Text(
          [
            if (record.nameBn.isNotEmpty) record.nameBn,
            l10n.adminCatalogBookCount(record.bookCount),
          ].join(' · '),
        ),
        onTap: () => showRecordSheet(context, kind, record),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline_rounded),
          tooltip: inUse
              ? l10n.adminCatalogUsedBy(record.bookCount)
              : l10n.adminCatalogDelete,
          onPressed: inUse ? null : () => _delete(context, ref),
        ),
      ),
    );
  }

  Future<void> _delete(BuildContext context, WidgetRef ref) async {
    final messenger = ScaffoldMessenger.of(context);
    final l10n = AppL10n.of(context)!;
    try {
      await ref
          .read(catalogAdminActionsProvider)
          .deleteRecord(kind, record.id!);
      messenger.showSnackBar(SnackBar(content: Text(l10n.adminCatalogDeleted)));
    } catch (_) {
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.commonSomethingWentWrong)),
      );
    }
  }
}
